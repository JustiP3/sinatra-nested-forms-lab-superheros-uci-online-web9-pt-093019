require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team][:name],params[:team][:motto])
      params[:team][:members].map do |member|
        name = member[:name]
        power = [:power]
        bio = [:bio]
        Hero.new(name, power, bio)
      end
      @heores = Hero.all 
      erb :team
    end

end
