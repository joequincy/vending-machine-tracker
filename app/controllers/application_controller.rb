class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :float_to_dollars

  def float_to_dollars(float)
    dollars, cents = float.divmod(1)
    cents = (cents * 100).to_i.to_s.ljust(2, '0')
    currency = "#{dollars.to_i}.#{cents}"
  end
end
