module UrlGen

  def self.create_url
    
    while true
      
      url = ""

      7.times do
        num = rand(1..3)
        url << rand(0..9).to_s if num == 1
        url << (97 + rand(0..25)).chr  if num == 2
        url << (65 + rand(0..25)).chr if num == 3
      end

      return url if Post.where(url: url)
      
      url = ""
    end
  end
end
