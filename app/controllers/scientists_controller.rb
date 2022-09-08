class ScientistsController < ApplicationController

    def index
        render json: Scientist.all
    end

    def show
        render json: find_sci, serializer: SingleScientistSerializer
    end

    def create
        render json: Scientist.create!(sci_params), status: :created
    end

    def update
        sci = find_sci.update!(sci_params)
        render json: sci, status: :ok
    end

    def destroy
        find_sci.destroy; head :no_content
    end

    private

    def find_sci
        Scientist.find(params[:id])
    end

    def sci_params
        params.permit(:name, :field_of_study, :avatar)
    end

end
