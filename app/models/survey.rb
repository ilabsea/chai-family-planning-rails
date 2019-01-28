require 'csv'

class Survey < ApplicationRecord

  def fields
    data = self.map{|value| JSON.parse(value) }
    return data.map{|x| x.keys}.flatten.uniq
  end

  def self.versions
    Survey.order("version desc").distinct.pluck(:version)
  end

  def json_value
    JSON.parse(self.value)
  end

  def self.headers version_id
    Question.where(version_id: version_id).order(:order).pluck(:name)
  end

  def self.to_csv(from_fully_form_version)
    version_id = Version.from_fully_form_version(from_fully_form_version).id
    question_titles = self.headers(version_id)
    row_headers = ["uuid"].concat(question_titles).concat(["start_entried_at", "end_entried_at"])
    CSV.generate(headers: true) do |csv|
      csv << row_headers
      Survey.where(version: from_fully_form_version).order(start_entried_at: :desc).each do |data|
        row = [data.uuid]
        question_titles.each do |header|
          if(data.json_value["#{header}"].kind_of?(Array))
            row << data.json_value["#{header}"].join(",")
          else
            row << data.json_value["#{header}"]
          end
        end
        row << data.start_entried_at
        row << data.end_entried_at
        csv << row
      end
    end
  end

end
