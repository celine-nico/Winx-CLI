class Scraper 

    WINX_URL = "https://winx-club.fandom.com"
    # outputs the website we are using to scrape information
    def self.scrape_winx 
        html = open("https://winx-club.fandom.com/wiki/Category:Characters")
        doc = Nokogiri::HTML(html)
        # converts the html into nokogiri
        doc.css(".category-page__member-link").each do |winx|
            if winx.text == "Roxy" || winx.text == "Musa" || winx.text == "Flora" || winx.text == "Tecna" || winx.text == "Aisha"
                name = winx.text
                url =  winx.attr("href") 
            
                Winx.new(name, url)
            end 
            # picks out the 5 main characters out of the list of 42 
            # assigns the name and url to the scraped html that matches 
        end
    end

    def self.scrape_single_winx(winx)
        html = open(WINX_URL+winx.url)
        doc = Nokogiri::HTML(html)
        winx.power = doc.css("table.mw-collapsible-content")[0].css("tr td")[3].text
        # assigns abilities to scraped html 
        if winx.name == "Tecna"
            winx.alias = doc.css("td")[5].text.strip
        elsif winx.name == "Roxy"
            winx.alias = doc.css("td")[3].text.strip
        elsif winx.name == "Aisha"
            winx.alias = doc.css("td")[3].text.strip
        else 
            winx.alias = doc.css("td")[6].text.strip
        end 
        # assigns a unique scraped html to characters where the html is placed differently
        
    end 
end 

# Aisha_alias = doc.css("td")[3].text.strip 
#Roxy_alias = doc.css("td")[3].text.strip 
#Tecna_alias = doc.css("td")[5].text.strip