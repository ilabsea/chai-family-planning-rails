module Api::V1
  class SurveysController < ApiController

    def index
      render json: Survey.all
    end

    def create
      response=[]
      params[:survey].each do |i,data|
        new_survey = Survey.new({value: data[:value], version: data[:version],
          uuid: DateTime.parse(data[:start_entried_at]).to_i,
          start_entried_at: data[:start_entried_at], end_entried_at: data[:end_entried_at]})
        response << new_survey.save
      end
      render json: {result: response}
    end

  end
end
