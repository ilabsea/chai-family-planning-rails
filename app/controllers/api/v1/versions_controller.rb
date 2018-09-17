module Api::V1
  class VersionsController < ApiController

    def create
      response = []
      params[:version].each do |i,data|
        version = Version.where(uuid: data[:uuid], version: data[:version]).first_or_initialize
        version.from_date = data[:from_date]
        version.to_date = data[:to_date]

        response << version.save
      end
      render json: {result: response}
    end

  end
end
