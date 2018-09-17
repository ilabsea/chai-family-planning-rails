class Survey < ApplicationRecord
  def fields
    data = self.map{|value| JSON.parse(value) }
    return data.map{|x| x.keys}.flatten.uniq
  end

  def self.versions
    Survey.order("version desc").distinct.pluck(:version)
  end

end
