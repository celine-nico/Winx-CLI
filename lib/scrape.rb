class Scraper 

    WINX_URL = "https://winx.fandom.com/"

    def self.scrape_winx 
        html = open(https://winx.fandom.com/wiki/Category:Characters)
        doc = Nokogiri::HTML(html)
        binding.pry 
        # doc.css("li.category-page_member").each do |winx|
        #     name = winx.css('a')
    end 
end 