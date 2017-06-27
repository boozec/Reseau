class Comment < ApplicationRecord
  def self.commentsError(v)
    return case v
    when '1'; 'Commento inserito'
    when '2'; 'Lunghezza commento non valida'
    when '3'; 'Post inesistente'
    when '4'; 'Cos\'è questa fretta? Sembra che tu stia commentando troppo velocemente. Devi avere un\'intervallo di 5 minuti. L\'ultimo tuo commente risale a'
    when 'Ok'; 'Commento inserito'
    else; 'Errore'
    end
  end

  def self.editCommentError(v)
    return case v
    when 'Ok'; 'Commento modificato'
    when '2'; 'Lunghezza commento non valida'
    when '3'; 'Commento inesistente'
    else; 'Errore'
    end
  end
end
