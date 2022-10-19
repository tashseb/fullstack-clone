require 'csv'
class BaseRepository
  # def initialize(csv_file_path)
  #   @csv_file_path = csv_file_path
  #   @elements = []
  #   @next_id = 1
  #   loaded_records if File.exist?(@csv_file_path)
  # end

  # def all
  #   @elements
  # end

  # def find(record_id)
  #   @elements.find { |rec| rec if rec.id == record_id }
  # end

  # def create(record)
  #   record.id = @next_id
  #   @next_id += 1
  #   @elements << record
  #   save_elements
  # end

  # # private

  # def loaded_records
  #   CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
  #     # attributes[:id] = attributes[:id].to_i
  #     # attributes[:price] = attributes[:price].to_i
  #     # need to turn customer_id into an instance of customer
  #     # @customer_repository
  #     build_record(attributes)
  #     # @elements << build_record(attributes)# Meal.new(attributes)
  #   end
  #   @next_id = @elements.any? ? @elements.last.id + 1 : 1
  #   # @elements
  # end


  # def save_elements
  #   CSV.open(@csv_file_path, 'wb') do |csv|
  #     csv << self.class.header
  #     # Parent.instance_method(:method).bind(self).call

  #     csv << header
  #     @elements.each do |rec|
  #       csv << rec.build_row #record_to_save(rec)#[rec.id, rec.name, rec.price]
  #     end
  #   end
  # end
end
