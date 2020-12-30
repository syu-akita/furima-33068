require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    
    it "全ての項目が入力されていると登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが重複していると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは6文字以上出ないと登録できない" do
      @user.password = "A1234"
      @user.password_confirmation = "A1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは半角英数がないと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it "passwordとpassword_confirmationが一致していないと登録できない" do
      @user.password = "A12345"
      @user.password_confirmation = "A123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空だと登録できない" do
    end
    it "first_nameが空だと登録できない" do
    end
    it "last_nameは全角出ないと登録できない" do
    end
    it "first_nameは全角でないと登録できない" do
    end
    it "last_name_kは空だと登録できない" do
    end
    it "first_name_kは空だと登録できない" do
    end
    it "last_name_kは全角でないと登録できない" do
    end
    it "first_name_kは全角でないと登録できない" do
    end
    it "birthdayは空だと登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end