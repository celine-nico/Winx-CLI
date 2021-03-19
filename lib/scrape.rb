class Scraper 

    WINX_URL = "https://winx-club.fandom.com/wiki/"

    def self.scrape_winx 
        html = open("https://winx-club.fandom.com/wiki/Category:Characters")
        doc = Nokogiri::HTML(html)
        doc.css(".category-page__member-link").each do |winx|
            name = winx.text
            url =  winx.attr("href") 
            
            Winx.new(name, url)
        end
        binding.pry
    end
end 
