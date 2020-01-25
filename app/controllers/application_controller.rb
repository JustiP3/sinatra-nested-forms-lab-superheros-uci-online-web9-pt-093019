require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team][:name],params[:team][:motto])
      @heroes = params[:team][:members].map do |member|
        name = member[:name]
        power = [:power]
        bio = [:bio]
        Hero.new(name, power, bio)
      end
      erb :team
    end

    <h1><%= @params[:team][:name] %></h1>
    <h3><%= @params[:team][:motto] %></h3>
    <% @params[:team][:members].each do |member| %>
    <h2>Hero Name: <%= member[:name] %></h2>
    <p>Hero Name: <%= member[:power] %></p>
    <p>Hero Biography: <= member[:bio]</p>
    <% end %>

end
