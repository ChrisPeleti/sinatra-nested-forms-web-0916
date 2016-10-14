require './environment'

module FormsLab
  class App < Sinatra::Base

    configure do
  	set :views, "views/"
  	set :public_dir, "public"
  end

    # code other routes/actions here

    get '/' do
      #instructions
      erb :root

    end

    get '/new' do
      #render the new form for the user
      erb :'/pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      params[:pirate][:ships].each do |ship|
        Ship.new(ship)
      end
      @ships=Ship.all
      erb :'/pirates/show'
    end

  end
end
