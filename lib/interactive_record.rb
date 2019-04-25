require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'
class InteractiveRecord
  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    columns = []

    DB[:conn].results_as_hash = true
    sql = "PRAGMA table_info(#{self.table_name})"

    DB[:conn].execute(sql).each do |col|
      columns << col["name"]
    end
    binding.pry

    column_names.compact
  end
end
