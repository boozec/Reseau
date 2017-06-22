class PostController < ApplicationController
  def topic
    @post = Post.where(id: params['postID']).take
    if @post == nil then
      redirect_to root_path
    else
      @page_title = @post.titolo
    end
  end
end
