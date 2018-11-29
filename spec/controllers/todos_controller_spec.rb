require 'rails_helper'

RSpec.describe TodosController, type: :controller do

  let(:todo) { FactoryBot.create(:todo) }

  describe 'GET #index ' do
    it " render the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "render the new task template" do
      get :new
      expect(response).to render_template :new
    end
  end

  # it 'redirect to index page on creating tasks' do
  #   post :create, todo: FactoryBot.build(:todo)
  #   expect(response).to render_template :index
  # end
  # context "with invalid attributes" do
  #   it "re-renders the :new template" do
  #
  #   end
  # end

  describe "with invalid attributes" do
    # it "does not save the new todo in the database" do
    #   expect{
    #     post :create,todo: attributes_for(:invalid_todo)
    #     }.not_to change(Todo, :count)
    # end
    #
    #   it "re-renders the :new template" do
    #     post :create,todo: attributes_for(:invalid_todo)
    #     expect(response).to render_template :new
    #   end
    # end
  end

  describe 'sorting link on index page' do
    before do
      todo1 = FactoryBot.create(:todo)
      todo1.created_at = '2018-11-26 06:08:32.669399'
      todo2 = FactoryBot.create(:todo)
      todo2.created_at = '2018-11-27 06:28:08.339144'
    end
    it 'link for sort by created' do
      get :index
      #click_link('orderbycreated')
      #expect(response).to have_link 'orderbycreated'
    end
  end

  describe 'changing links when pressing language change' do
      # before { click_link "日本語" }
      # it { should have_link('English')}
  end


  describe 'POST #create' do

  end

end

