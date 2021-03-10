require 'rails_helper'

RSpec.describe User do
  describe '#create' do
    it "名前,メールアドレス,パスワード,パスワード(確認)があれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "名前がブランクだと登録できない" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "既に登録されている名前は登録できない" do
      user = create(:user)
      another_user = build(:user, name: user.name)
      another_user.valid?
      expect(another_user.errors[:name]).to include("はすでに存在します")
    end

    it "名前が7文字以内だと登録できる " do
      user = build(:user, name: "テストユーザー")
      user.valid?
      expect(user).to be_valid
    end

    it "名前が7文字以上だと登録できない " do
      user = build(:user, name: "登録できないテストユーザー")
      user.valid?
      expect(user.errors[:name]).to include("は7文字以内で入力してください")
    end

    it "メールアドレスがブランクだと登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "既に登録しているメールアドレスは登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードがブランクだと登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードを入力してもパスワード(確認)がブランクだと登録ができない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    context "パスワードが6文字以上" do
      it "登録できる " do
        user = build(:user, password: "123456", password_confirmation: "123456")
        user.valid?
        expect(user).to be_valid
      end
    end

    context "パスワードが5文字以下" do
      it "登録できない " do
        user = build(:user, password: "12345", password_confirmation: "12345")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end
    end
  end
end