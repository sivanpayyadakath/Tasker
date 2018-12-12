require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validity of model' do

    it 'is is valid with valid attributes' do
      user = FactoryBot.build(:user, name: 'sivan', email: 'sivanp77@gmail.com', password: '12345678', password_confirmation: '12345678' )
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'name must be less than 50 characters' do
      user = FactoryBot.build(:user, name: 'a'* 51)
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 50 characters)")
    end

    it 'is not valid without a email' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'email cannot be duplicated' do
      user = FactoryBot.create(:user, email: 'sivanp77@gmail.com')
      user2 = FactoryBot.build(:user, email: 'sivanp77@gmail.com')
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'email must be less than 255 characters' do
      user = FactoryBot.build(:user, email: 'a'* 256)
      user.valid?
      expect(user.errors[:email]).to include("is too long (maximum is 255 characters)")
    end

    it 'email should have valid format' do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |add|
        user = FactoryBot.build(:user, email: add)
        expect(user).to be_valid
      end
    end

    it 'email should have valid format' do
      addresses = %w[userfoo.COM A_US-ER-f.b.org frst.lst@foo-jp a+b#baz.cn]
      addresses.each do |add|
        user = FactoryBot.build(:user, email: add)
        expect(user).not_to be_valid
      end
    end

    it 'should validate_uniqueness_of case sensitivity email' do
      user = FactoryBot.create(:user, email: 'sivanp77@gmail.com')
      user2 = FactoryBot.build(:user, email: 'SIVANP77@gmail.com')
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'password cant be blank' do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'password should match' do
      user = FactoryBot.build(:user, password: '12345678', password_confirmation: '123456789' )
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'length of password is atleast 6 characters' do
      user = FactoryBot.build(:user, password: '12345')
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'destroys dependent tasks' do
      user = FactoryBot.create(:user)
      todo = FactoryBot.create(:todo, user: user)
      expect{user.destroy}.to change { Todo.count }.by(-1)
    end

    it 'email should be downcased before save' do
      user = FactoryBot.create(:user, email: 'SIVANP77@GMAIL.COM')
      user.email.should == 'sivanp77@gmail.com'
    end


  end
end
