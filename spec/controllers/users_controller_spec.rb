require 'spec_helper'

describe UsersController do

  describe "GET #new" do
    it "assigns a new User to @user" do 
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "Get #edit" do 
    it "assigns the requested user to @user" do 
      user = User.new(email: 'surgentt@gmail.com', password: "somthing")
      user.save
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders the :edit template" do 
      user = create(:user)
      controller.stub(:current_user).and_return(user)
      get :edit, id: user
      expect(response).to render_template :edit
    end 
  end

  describe "POST #create" do 
    before :each do 
      @user = attributes_for(:user)
    end

    context "with valid attributes" do
      it "saves the new user to the database" do 
        expect {
          post :create, user: attributes_for(:user, user_attributes: @users)
        }.to change(User, :count).by(1)
      end

      it "redirects to the home page" do 
        post :create, user: attributes_for(:user, user_attributes: @users)
        expect(response).to redirect_to root_path
      end
    end

    context "with invaluid attributes" do 
      it "does not save the new contact in the databse" do
        expect {
          post :create, user: {:email=>"surgentt", :password=>"short"}
        }.to_not change(User, :count)
      end

      it "re-renders the :new template" do 
        post :create, user: {:email=>"surgentt", :password=>"short"}
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do 
    before :each do 
      @user = User.create_guest
    end

    context "valid attributes" do
      it "located the requested @user" do 
        patch :update, id: @user, user: attributes_for(:user)
        expect(assigns(:user)).to eq(@user)
      end

      it "changes @user's attributes and specifies that the user is not a guest" do 
        controller.stub(:current_user).and_return(@user)
        patch :update, id: @user, user: attributes_for(:user)
        @user.reload
        expect(@user.email).to eq("surgentt@gmail.com")
        expect(@user.guest).to eq(false)
      end
    end

    context "with invalud attributes" do 
      it "does not change the user's attributes" do 
        expect {
          patch :update, id: @user, user: {:email=>"bademail", :password=>"short"}
        }.to_not change(User, :count)
      end

      it "re-renders the edit template" do 
        controller.stub(:current_user).and_return(@user)
        patch :update, id: @user, user: {:email=>"bademail", :password=>"short"}
        expect(response).to render_template :edit
      end
    end

  end

end
