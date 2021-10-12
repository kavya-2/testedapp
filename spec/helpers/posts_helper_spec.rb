require 'rails_helper'
include PostsHelper
RSpec.describe PostsHelper, type: :helper do
  it 'assigns a user to a post' do
    #Arranging our data => Assigning variables
    creator = User.find_or_create!(email: 'ggy14938@zwoho.com', password: 'password', password_confirmation: 'password')
    @post = Post.new(title: 'MyString', body: 'MyTest', views: 1)

    #Act => We're acting with our arranged variables
    returned_post = assign_post_creator(@post,creator)

    #Assert => Assert that our expected outcome matches our actual outcome
    expect(returned_post.user).to be(creator)
  end
end
