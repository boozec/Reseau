class Post < ApplicationRecord
  $categorie = [ [1, 'problema' , 'cogs', '1abc9c'],
                  [2, 'tutorial', 'graduation-cap', '8e44ad'],
                  [3, 'sfida', 'cube', 'e74c3c']
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

end
