class Scraper 

    WINX_URL = "https://winx-club.fandom.com"

    def self.scrape_winx 
        html = open("https://winx-club.fandom.com/wiki/Category:Characters")
        doc = Nokogiri::HTML(html)
        doc.css(".category-page__member-link").each do |winx|
            if winx.text == "Roxy" || winx.text == "Musa" || winx.text == "Flora" || winx.text == "Tecna" || winx.text == "Aisha"
                name = winx.text
                url =  winx.attr("href") 
            
                Winx.new(name, url)
            end 
        end
    end

    def self.scrape_single_winx(winx)
        html = open(WINX_URL+winx.url)
        doc = Nokogiri::HTML(html) 
        powers = []
        doc.css("table.mw-collapsible-content")[0].css("tr td")[3].each do |power|
            powers << power
            binding.pry 
        end 
        # doc.css("table.NickTable")[0].css("tr")
        winx.power = doc.css("table.mw-collapsible-content")[0].css("tr td")[3].text
        
    end 
end 
