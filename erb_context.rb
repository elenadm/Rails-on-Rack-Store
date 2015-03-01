class ERBContext
  def initialize(hash)
    hash.each do |k, v|
      self[k]= v
    end
  end

  def get_binding
    binding
  end

  def []=(k, v)
    instance_variable_set("@"+k.to_s, v)
  end
end
