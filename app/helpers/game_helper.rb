module GameHelper

  def periods
    today = Date.today

    [ 
      ["Today",{:'data-start_day' => today, :'data-end_day' => today}],

      ["This week",{:'data-start_day' => today.beginning_of_week(start_day = :sunday),
             :'data-end_day' => today.end_of_week(start_day = :sunday)}],
      
      ["This month",{:'data-start_day' => today.beginning_of_month,
             :'data-end_day' => today.end_of_month}]
    ]
  end
end
