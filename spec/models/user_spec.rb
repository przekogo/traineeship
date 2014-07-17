require "rails_helper"
RSpec.describe User, type: :model  do
	it 'should have attributes :email, :encrypted_password'  do
		expect(subject.attributes).to include('email','encrypted_password')
	end
	it 'should validate input' do
		expect(User.new).not_to be_valid
		expect(User.new(email:"hop@hyc.ha", password:"niewiadomo")).to be_valid
	end
	it 'should have many comments' do
		t = User.reflect_on_association(:comments)
		expect(t.macro).to equal :has_many
	end
end