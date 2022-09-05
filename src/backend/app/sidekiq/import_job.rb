class ImportJob
  include Sidekiq::Job

  def perform
        Actor.all.map &:destroy
        Movie.all.map &:destroy

        ActorService.new.process
        MovieService.new.process
  end
end
