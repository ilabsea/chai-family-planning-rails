class SurveysController < ApplicationController

  def index
    @versions = Version.order('id desc')
    if @versions.length > 0
      @version = params[:version] ? params[:version] : @versions.first.form_version
      @survey = Survey.where(version: @version).page(params[:page])
      @headers = Question.order(:order).pluck(:name)
    end

    respond_to do |format|
      format.html
      format.csv { send_data Survey.to_csv(@version), filename: "survey-#{Date.today}.csv"}
    end
  end

end
