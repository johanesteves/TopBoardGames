class TopBoardGames::CLI

  def call
    TopBoardGames::Scraper.new.make_boardgames
    menu
    #list_boardgames
  end

  def list_boardgames(input)
    @boardgames = TopBoardGames::Game.all

    @boardgames[input].each do |game|
      puts "#{game.rank}. #{game.title} //Avg. Rating: #{game.avg_rating}"
    end
  end

  def navigation_menu
    puts "","Please choose with list you would like to see:"
    puts "(1)        (2)      (3)       (4)       (5)"
    puts "1-20 --- 21-40 --- 41-60 --- 61-80 --- 81-100"
  end

  def menu
    puts "", "Greetings! Here you will be able to see a list of the top 100 boardgames"
    navigation_menu
    input = nil

    while input != "exit"
      input  = gets.strip.downcase

      if input == "1"
        puts "Here are the following 1-20:", ""
        list_boardgames(0..19)
        navigation_menu
      elsif input == "2"
        puts "Here are the following 21-40:", ""
        list_boardgames(20..39)
        navigation_menu
      elsif input == "3"
        puts "Here are the following 41-60:", ""
        list_boardgames(40..59)
        navigation_menu
      elsif input == "4"
        puts "Here are the following 61-80:", ""
        list_boardgames(60..79)
        navigation_menu
      elsif input == "5"
        puts "Here are the following 81-100:", ""
        list_boardgames(80..99)
        navigation_menu
      elsif input == "exit"
        puts "Goodbye!!"
      else
        puts "You have entered an invalid input"
      end
    end

  end
end