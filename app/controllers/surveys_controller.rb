class SurveysController < ApplicationController

  def index
    @versions = Version.order('id desc')
    if @versions.length > 0
      @fully_form_version = params[:version].present? ? params[:version] : @versions.first.form_version
      @surveys = Survey.where(version: @fully_form_version).order(start_entried_at: :desc).page(params[:page])
      @version_id = Version.from_fully_form_version(@fully_form_version).id
      @headers = Survey.headers(@version_id)
    end

    respond_to do |format|
      format.html
      format.csv { send_data Survey.to_csv(@fully_form_version), filename: "survey-#{Date.today}.csv"}
    end
  end

end
