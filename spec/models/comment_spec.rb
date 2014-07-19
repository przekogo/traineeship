require "rails_helper"
RSpec.describe Comment, type: :model  do

	it 'should have attributes :content, :user_id, :post_id'  do
		expect(subject.attributes).to include('content','user_id','post_id')
	end
	it 'should validate input' do
		expect(Comment.new).not_to be_valid
		expect(Comment.new(content:"testcomment", user_id: 1, post_id: 2)).to be_valid
	end
	it 'should belong to user' do
		t = Comment.reflect_on_association(:user)
		expect(t.macro).to equal :belongs_to
	end
	it 'should belong to post' do
		t = Comment.reflect_on_association(:post)
		expect(t.macro).to equal :belongs_to
	end

end