class Object
  def inspect
    (methods - Object.instance_methods).sort
  end
end
