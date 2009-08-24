module ActiveRecord
  class SchemaDumper
    private
    alias trigger_old_tables tables
    def tables(stream)
      trigger_old_tables(stream)
      @connection.tables.sort.each do |tbl|
        next if (tbl == 'schema_info' || tbl == 'schema_migrations')
        triggers(tbl, stream)
      end
    end

    def triggers(table, stream)
      triggers = @connection.triggers(table)
      triggers.each do |trigger|
        stream.print "  add_trigger \"#{trigger.name}\", :on => \"#{trigger.reference_table}\", :timing => \"#{trigger.timing}\", :event => \"#{trigger.event}\", :statement => \"#{trigger.statement}\""
        stream.puts
      end
    end
  end

  module ConnectionAdapters
    class TriggerDefinition < Struct.new(:name, :event, :reference_table,
                                         :statement, :timing, :created,
                                         :sql_mode, :definer
                                        )
    end
    class MysqlAdapter < AbstractAdapter
      def triggers(table, name = nil)
        triggers = []
        execute("SHOW TRIGGERS LIKE '#{table}'", name).each do |row|
          triggers <<  TriggerDefinition.new(*row)
        end

        triggers
      end
    end

    module SchemaStatements
      def add_trigger(name, opts = {})
        sql = "CREATE TRIGGER #{name} #{opts[:timing]} #{opts[:event]} ON #{opts[:on]} FOR EACH ROW #{opts[:statement]}"
        execute sql
      end

      def drop_trigger(name)
        execute("DROP TRIGGER #{name}")
      end
    end
  end
end
