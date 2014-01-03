require 'spec_helper'

describe Post do
  it { should belong_to :user }
  it { should have_many(:meows).dependent(:destroy) }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should_not have_valid(:image).when(nil, "") }

  it { should have_valid(:description).when(nil, "", ("a"*140)) }
  it { should_not have_valid(:description).when("a"*141) }

  describe ".by_recency" do
    it "orders the posts by most recent first" do
      post1 = FactoryGirl.create(:post, created_at: Time.now - 3.days)
      post2 = FactoryGirl.create(:post, created_at: Time.now - 1.day)
      post3 = FactoryGirl.create(:post, created_at: Time.now - 2.days)

      expect(Post.by_recency).to eq [post2, post3, post1]
    end
  end

  describe "#has_meow_from?" do
    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:post) }

    it "returns true if given user has already created a meow for post" do
      FactoryGirl.create(:meow, user: user, post: post)
      expect(post).to have_meow_from user
    end

    it "returns false if given user has not already created a meow for post" do
      expect(post).to_not have_meow_from user
    end
  end
end
