class CheesesController < ApplicationController

    # GET /cheeses
    def index
        cheeses = Cheese.all
        render json: cheeses
    end

    # GET /cheeses/:id
    def show
        # cheese = Cheese.find_by(id: params[:id])
        # render json: cheese

        # cheese = Cheese.find_by(id: params[:id])
        # render json: cheese, except: [:created_at, :updated_at], methods: [:summary]

        cheese = Cheese.find_by(id: params[:id])
        if cheese
            render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
        else
            # status: :not_found will produce a 404 status code
            # it will not change how JSON data looks but send additional information to the client
            # more symbols for status: can be found in Rails Guides
            render json: { error: 'Cheese not found' }, status: :not_found
        end
    end

end
