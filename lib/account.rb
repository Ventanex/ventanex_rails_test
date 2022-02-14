class Account
  def self.read_xml_file(path)
    Hash.from_xml(File.read(path))
  end

  def self.find(obj, key)
    if obj.respond_to?(:key?) && obj.key?(key)
      obj[key]
    elsif obj.respond_to?(:each)
      value = nil
      obj.find { |*a| value = find(a.last, key) }
      value
    end
  end
end
