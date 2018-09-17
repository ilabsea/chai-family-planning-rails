class Version < ApplicationRecord

  def for_select_options
    to_date = self.to_date ? self.to_date.strftime("%m/%Y") : 'Present'
    "#{self.uuid}_#{self.version} (#{self.from_date.strftime("%m/%Y")} to #{to_date})"
  end

  def form_version
    "#{self.uuid}_#{self.version}"
  end
end
