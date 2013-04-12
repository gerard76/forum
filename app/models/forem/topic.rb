class Forem::Topic < ActiveRecord::Base

  def self.search(q)
    where("MATCH (subject) AGAINST (?)", q)
  end
end