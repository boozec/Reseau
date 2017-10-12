module PostHelper
  def updateDatePost(idPost)
    begin
      query_exe("UPDATE posts SET updated_at = '#{date}' WHERE id = '#{idPost}'")
    rescue
      return 0
    end
  end

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

  def delComm(id, idAuthor)
    sql = Comment.where(author_id: idAuthor, id: id, active: 1).take
    if Comment.where(author_id: idAuthor, id: id, active: 1).count > 0
      begin
        query_exe("UPDATE comments SET active = '0' WHERE id = '#{id}'")
        return sql['post_id']
      rescue
        return
      end
    else
      return 0
    end
  end

  def delPost(id, idAuthor)
    if Post.where(author: idAuthor, id: id, active: 1).count > 0
      begin
        query_exe("UPDATE posts SET active = '0' WHERE id = '#{id}'")
      rescue
        return
      end
    end
  end

  def commenta(v, idAuthor)
    tags = v["tags"].gsub(/\s+/, "").split(',')
    if tags.length > 5
      return 5
    end

    for i in tags
      if i.length > 10
        return 6
      end
    end

    if Post.select(:id).where(id: v["t"], active: 1).count > 0
      last_author_date = Comment.where(author_id: idAuthor).last
      if last_author_date == nil || (date.to_time.to_i - last_author_date['created_at'].to_time.to_i) > 300
        begin
          query_exe("INSERT INTO comments(id, author_id, author_ip, post_id, blocktext, active, created_at, updated_at)
            VALUES (NULL,'#{idAuthor}','#{ip}','#{v["t"]}',#{v["blocktext"]},1,'#{date}','#{date}')")

          last = Comment.last

          tags.each do |t|
            begin
              query_exe("INSERT INTO tags(id, word, post, commentID, created_at, updated_at)
                  VALUES (NULL,'#{t}',0,'#{last["id"]}','#{date}','#{date}')")
            rescue
              next
            end
          end
          updateDatePost(v["t"])
          return 'Ok'
        rescue
          return 'Errore'
        end
      else
        if last_author_date != nil
          @extraErrors = last_author_date['created_at']
        end
        return 4
      end
    else
      return 'Post inesistente'
    end
  end

  def newPost(v, idAuthor)
    tags = v["tags"].gsub(/\s+/, "").split(',')
    if tags.length > 5
      return 'Puoi aggiungere massimo 5 tags'
    end

    for i in tags
      if i.length > 10
        return 'Un tag può essere lungo max 10 caratteri'
      end
    end

    if v['category'].to_i < 1 || v['category'].to_i > Post.numCategorie
      return 'Categoria non valida'
    end

    last_author_date = Post.where(author: idAuthor).last
    if last_author_date == nil || (date.to_time.to_i - last_author_date['created_at'].to_time.to_i) > 300
      begin
        query_exe("INSERT INTO posts(id, titolo, author, author_ip, category, blocktext, active, created_at, updated_at)
        VALUES (NULL,#{v['titolo']},'#{idAuthor}','#{ip}',#{v['category']},#{v['blocktext']},'1','#{date}','#{date}')")

        last = Post.last

        tags.each do |t|
          begin
            query_exe("INSERT INTO tags(id, word, post, postID, created_at, updated_at)
              VALUES (NULL,'#{t}',1,'#{last["id"]}','#{date}','#{date}')")
          rescue
            next
          end
        end
        return 'OK'
      rescue
        return 'Errore'
      end
    else
      if last_author_date != nil
        return "Cos'è questa fretta? Sembra che tu stia postando troppo velocemente. Devi avere un'intervallo di 5 minuti. L'ultimo tuo post risale a #{time_ago_in_words last_author_date['created_at']} fa"
      end
      return 'Errore'
    end
  end

  def editPost(v, idAuthor)
    if Post.where(active: 1, id: v['id'], author: idAuthor).count > 0
      begin
        query_exe("UPDATE posts SET blocktext = #{v['blocktext']}, author_ip = '#{ip}', updated_at = '#{date}' WHERE id = '#{v['id']}'")
        return 'Ok'
      rescue
        return 4
      end
    else
      return 3
    end
  end

  def editComment(v, idAuthor)
    if Comment.where(active: 1, id: v['id'], author_id: idAuthor, post_id: v['t']).count > 0
      begin
        query_exe("UPDATE comments SET blocktext = #{v['blocktext']}, author_ip = '#{ip}', updated_at = '#{date}' WHERE id = '#{v['id']}'")
        return 'Ok'
      rescue
        return 4
      end
    else
      return 3
    end
  end
end
