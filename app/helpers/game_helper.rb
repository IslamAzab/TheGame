module GameHelper

  def periods
    today = Date.today

    [ 
      ["Today",{:start_day => today, :end_day => today}],
      ["This week",{:start_day => today.beginning_of_week,
       :end_day => today.end_of_week}],
      ["This month",{:start_day => today.beginning_of_month,
       :end_day => today.end_of_month}]
    ]
  end
end
