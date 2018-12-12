require 'rails_helper'

RSpec.describe Todo, type: :model do

  let(:user) { FactoryBot.create(:user) }

  describe 'validity of model' do

    it 'is valid with valid attributes' do
      expect(FactoryBot.build(:todo, title: 'a',user: user)).to be_valid
    end

    it 'is not valid without a title' do
      todo = FactoryBot.build(:todo, title: nil , user: user)
      todo.valid?
      expect(todo.errors[:title]).to include("can't be blank")
    end

    it 'title length must be less than 50 characters' do
      todo = FactoryBot.build(:todo, title: 'a' * 51 , user: user)
      todo.valid?
      expect(todo.errors[:title]).to include('is too long (maximum is 50 characters)')
    end

    it 'content length must be less than 250 characters' do
      todo = FactoryBot.build(:todo, title: 'a', content: 'a' * 251, user: user)
      todo.valid?
      expect(todo.errors[:content]).to include('is too long (maximum is 250 characters)')
    end

    it 'default scope must be based on descending of time created' do
      todo = FactoryBot.create(:todo,title: 'a', created_at: 10.minutes.ago, user: user)
      todo2 = FactoryBot.create(:todo,title: 'a', created_at: 5.minutes.ago, user: user)
      Todo.all.should eq [todo2, todo]
    end

    it 'deadline cannot be in the past' do
      todo = FactoryBot.build(:todo , title: 'a', deadline_at: 10.minutes.ago, user: user)
      expect(todo).to_not be_valid
    end
  end

end
