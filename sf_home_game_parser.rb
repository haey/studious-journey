require 'csv'
require 'time'

str_format = "%D %R %p"


CSV.foreach("./EventTicketPromotionPrice.csv", :headers => true) do |row|
  timestring = row["START DATE"] + " " + row["START TIME"]
  gametime = Time.strptime(timestring, str_format)
  today = Time.now
  today_onep = Time.new(today.year, today.month, today.day, 13, 00)
  today_tenp = Time.new(today.year, today.month, today.day, 22, 00)
  if (today_onep..today_tenp).cover?(gametime)
    puts "Delay expected!"
  end
end
