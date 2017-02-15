module ApplicationHelper

  def render_price(price, options={})
    price     = price || 0
    unit      = options[:unit] || '€ '
    precision = options[:decimals] ? 2 : (price - price.to_i == 0 ? 0 : 2)
    number_to_currency(price, unit: unit, precision: precision)
  end
  
end
