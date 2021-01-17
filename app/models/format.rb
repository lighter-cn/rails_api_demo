class Format < ApplicationRecord
  def adjust
    format = {
      name: self.name,
      char: self.char,
      han: self.han,
      exp: self.exp
    }
  end
end
