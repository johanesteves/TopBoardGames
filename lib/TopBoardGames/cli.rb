class TopBoardGames::CLI

  def call
    TopBoardGames::Scraper.new.make_boardgames
    menu
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
    game_list
  end

  def game_list
    input = nil
    while input != "exit"
      input  = gets.strip.downcase

      if input == "1"
        puts "Here are the following 1-20:", ""
        list_boardgames(0..19)
        puts "", "Choose which game you would like more information on or type '[m]enu'"
        input = gets.strip.downcase
        if input == "menu"
          navigation_menu
        else
          display_game_description(@boardgames[input.to_i-1])
        end

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


  def display_game_description(game)
    puts "", "More information about:", "========================================================="
    puts game.title.upcase
    puts "========================================================="
    puts "Overall Rank: #{game.rank}"
    puts "Average Rating: #{game.avg_rating}"
    puts "Weight: #{game.weight}"
    if game.min_playtime == game.max_playtime
      puts "Estimated Playtime: #{game.min_playtime} mins"
    else
      puts "Estimated Playtime: #{game.min_playtime} - #{game.max_playtime} mins"
    end
    puts "Recommended Age: #{game.min_age}+"
    puts "Description:"
    puts game.description, ""
  end
end