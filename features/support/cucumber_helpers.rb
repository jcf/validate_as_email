$LOAD_PATH << '../../spec' unless $LOAD_PATH.include?('../../spec')
$LOAD_PATH.unshift '../../lib'  unless $LOAD_PATH.include?('../../lib')

def setup_active_record
  ActiveRecord::Base.logger = Logger.new(STDERR)

  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    dbfile:  ':memory:',
    database: 'mail_validator_test'
  )

  ActiveRecord::Schema.define do
    create_table :people do |t|
      t.column :email, :string
    end
  end
end
