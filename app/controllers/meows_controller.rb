class MeowsController < ApplicationController
  before_filter :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    meow = current_user.meows.build
    meow.post = post

    if meow.save
      redirect_to :back, notice: "We heard your Meow!"
    else
      redirect_to :back
    end
  end
end
