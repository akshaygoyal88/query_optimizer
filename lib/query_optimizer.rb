module QueryOptimizer
  def self.optimize_query(model1,model2)
    table1 = model1.table_name
    table2 = model2.table_name
    get_singular_name = table1.singularize
    table1_columns = model1.column_names
    table2_columns = model2.column_names
    table1alias = table1_columns.map { |word| "#{table1}.#{word} AS #{table1}_#{word}" }.join(',')
    table2alias = table2_columns.map { |word| "#{table2}.#{word} AS #{table2}_#{word}" }.join(',')
    results = ActiveRecord::Base.connection.select_all("SELECT #{table1alias},#{table2alias} FROM #{table1}, #{table2} where #{table1}.id=#{table2}.#{get_singular_name}_id").to_a 
  end
end

class ActiveRecord::Base
  include QueryOptimizer
end
