require 'net/ssh'
require 'net/sftp'

namespace :app do
  desc "sync development DB with production"
  
  task :sync => :environment do
    puts "Starting sync!"
    
    if File.exists?("#{Rails.root}/tmp/dump.sql")
      puts "Removing local database dump..."
      File.unlink("#{Rails.root}/tmp/dump.sql")
    end
    
    ssh = Configuration.sync.ssh
    db  = Configuration.sync.database
    
    Net::SSH.start(ssh.host, ssh.user_name) do |session|
      session.exec!("cd #{ssh.home}")
      
      mysqldump_options = "-Q --add-drop-table -O add-locks=FALSE -O lock-tables=FALSE --compress --ignore-table #{db.database}.stats --ignore-table #{db.database}.hits"
      
      puts "Making compressed database dump..."
      session.exec!("mysqldump -u#{db.username} -p#{db.password} #{mysqldump_options} #{db.database} | gzip > /tmp/dump.sql.gz")
      
      puts "SCP'ing database dump..."
      Net::SFTP.start(ssh.host, ssh.user_name) do |sftp|
        sftp.download!("/tmp/dump.sql.gz", "#{Rails.root}/tmp/dump.sql.gz") do |event, downloader, *args|
          puts "downloaded: #{((args[1].to_i + args[2].to_i) / 100_000).ceil.to_f / 10}MB" if event == :get
        end
      end
      
      puts "Cleaning up remote dump..."
      session.exec("rm /tmp/dump.sql.gz")
    end
    
    db = OpenStruct.new(YAML.load_file('config/database.yml')[Rails.env].symbolize_keys)
    
    puts "Importing database..."
    system "rm -f #{Rails.root}/tmp/dump.sql"
    system "gzip -d #{Rails.root}/tmp/dump.sql.gz"
    system "mysql -u#{db.username} --password=#{db.password} #{db.database} < #{Rails.root}/tmp/dump.sql"
  end
end
