require 'rails_helper'

Rspec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "全ての項目が入力されていると登録できる" do
    end
    it "nicknameが空だと登録できない" do
    end
    it "emailが空だと登録できない" do
    end
    it "emailが重複していると登録できない" do
    end
    it "passwordが空だと登録できない" do
    end
    it "passwordは6文字以上出ないと登録できない" do
    end
    it "passwordは半角英数がないと登録できない" do
    end
    it "password_confiramationが空だと登録できない" do
    end
    it "passwordとpassword_confirmationが一致していないと登録できない" do
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
    end
  end
end