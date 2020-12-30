require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目が入力されていると登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは@を含めないと登録できない' do
      @user.email = 'yamada.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'emailが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは6文字以上出ないと登録できない' do
      @user.password = 'A1234'
      @user.password_confirmation = 'A1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは英字のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは全角文字では登録できない' do
      @user.password = 'パスワードパスワード'
      @user.password_confirmation = 'パスワードパスワード'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'password_confirmationが空だと登録できない' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'passwordとpassword_confirmationが一致していないと登録できない' do
      @user.password = 'A12345'
      @user.password_confirmation = 'A123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
    end
    it 'last_nameは全角出ないと登録できない' do
      @user.last_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'first_nameは全角でないと登録できない' do
      @user.first_name = 'itirou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'last_name_kは空だと登録できない' do
      @user.last_name_k = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name k can't be blank", 'Last name k is invalid')
    end
    it 'first_name_kは空だと登録できない' do
      @user.first_name_k = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k can't be blank", 'First name k is invalid')
    end
    it 'last_name_kはカタカナでないと登録できない' do
      @user.last_name_k = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name k is invalid')
    end
    it 'first_name_kはカタカナでないと登録できない' do
      @user.first_name_k = 'いちろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name k is invalid')
    end
    it 'birthdayは空だと登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
