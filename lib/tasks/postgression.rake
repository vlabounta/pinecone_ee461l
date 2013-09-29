require 'rspec/core/rake_task'

namespace :spec do
  desc 'Runs specs using a postgression database'
  task :postgression => :environment do |t, args|
    p 'Running migrations...'

    ENV['VERSION'] = '0'
    Rake::Task['db:migrate'].reenable
    Rake::Task['db:migrate'].invoke(:environment)

    ENV.delete('VERSION')
    Rake::Task['db:migrate'].reenable
    Rake::Task['db:migrate'].invoke(:environment)

    p 'Running specs...'
    print `rspec spec`
  end
end
