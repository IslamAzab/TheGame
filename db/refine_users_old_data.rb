User.all.each do |user|

	user.average_score = 0 unless user.average_score
	user.top_score = 0 unless user.top_score

	user.results.each do |result|
		day_game = user.day_games.find_or_create_by_date(result.date);
		day_game.score = 0 unless day_game.score
    day_game.score += result.score
    day_game.save
	end

	user.save
	
end