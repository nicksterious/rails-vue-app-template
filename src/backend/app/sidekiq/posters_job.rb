class PostersJob
  include Sidekiq::Job

  def perform(*args)
    # TODO load up an image from an URL, save into active_storage and associate with the movie
  end
end
