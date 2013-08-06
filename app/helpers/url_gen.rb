module UrlGen

  def self.create_url
    url = ""
    while true
      # create a url
      8.times { url << (97 + rand(0..25)).chr }
      
      return url if Post.where(url: url)
      
      url = ""
    end
  end
end
