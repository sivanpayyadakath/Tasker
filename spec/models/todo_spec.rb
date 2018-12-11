# require 'rails_helper'
#
# RSpec.describe Todo, type: :model do
#
#   let(:todo) { FactoryBot.create(:todo) }
#
#   it 'is valid with valid attributes' do
#     expect(FactoryBot.build(:todo)).to be_valid
#   end
#
#   it 'is not valid without a title' do
#     todo = FactoryBot.build(:todo, title: nil)
#     todo.valid?
#     expect(todo.errors[:title]).to include("can't be blank")
#   end
#
#   it 'title length must be less than 50 characters' do
#     todo = FactoryBot.build(:todo, title: 'a' * 51)
#     todo.valid?
#     expect(todo.errors[:title]).to include('is too long (maximum is 50 characters)')
#   end
#
#   it 'content length must be less than 250 characters' do
#     todo = FactoryBot.build(:todo, content: 'a' * 251)
#     todo.valid?
#     expect(todo.errors[:content]).to include('is too long (maximum is 250 characters)')
#   end
#
# end
