require 'pry'

def get_first_name_of_season_winner(data, season)
  winner_name = nil
  data[season].each do |contestant|
    if contestant["status"] == "Winner"
      winner_name = contestant["name"].split[0]
    end
  end
  winner_name
end

def get_contestant_name(data, occupation)
  name = nil
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["occupation"] == occupation
        name = contestant["name"]
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
    count = 0
    data.each do |season, contestants|
      contestants.each do |contestant|
        if contestant["hometown"] == hometown
          count += 1
        end
      end
    end
    count
end

def get_occupation(data, hometown)
  occupation = 0
  block = nil
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown && block == nil
        occupation = contestant["occupation"]
        block = true
      end
    end
  end
  occupation
end

def get_average_age_for_season(data, season)
  average_age = 0
  total_age = 0
  count = 0
  data[season].each do |contestant|
    total_age += contestant["age"].to_f
    count += 1
  end
  average_age = total_age / count
  average_age.round
end
