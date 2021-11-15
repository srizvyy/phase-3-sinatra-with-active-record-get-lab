class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    goods = BakedGood.by_price
    goods.to_json
  end

  get '/baked_goods/most_expensive' do
    most_expensive = BakedGood.by_price.first
    most_expensive.to_json
  end

end
