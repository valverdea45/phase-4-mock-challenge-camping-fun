class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_response

    def index
        campers = Camper.all

        render json: campers, status: :ok
    end

    def show
        camper = find_camper
        render json: camper, serializer: CampersWithActivitiesSerializer, status: :ok
    end

    def create
        new_camper = Camper.create!(camper_params)
        render json: new_camper, status: :created
    end 

    private

    def find_camper
        camper = Camper.find(params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end

    def camper_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end

    def render_unprocessable_response(exception)

        render json: {errors: exception.record.errors.full_messages }, status: :unprocessable_entity


    end

end
