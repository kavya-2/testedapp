require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  current_user = User.find_or_create!(email: 'ggy14938@zwoho.com', password: 'password', password_confirmation: 'password')

  before(:each) do
    @post = assign(:post, Post.create!(
      title: "MyString",
      body: "MyText",
      user: current_user,
      views: 1
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[body]"
    end
  end
end
