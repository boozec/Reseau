class Post < ApplicationRecord
  $categorie = [
                  [1, 'problema' , 'cogs', '1abc9c'],
                  [2, 'tutorial', 'graduation-cap', '8e44ad'],
                  [3, 'sfida', 'cube', 'e74c3c'],
                  [4, 'hardware', 'hdd-o', '34495e'],
                  [5, 'off topic', 'coffee', 'd35400'],
              ]

  def self.categoryInfo(what, v)
    for i, j, k, z in $categorie do
      if v == i then
        return case what
        when 'name'; j
        when 'fa'; k
        else; z
        end
      end
    end
  end

  def self.editPostError(v)
    return case v
    when 'Ok'; 'Post modificato'
    when '2'; 'Lunghezza post non valida'
    when '3'; 'Post inesistente'
    else; 'Errore'
    end
  end

end
