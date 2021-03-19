class Winx 
    attr_accessor :name, :url, :power, :alias 
    @@all = []
    # declares instance variables for particular attributes 
    # makes a clas array that takes in the instance variables

    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end 
    # initializes instance variables and saves them in the class array 

    def self.all
        @@all 
    end 
    # outputs all intance variables in the array 
    

end 