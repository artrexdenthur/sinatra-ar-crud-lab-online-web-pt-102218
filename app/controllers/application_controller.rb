
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/new' do
    erb :new
  end
  
  get '/articles/:id' do
    if Article.find(params['id']) 
      @article = Article.find(params['id'])
      erb :show
    else
      "No Article with id = #{params['id']}"
    end
  end
  
  post '/articles' do
    @new_article = Article.create( title: params["title"], content: params["content"] )
    # binding.pry
    redirect "/articles/#{@new_article.id}" 
  end
end
