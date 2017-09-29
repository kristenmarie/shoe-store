require("bundler/setup")
require "pry"
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @section = 'home'
  erb(:index)
end

get('/brands') do
  @section = 'brands'
  @brands = Brand.all
  erb(:brands)
end

get('/brand_form') do
  @section = 'add-brand'
  erb(:brand_form)
end

post('/add_brand') do
  @section = 'brands'
  brand = Brand.new({name: params.fetch("name"), price: params.fetch("price")})
  if brand.save
    redirect '/brands'
  else
    @error_type = brand
    erb(:errors)
  end
end

get('/stores') do
  @section = 'stores'
  @stores = Store.all
  erb(:stores)
end

get('/store_form') do
  erb(:store_form)
end

post('/add_store') do
  @section = 'add-store'
  store = Store.new({name: params.fetch("name")})
  if store.save
    redirect '/stores'
  else
    @error_type = store
    erb(:errors)
  end
end
