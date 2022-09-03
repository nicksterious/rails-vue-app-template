class ActorService < ApiService
    def endpoint
	"https://anjmihdde7.execute-api.us-east-1.amazonaws.com/kinside/actors"
    end

    def build(actor)
	Actor.find_or_create_by(actor.deep_symbolize_keys)
    end
end