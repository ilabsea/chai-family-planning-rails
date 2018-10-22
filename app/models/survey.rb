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

  def self.headers
    Question.order(:order).pluck(:name)
  end

  def self.to_csv(version)
    row_headers = ["uuid"].concat(self.headers).concat(["start_entried_at", "end_entried_at"])
    CSV.generate(headers: true) do |csv|
      csv << row_headers
      Survey.where(version: version).each do |data|
        row = [data.uuid]
        self.headers.each do |header|
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
