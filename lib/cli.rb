class CLI 

    def output
        # begins the program witha greeting 
        puts "We are the Winx!".black.on_magenta 
        Scraper.scrape_winx
        list_winx 
        menu 
        # prints out the list of characters and asks to choose a number 
        # runs the list_winx and menu method 
    end
    
    def list_winx
        # iterates within the list of characters and outputs each character in a list
        Winx.all.each.with_index(1) do |fairy, i|
            puts "#{i}. #{fairy.name}".light_cyan 
        end 
    end 

    def menu
        puts "Select a Winx!".black.on_cyan 
        input = gets.chomp
        # gives user the choice to choose a character 
        if !input.to_i.between?(1,Winx.all.count)
            puts "That's not a Winx! Again?".cyan 
            list_winx
            menu
            # makes user choose again if the number inputted is not on the list 
        else 
            fairy = Winx.all[input.to_i - 1]
            display_winx_traits(fairy)
        end  
        # runs the display_winx_traits method 
    end 

    def display_winx_traits(winx)
        # scrapes within the list of characters 
        Scraper.scrape_single_winx(winx)
        block = "[A-Z][a-z]+"
        # assigns a variable that will take out any weird spaces inside a list
        puts "\nHi, I'm #{winx.name}!".yellow
        puts "\nAnd I'm the #{winx.alias}!".yellow 

        puts "\nMy powers include: \n\n#{winx.power.scan(/#{block}(?:\s+#{block})*/).join("\n")}".light_yellow
        # outputs the powers in a list, taking out weird spaces and putting each in a new line 
    end 
    # outputs the charater name, alias and attributes
end