class TopBoardGames::CLI

  def call
    menu
    #list_boardgames
  end

  def list_boardgames
    #@boardgames = TopBoardGames::Game.all
  end


  def menu
    puts "Greetings! Here you will be able to see a list of the top 100 boardgames"
    puts "Please choose with list you would like to see:",""
    puts "1-20 --- 21-40 --- 41-60 --- 61-80 --- 81-100"
    input = nil

    while input != "exit"
      input  = gets.strip

      if input == "1"
        puts "", "Here are the following 1-20:"
      elsif input == "2"
        puts "","Here are the following 21-40:"
      elsif input == "3"
        puts "","Here are the following 41-60:"
      elsif input == "4"
        puts "","Here are the following 61-80:"
      elsif input == "5"
        puts "","Here are the following 81-100:"
      else
        puts "","You have entered an invalid input"
      end
    end

  end
end