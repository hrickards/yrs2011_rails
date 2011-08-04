class Wikipedia < Hashie::Mash  
  include HTTParty
  require 'nokogiri'
  base_uri "http://simple.wikipedia.org/w"
  
  def self.find_overview(page_name)
    query = { :action => "render", :rvprop => "content", :title => page_name }
    
    headers = {"User-Agent" => "Ruby/Rails Contact hrickards@gmail.com"}
    
    data_whole = get('/index.php?', :query => query, :headers => headers).to_s
    
    parsed_whole = Nokogiri::HTML(data_whole).xpath("//body").to_html
    index = parsed_whole.index("<h2")
    
    data_overview = parsed_whole[0,index]
    parsed_overview = Nokogiri::HTML(data_overview).xpath("//p").to_html
  end
end
