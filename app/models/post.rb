class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :raw_content, :subject

  validates_presence_of :subject, :raw_content, :user
end
