require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  describe "GET index" do
    subject! { get :index }

    it "assigns @posts as Post.all relation" do
      expect(assigns(:posts)).to eq(Post.all)
    end

    it "renders the index template in admin layout" do
      expect(response).to render_template('index')
      expect(response).to render_with_layout('admin')
    end

    it "returns HTTP 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET show" do
    let(:post) { create :post }
    subject! { get :show, params: { id: post.id } }

    it "assigns @post with Post by ID param" do
      expect(assigns(:post)).to eq(post)
    end

    it "renders the edit template in admin layout" do
      expect(response).to render_template('edit')
      expect(response).to render_with_layout('admin')
    end

    it "returns HTTP 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET new" do
    subject! { get :new }
    it "assigns @post with new Post" do
      expect(assigns(:post)).to be_a_new(Post)
    end

    it "renders the new template in admin layout" do
      expect(response).to render_template('new')
      expect(response).to render_with_layout('admin')
    end
    
    it "returns HTTP 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST create" do
    context "with valid params" do
      subject! { post :create, params: {post: {title: "Created Post title", body: "Some body!" }} }

      it "assigns @post with persisted Post" do
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).not_to be_new_record # persisted
      end

      it "redirects to edit" do
        expect(response).to redirect_to(edit_admin_post_url(assigns(:post)))
      end
    end

    context "with invalid params" do
      subject! { post :create, params: {post: {title: "Created Post title"}} }

      it "assigns @post with new Post" do
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_new_record # not persisted
      end

      it "renders the new template in admin layout" do
        expect(response).to render_template('new')
        expect(response).to render_with_layout('admin')
      end
    end
  end

  describe "PUT update" do
    let(:post) { create :post }
    subject! { put :update, params: {id: post.id, post: {title: "Updated Post title", body: "Some new body..." }} }

    it "assigns @post with saved Post" do
      expect(assigns(:post)).to be_a(Post)
      expect(assigns(:post).changed?).to be false # changes have been saved
    end

    it "redirects to edit" do
      expect(response).to redirect_to(edit_admin_post_url(assigns(:post)))
    end
  end

  describe "DELETE destroy" do
    it "removes post from database" do
      first_post = create :post
      second_post = create :post
      delete :destroy, params: { id: first_post.id }

      expect(Post.all.to_a).to eq [second_post]
    end

    it "redirects to index" do
      post = create :post
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to(admin_posts_path)
    end
  end
end
