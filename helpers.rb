require 'csv'
require 'pry'

def load_menu
  menu = []
  CSV.foreach('csv/products.csv', {headers: true, converters: :all, header_converters: :symbol}) do |row|
    menu << row.to_hash
  end
  menu
end

def subtotal(order, menu)
  pricing = []
  order.each_with_index do |quantity, i|
    pricing << '%.2f' % (quantity.to_i * menu[i][:retail_price])
  end
  pricing
end

def total(order, menu)
  total = 0.0
  order.each_with_index do |quantity, i|
    total += (quantity.to_f * menu[i][:retail_price])
  end
  '%.2f' % total
end

def submit(order, menu, total)
  order_row = order
  order_row << total
  order_row = order.join(",")
  File.open('csv/orders.csv', 'a') do |file|
    file.puts(order_row)
  end
end
