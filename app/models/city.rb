class City < ApplicationRecord
  belongs_to :department, optional: true
  validates_uniqueness_of :code,
  def self.dedupe
    grouped = all.group_by{|city| [city.name,city.code]}
    grouped.values.each do |duplicates|
      first_one = duplicates.shift
      duplicates.each{|double| double.destroy}
    end
  end
end

City.dedupe
