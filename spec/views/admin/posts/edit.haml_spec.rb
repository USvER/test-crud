require "spec_helper"

describe "admin/posts/edit.haml" do
  it "displays post edit form" do
    new_post = Post.create!({title: "First Post", body: "Some Body"})
    assign(:post, new_post)

    render
    
    expect(rendered).to have_tag("form", with: {action: admin_post_path(new_post)})
  end

  it "display error messages on bad input" do
    new_post = Post.new({title: "", body: ""})
    new_post.save
    assign(:post, new_post)
    
    render

    expect(rendered).to have_tag("div", with: {class: "alert-danger"})
  end
end