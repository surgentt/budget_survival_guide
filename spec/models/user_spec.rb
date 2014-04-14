require 'spec_helper'

describe User do

  it "is valid with a email and password" do 
    user = User.new(email: "surgentt@gmail.com", password: 'password', password_confirmation: "password")
    expect(user).to be_valid
  end

  it "is invalud without an email" do 
    user = User.new(email: "")  
    expect(user).to have(2).errors_on(:email)
  end

  it "is invalud without a password" do 
    user = User.new(password: "")  
    expect(user).to have(2).errors_on(:password)
  end

  describe "password format and presence" do 
    it "needs a password in order to be present" do 
      user = User.new(email: "Surgentt@gmail.com", password: '', password_confirmation: "")
      expect(user).to have(2).errors_on(:password)
    end

    it "expects password and password_confirmation to match" do 
      user = User.new(email: "Surgentt@gmail.com", password: 'doesntmatch', password_confirmation: "something else")
      expect(user).to have(1).errors_on(:password_confirmation)
    end

    it "does not accept a password under 6 chacters in lenght" do 
      user = User.new(email: "Surgentt@gmail.com", password: 'short', password_confirmation: "short")
      expect(user).to have(1).errors_on(:password)
    end
  end    

  describe "emails format" do 
    before do 
      @user = User.new(email: "Surgentt@gmail.com", password: 'password', password_confirmation: "password")
    end

    it "does not accept emails that are not valid format" do 
      emails = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      emails.each do |invalid_emails|
        @user.email = invalid_emails
        expect(@user).to have(1).errors_on(:email)
      end
    end

    it "should only allow emails with a valid format" do
      emails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      emails.each do |valid_email|
        @user.email = valid_email
        expect(@user).to be_valid
      end
    end

    it "is invalud with a duplicate email address, capitalization should be ignored" do 
      @user.save
      user2 = User.new(email: "surGentt@gmail.com")
      expect(user2).to have(1).errors_on(:email)
    end
  end

  describe "authentication" do 
    before do 
      @user = User.create(email: "surgentt@gmail.com", password: 'password', password_confirmation: "password")
    end

    let(:found_user) { User.find_by(email: @user.email) }

    it "returns the user with a valid password" do 
      #binding.pry
      expect(@user.authenticate("password")).to eq(found_user)
    end

    it "does not return the user with an invalid password" do 
      expect(found_user.authenticate("incorrectpassword")).to eq(false)
    end

  end
end
