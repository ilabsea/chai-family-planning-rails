class Version < ApplicationRecord

  def for_select_options
    to_date = self.to_date ? self.to_date.strftime("%m/%Y") : 'Present'
    "#{self.uuid}_#{self.version} (#{self.from_date.strftime("%m/%Y")} to #{to_date})"
  end

  def form_version
    "#{self.uuid}_#{self.version}"
  end

  def self.from_fully_form_version fully_form_version
    begin
      regex = fully_form_version.match(/^(\S*)_(\d+)$/)

      Version.find_by(uuid: regex[1], version: regex[2])
    rescue
      nil
    end
  end
end
