require 'rails_helper'

RSpec.describe TodosController, type: :controller do

  let(:todo) { FactoryBot.create(:todo) }
  let(:user) { FactoryBot.create(:user) }
  let(:todo2){ FactoryBot.create(:todo2) }

  describe 'GET #new' do

    before :each do
      login user
    end

    it 'render the new task template' do
      get :new, params: {user_id: user.id}
      expect(response).to render_template :new
    end

    it 'redirect to index page on creating tasks' do
      post :create, params: {user_id: user.id, todo: {title: "title", content: "content", deadline_at: "2019/1/1", }, tags: ""}
      expect(response).to redirect_to user_todos_path(user)
    end

    it 're-renders the new template when no title is given for task' do
      post :create, params: {user_id: user.id, todo: {title: "", content: "content", deadline_at: "2019/1/1", }, tags: "" }
      expect(response).to render_template :new
    end

    it 're-renders the new template when deadline is already past' do
      post :create, params: {user_id: user.id, todo: {title: "title", content: "content", deadline_at: "2018/1/1", }, tags: "" }
      expect(response).to render_template :new
    end

  end


  describe 'GET #index ' do

    before :each do
      login(user)
    end

    it 'render the index template' do
      get :index
      expect(response).to render_template :index
    end

  end

end

