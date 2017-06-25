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

  def commenta(v, idAuthor)
    tags = v["tags"].gsub(/\s+/, "").split(',')
    if Post.select(:id).where(:id => v["t"], :active => 1).count > 0
      begin
        query_exe("INSERT INTO comments(id, author_id, author_ip, post_id, blocktext, active, created_at, updated_at)
        VALUES (NULL,'#{idAuthor}','#{ip}','#{v["t"]}','#{v["blocktext"]}',1,'#{date}','#{date}')")

        last = Comment.last

        tags.each do |t|
          query_exe("INSERT INTO tags(id, word, post, commentID, created_at, updated_at)
          VALUES (NULL,'#{t}',0,'#{last["id"]}','#{date}','#{date}')")
        end
      rescue
        return 'Errore'
      end
    else
      return 'Post inesistente'
    end
  end
end
