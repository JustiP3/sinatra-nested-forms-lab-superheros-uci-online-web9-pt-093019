require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team][:name],params[:team][:motto])
      params[:team][:members].each do |member|
        name = member[:name]
        power = member[:power]
        bio = member[:bio]
        binding.pry
        Hero.new(name, power, bio)
      end

      @heroes = Hero.all
      erb :team
    end

end
