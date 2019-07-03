require "spec_helper"

describe "admin/posts/edit.haml" do
  it "displays post edit form" do
    new_post = Post.create!({title: "First Post", body: "Some Body"})
    assign(:post, new_post)

    render
    
    expect(rendered).to have_tag("form", with: {action: admin_post_path(new_post)})
  end
end