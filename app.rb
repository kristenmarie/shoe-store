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

get('/brands/:id') do
  @section = 'brands'
  @stores = Store.all
  @brand = Brand.find(params[:id].to_i)
  erb(:brand)
end

get('/stores/:id') do
  @section = 'stores'
  @brands = Brand.all
  @store = Store.find(params[:id].to_i)
  erb(:store)
end

post('/add-store-association') do
  @section = 'home'
  @brand = Brand.find(params.fetch("brand_id").to_i)
  @store = Store.find(params.fetch("store_id").to_i)
  @brand.stores.push(@store)
  erb(:success)
end

post('/add-brand-association') do
  @section = 'home'
  @store = Store.find(params.fetch("store_id").to_i)
  @brand = Brand.find(params.fetch("brand_id").to_i)
  @store.brands.push(@brand)
  erb(:success)
end

get('/brands/:id/edit') do
  @section = 'brands'
  @brand = Brand.find(params[:id])
  erb(:edit_brand)
end

patch('/update-brand') do
  @section = 'brands'
  brand = Brand.find(params.fetch("brand_id").to_i)
  brand.update({price: params.fetch("price")})
  redirect '/brands'
end

delete('/brands/:id/delete') do
  @section = 'brands'
  brand = Brand.find(params[:id])
  if brand.delete
    redirect 'brands'
  else
    @error_type = brand
  end
end

get('/stores/:id/edit') do
  @section = 'stores'
  @store = Store.find(params[:id])
  erb(:edit_store)
end

patch('/update-store') do
  @section = 'stores'
  Store = Store.find(params.fetch("brand_id").to_i)
  store.update({name: params.fetch("name")})
  redirect '/stores'
end

delete('/stores/:id/delete') do
  @section = 'stores'
  store = Store.find(params[:id])
  if store.delete
    redirect 'stores'
  else
    @error_type = store
  end
end
