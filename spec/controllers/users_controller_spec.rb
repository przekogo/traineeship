require "rails_helper"

RSpec.describe UsersController, type: :controller do
	before(:each) do
		@user=User.create(email: 'test@test.test', password: 'testerter')
		sign_in @user
	end
	describe "GET #index" do
		it "should render properly with status 200" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
	end
end