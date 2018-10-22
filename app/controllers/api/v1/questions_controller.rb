module Api::V1
  class QuestionsController < ApiController

    def create
      response = []
      version = Version.find_by(uuid: params["version"].split('_')[0], version: params["version"].split('_')[1])
      params["questions"].each do |i, data|
        Question.where(name: data["name"], version: version).first_or_initialize do |question|
          question.uuid = data["uuid"]
          question.label = data["label"]
          question.kind = data["type"]
          question.order = data["order"]
          question.required = data["required"]
          result = question.save
          response << result
        end
      end

      render json: {result: response}
    end

  end
end
