module QueryOptimizer
  def self.optimize_query(model1,model2)
    table1 = model1.to_s.downcase.pluralize
    table2 = model2.to_s.downcase.pluralize
    results = ActiveRecord::Base.connection.execute("SELECT #{table1}.*,#{table2}.* FROM #{table1} INNER JOIN #{table2} on #{table1}.id=#{table2}.post_id")
    table1_columns = model1.column_names
    table2_columns = model2.column_names
    table1_columns = table1_columns.map { |word| "#{table1}_#{word}" }
    table2_columns = table2_columns.map { |word| "#{table2}_#{word}" }
    both_columns = table1_columns+table2_columns
    results.to_a.map{|i| Hash[both_columns.zip(i)]}
  end
end

class ActiveRecord::Base
  include QueryOptimizer
end