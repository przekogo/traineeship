#coding: UTF-8

class Post < ActiveRecord::Base
	validates :content, :title, :user_id, presence: true

	belongs_to :user
	has_many :comments
end