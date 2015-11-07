class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.map(&:to_s).join("").to_i
  end
end

class String
  def hash
    self.bytes.map(&:to_s).join("").to_i
  end
end

class Hash
  def hash
    # self.keys.to_s.hash + self.values.to_s.hash
    self.keys.map(&:to_s).sort.hash + self.values.map(&:to_s).sort.hash + self.length
  end
end
