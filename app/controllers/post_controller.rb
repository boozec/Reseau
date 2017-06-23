class PostController < ApplicationController
  def topic
    @post = Post.where(id: params['postID'], active: 1).take
    if @post == nil then
      redirect_to root_path
    else
      @page_title = @post.titolo
    end
  end

  def addVote
    if Post.where(id: params['id'], active: 1).take == nil then
      redirect_to root_path
    else
      @page_title = 'Aggiungi Love'
    end
  end
end
