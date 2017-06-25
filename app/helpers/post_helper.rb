module PostHelper
  def addLove(idPost, idAuthor)
    begin
      query_exe("INSERT INTO loves(id, post, postID, author_id, author_ip, created_at, updated_at)
      VALUES (NULL,1,'#{idPost}','#{idAuthor}','#{ip}','#{date}','#{date}')")
    rescue
      return 0
    end
  end

  def remLove(idPost, idAuthor)
    begin
      query_exe("DELETE FROM loves WHERE postID = '#{idPost}' AND author_id = '#{idAuthor}'")
    rescue
      return 0
    end
  end

  def addLoveC(idComment, idAuthor)
    begin
      query_exe("INSERT INTO loves(id, post, commentID, author_id, author_ip, created_at, updated_at)
      VALUES (NULL,0,'#{idComment}','#{idAuthor}','#{ip}','#{date}','#{date}')")
    rescue
      return 0
    end
  end

  def remLoveC(idComment, idAuthor)
    begin
      query_exe("DELETE FROM loves WHERE commentID = '#{idComment}' AND author_id = '#{idAuthor}'")
    rescue
      return 0
    end
  end
end
