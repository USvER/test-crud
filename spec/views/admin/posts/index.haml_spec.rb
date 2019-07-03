require "spec_helper"

describe "admin/posts/index.haml" do
  it "displays posts in a table" do
    assign(:posts, [
      Post.create!({title: "First Post", body: "Some Body"}),
      Post.create!({title: "Second Post", body: "Some Another Body"}),
    ])

    render

    expect(rendered).to match /First Post/
    expect(rendered).to match /Second Post/
    expect(rendered).to have_tag("table", with: {class: "posts-listing"})
  end

  it "displays posts edit/delete actions links" do
    new_post = Post.create!({title: "First Post", body: "Some Body"})
    assign(:posts, [new_post])

    render

    expect(rendered).to have_tag("a", with: {href: edit_admin_post_path(new_post)})
    expect(rendered).to have_tag("a", with: {href: admin_post_path(new_post), "data-method": "delete"})
  end
end