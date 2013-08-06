module KeyGen

  def self.create_key
    key = ""
    while true
      # create a key
      8.times { key << (97 + rand(0..25)).chr }
      
      return key if Post.where(key: key)
      
      key = ""
    end
  end
end
