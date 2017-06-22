require 'csv'
require 'time'


def is_game_today?
  str_format = "%D %R %p"
  game_today = false
  CSV.foreach("./EventTicketPromotionPrice.csv", :headers => true) do |row|
    timestring = row["START DATE"] + " " + row["START TIME"]
    gametime = Time.strptime(timestring, str_format)
    today = Time.now
    today_onep = Time.new(today.year, today.month, today.day, 13, 00)
    today_tenp = Time.new(today.year, today.month, today.day, 22, 00)
    if (today_onep..today_tenp).cover?(gametime)
      game_today = true
    end
  end
  return game_today
end
