require("bundler/setup")
require "pry"
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @section = 'home'
  erb(:index)
end

get('/brands') do
  @brands = Brand.all
  erb(:brands)
end

get('/brand_form') do
  erb(:brand_form)
end

post('/add_brand') do
  brand = Brand.new({name: params.fetch("name"), price: params.fetch("price")})
  if brand.save
    redirect '/brands'
  else
    @error_type = brand
    erb(:errors)
  end
end
