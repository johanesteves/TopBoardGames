require "spec_helper"
require "TopBoardGames"

RSpec.describe TopBoardGames do
  it "has a version number" do
    expect(TopBoardGames::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
