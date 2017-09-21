class TopBoardGames::Scraper

  def get_main_page
    #main_page will return the information the info for the list (ie. Rank, Title, etc)
    Nokogiri::HTML(open("https://www.boardgamegeek.com/browse/boardgame"))
  end

  def scrape_topboardgames
    self.get_main_page.css(".collection_table tr#row_")
  end

  def make_boardgames
    #this will create new board games and iterate of the main_page
    scrape_topboardgames.each {|row| TopBoardGames::Game.new_from_main_page(row)}
  end
end