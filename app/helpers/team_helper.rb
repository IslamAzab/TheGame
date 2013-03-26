module TeamHelper
	def months
		
		months = []

    s = Date.today.beginning_of_year
    e = Date.today.end_of_year

    m = s

    while(m <= e)
    	months << [m.strftime("%B"), {'data-month' => l(m)}]
    	m += 1.month
    end

    months
    
  end
end
