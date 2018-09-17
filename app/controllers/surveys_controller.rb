class SurveysController < ApplicationController
  include SurveyHelper

  def index
    @versions = Version.order('id desc')
    if @versions.length > 0
      @version = params[:version] ? params[:version] : @versions.first.form_version
      @survey = Survey.where(version: @version).page(params[:page])
      @survey_values = as_table(@survey.pluck(:value))
    end

    respond_to do |format|
      format.html
      format.csv { send_data as_csv(@survey, @survey_values), filename: "survey-#{Date.today}.csv"}
    end
  end

end
