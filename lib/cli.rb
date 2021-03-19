class CLI 

    def output
        puts "We are the Winx!"
        Scraper.scrape_winx
        list_winx 
        menu 
    end
    
    def list_winx
        Winx.all.each.with_index(1) do |fairy, i|
            puts "#{i}. #{fairy.name}"
        end 
    end 

    def menu
        puts "Select a Winx!"
        input = gets.chomp

        if !input.to_i.between?(1,Winx.all.count)
            puts "That's not a Winx! Again?"
            list_winx
            menu
        else 
            fairy = Winx.all[input.to_i - 1]
            display_winx_traits(fairy)
        end  
    end 

    def display_winx_traits(winx)
        Scraper.scrape_single_winx(winx)
        puts "Hi, I'm #{winx.name}!"
        puts ""
        puts "My powers include: #{winx.power}"
    end 
end