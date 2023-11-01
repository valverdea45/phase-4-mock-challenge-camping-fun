class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        activities = Activity.all

        render json: activities, status: :ok
    end

    def destroy
        activity = find_activity
        activity.destroy
    end

    def update

    end

    private

    def find_activity
        activity = Activity.find(params[:id])
    end

    def not_found
        render json: {error: "Activity not found"}, status: :not_found
    end

end
