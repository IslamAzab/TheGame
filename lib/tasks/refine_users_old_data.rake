task :refine_user_data => :environment do
	
	User.all.each do |user|

		user.average_score ||= 0
		user.top_score ||= 0
		user.top_score_date ||= Date.today

		user.results.each do |result|
			day_game = user.day_games.find_or_create_by_date(result.date);
			day_game.score ||= 0
	    day_game.score += result.score
	    day_game.save
		end

		user.save		
	end
end
