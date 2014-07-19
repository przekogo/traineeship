require "rails_helper"
RSpec.describe Post, type: :model  do

	it 'should have attributes :content, :user_id, :title'  do
		expect(subject.attributes).to include('content','user_id','title')
	end
	it 'should validate input' do
		expect(Post.new).not_to be_valid
		expect(Post.new(content:"testpost", user_id: 1, title:"testtit")).to be_valid
	end
	it 'should belong to user' do
		t = Post.reflect_on_association(:user)
		expect(t.macro).to equal :belongs_to
	end
	it 'should have many comments' do
		t = Post.reflect_on_association(:comments)
		expect(t.macro).to equal :has_many
	end

end