class Comment < ApplicationRecord
  def self.commentsError(v)
    return case v
    when '1'; 'Commento inserito'
    when '2'; 'Lunghezza commento non valida'
    when '3'; 'Post inesistente'
    else; 'Errore'
    end
  end
end
