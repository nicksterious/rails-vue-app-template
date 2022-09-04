class Api::ImportController < ApplicationController

    def start
	ImportJob.perform_async
	render json: "ok"
    end

end