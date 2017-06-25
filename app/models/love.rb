class Love < ApplicationRecord
  def self.whatLove(idPost, idAuthor)
    if Love.select(:id).where(post: 1, postID: idPost, author_id: idAuthor).count > 0
      what = 'del'
    else
      what = 'add'
    end
  end

  def self.whatLoveC(idComment, idAuthor)
    if Love.select(:id).where(post: 0, commentID: idComment, author_id: idAuthor).count > 0
      what = 'del'
    else
      what = 'add'
    end
  end
end
