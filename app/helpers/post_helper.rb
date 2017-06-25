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
    if Post.select(:id).where(id: v["t"], active: 1).count > 0
      last_author_date = Comment.where(author_id: idAuthor).last
      if (date.to_time.to_i - last_author_date['created_at'].to_time.to_i) > 300
        begin
          query_exe("INSERT INTO comments(id, author_id, author_ip, post_id, blocktext, active, created_at, updated_at)
            VALUES (NULL,'#{idAuthor}','#{ip}','#{v["t"]}',\"#{v["blocktext"]}\",1,'#{date}','#{date}')")

          last = Comment.last

          tags.each do |t|
            begin
              query_exe("INSERT INTO tags(id, word, post, commentID, created_at, updated_at)
                  VALUES (NULL,'#{t}',0,'#{last["id"]}','#{date}','#{date}')")
            rescue
              next
            end
          end
          return 'Ok'
        rescue
          return 'Errore'
        end
      else
        @extraErrors = last_author_date['created_at']
        return 4
      end
    else
      return 'Post inesistente'
    end
  end
end
