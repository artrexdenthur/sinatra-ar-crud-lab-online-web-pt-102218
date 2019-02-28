
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do
    erb :new
  end
  
  get '/articles/:id' do
    erb :index
  end
  
  post '/articles' do
    @new_article = Article.create( title: params["title"], content: params["content"] )
    get "/articles/#{@new_article.id}" 
  end
end
