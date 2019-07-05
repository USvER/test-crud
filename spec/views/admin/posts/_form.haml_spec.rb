require "spec_helper"

describe "admin/posts/_form.haml" do
  it "displays form" do
    new_post = Post.create!({title: "First Post", body: "Some Body"})
    assign(:post, new_post)

    render

    expect(rendered).to have_tag("form")
  end

  it "displays title input" do
    new_post = Post.create!({title: "First Post", body: "Some Body"})
    assign(:post, new_post)

    render

    expect(rendered).to have_tag("input", with: {name: "post[title]"})
  end

  it "displays body textarea" do
    new_post = Post.create!({title: "First Post", body: "Some Body"})
    assign(:post, new_post)

    render

    expect(rendered).to have_tag("textarea", with: {name: "post[body]"})
  end

end