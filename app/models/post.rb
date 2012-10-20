class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :subject

  validates_presence_of :subject, :content, :user
end
