require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team])
      params[:team][:members].each do |super_hero_details|
        @super_hero = Superhero.new(super_hero_details)
      end
      @super_heroes = Superhero.all
      erb :team
    end

end
