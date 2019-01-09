class SurveysController < ApplicationController

  def index
    @versions = Version.order('id desc')
    if @versions.length > 0
      @fully_form_version = params[:version].present? ? params[:version] : @versions.first.form_version
      @survey = Survey.where(version: @fully_form_version).page(params[:page])
      @version_id = Version.from_fully_form_version(@fully_form_version).id
      @headers = Question.where(version_id: @version_id).order(:order).pluck(:name)
    end

    respond_to do |format|
      format.html
      format.csv { send_data Survey.to_csv(@fully_form_version), filename: "survey-#{Date.today}.csv"}
    end
  end

end
