require 'csv'

module SurveyHelper
  def as_table(data)
    data = data.map{|value| JSON.parse(value) }
    keys = data.map{|x| x.keys}.flatten.uniq
    data.map do |hash|
      {}.tap do |new_hash|
        keys.each do |key|
          if hash[key].kind_of?(Array)
            new_hash[key] = hash[key].join(",")
          else
            new_hash[key] = hash[key]
          end
        end
      end
    end
  end

  def as_csv(survey, survey_values)
    keys = survey_values[0].map{ |key, item| key }
    headers = ["uuid"].concat(keys).concat(["start_entried_at", "end_entried_at"])
    CSV.generate(headers: true) do |csv|
      csv << headers
      survey.each_with_index do |value, index|
        row = [value.uuid].concat(survey_values[index].map{|key, item| item})
        .concat([value.start_entried_at, value.end_entried_at])
        csv << row
      end
    end
  end

end
