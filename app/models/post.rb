#coding: UTF-8

class Post < ActiveRecord::Base
	validates :content, :title, presence: true
	validates :user_id, presence: true

	belongs_to :user
	has_many :comments
	has_many :users, through: :comments
end