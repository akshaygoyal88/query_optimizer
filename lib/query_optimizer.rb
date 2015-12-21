module QueryOptimizer
  def self.included(base)
    base.extend ClassMethods
  end
  module ClassMethods
    def optimize_query(*args)
      joins=[]
      aliases = []
      args.to_a.unshift(self.table_name.to_sym)
      args.each_with_index do |table,index|
        aliases << table.to_s.classify.constantize.column_names.map { |word| "#{table}.#{word} AS #{table}_#{word}" }.join(',')
        next_value = args.to_a[index+1].nil? ? nil : args.to_a[index+1]
        if args.count-2 == index
           joins << "#{table}.id=#{next_value}.#{table.to_s.singularize}_id"
        else
          joins << "#{table}.id=#{next_value}.#{table.to_s.singularize}_id AND" if next_value
        end
      end
      tables = args.map{|p| p.to_s}.join(',')
      return ActiveRecord::Base.connection.select_all("SELECT #{aliases.join(',')} FROM #{tables} where #{joins.join(' ')} ORDER BY #{args.first.to_s}_id desc").to_a
    end
  end
end

class ActiveRecord::Base
  include QueryOptimizer
end
