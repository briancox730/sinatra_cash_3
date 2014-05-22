require 'csv'
require 'pry'

def load_menu
  menu = []
  CSV.foreach('csv/products.csv', {headers: true, converters: :all, header_converters: :symbol}) do |row|
    menu << row.to_hash
  end
  menu
end

def submit(light, medium, bold)

end
