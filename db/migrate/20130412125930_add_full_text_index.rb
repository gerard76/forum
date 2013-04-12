class AddFullTextIndex < ActiveRecord::Migration
  def up
    execute('ALTER TABLE forem_posts ENGINE  = MyISAM')
    execute('ALTER TABLE forem_topics ENGINE = MyISAM')
    execute('CREATE FULLTEXT INDEX fulltext_index ON forem_posts (text)')
    execute('CREATE FULLTEXT INDEX fulltext_index ON forem_topics(subject)')
  end

  def down
    remove_index :forem_posts, name: 'fulltext_index'
    remove_index :forem_topics, name: 'fulltext_index'
    execute('ALTER TABLE forem_posts ENGINE  = innodb')
    execute('ALTER TABLE forem_topics ENGINE = innodb')
  end
end
