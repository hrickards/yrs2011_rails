class Wikipedia < Hashie::Mash  
  include HTTParty
  require 'nokogiri'
  base_uri "http://simple.wikipedia.org/w"
  
  def self.find_overview(page_name)
    query = { :action => "render", :rvprop => "content", :title => page_name }
    
    headers = {"User-Agent" => "Ruby/Rails Contact hrickards@gmail.com"}
    
    data = get('/index.php?', :query => query, :headers => headers).to_s
  end
end
