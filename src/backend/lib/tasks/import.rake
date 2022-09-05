namespace :data do

    # TODO trigger the Sidekiq job instead?

    desc "Clear Actor and Movie data"
    task :clear => :environment do
	Actor.all.map &:destroy
	Movie.all.map &:destroy
    end


    desc "Import Actor and Movie data"
    task :import => :environment  do
	ActorService.new.process
	MovieService.new.process
    end


    desc "Setup: clear & import data"
    task :setup => [ :clear, :import ] do
	# other stuff
    end
end