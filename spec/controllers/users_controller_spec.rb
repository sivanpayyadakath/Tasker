require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { FactoryBot.create(:user) }

  describe "GET #new" do


    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 're-render new if no email is given' do
      post :create, params:  { user: { name: 'sivan' ,email: '' , password: '12345678' , password_confirmation: '12345678' } }
      expect(response).to render_template :new
    end

    it 're-renders new if no email is given' do
      post :create, params:  { user: { name: '' ,email: 'sivanp77@gmail.com' , password: '12345678' , password_confirmation: '12345678' } }
      expect(response).to render_template :new
    end

    it 're-renders new if no name is given' do
      post :create, params:  { user: { name: '' ,email: 'sivanp77@gmail.com', password: '12345678' , password_confirmation: '12345678' } }
      expect(response).to render_template :new
    end

    it 're-renders new if no password is given' do
      post :create, params:  { user: { name: 'sivan' ,email: 'sivanp77@gmail.com', password: '' , password_confirmation: '' } }
      expect(response).to render_template :new
    end

    it 're-renders new if  password donot match' do
      post :create, params:  { user: { name: 'sivan' ,email: 'sivanp77@gmail.com', password: '12345678' , password_confirmation: '123456789' } }
      expect(assigns).to render_template :new
    end
  end

  #
  # describe "GET #update" do
  #
  #
  #   before(:each) do
  #     login user
  #     put :update, params: {user_id: user.id}
  #     user.reload
  #   end
  #
  #   it 'update action' do
  #     patch :update , params: { user: { name: 'sivan',email: 'sivanp77@gmail.com'} }
  #     expect(assigns(:user)).to eq(user)
  #   end
  #
  #
  # end

  # let(:user) { FactoryBot.create(:user) }
  # describe " Destroy user" do
  #   before :each do
  #     login user
  #   end
  #   it "deletes the contact" do
  #     expect {
  #       delete :destroy, params: {user_id: user.id}
  #       }.to change(User,:count).by(-1)
  #     end
  #   end


end
