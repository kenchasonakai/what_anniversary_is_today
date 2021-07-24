namespace :ridgepole do
  desc 'Apply database schema'
  task apply: :environment do
    ridgepole('--apply', "-f #{schema_file}", "-E #{Rails.env}", "-c #{config_file}")
    Rake::Task['db:schema:dump'].invoke if Rails.env.development?
  end

  desc 'Export database schema'
  task export: :environment do
    ridgepole('--export', "-E #{Rails.env}", '--split', "--output #{schema_file}")
  end

  private

  def schema_file
    Rails.root.join('db/Schemafile')
  end

  def config_file
    Rails.root.join('config/database.yml')
  end

  def ridgepole(*options)
    command = ['bundle exec ridgepole']
    system [command + options].join(' ')
  end
end