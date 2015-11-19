require 'rails_helper'


RSpec.describe PostsController, :type => :controller do

  context "#index" do
    it "assigns all posts as @posts" do
      get :index
      response.should be_success
      expect(assigns(:posts)).should_not be_nil
    end
  end

  context "#new" do
    it "assigns a new post as @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  context "#create" do
    it "creates a new Post" do
      post :new
      expect(assigns(:post)).to be_a(Post)
    end
  end

  context '#destroy' do
    before :each do
      @post = Post.create(:title=>"T", :content=>"C")
    end
    it 'deletes the post' do
      expect {
        delete :destroy, id: @post
      }.to change(Post, :count).by(-1)
    end
    it 'redirect ot #index' do
      delete :destroy, id: @post
      expect(response).to redirect_to posts_path
    end
  end
end
