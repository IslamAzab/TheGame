class ResultNotifier < ActionMailer::Base
  default from: "game.badrit@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.result_notifier.coach_changed_result.subject
  #
  def coach_changed_result result, coach

    @result = result
    @player = @result.user
    @scoring_card = @result.scoring_card 
    @coach = coach

    mail to: @player.email, subject: "game score changed"
  end
end
