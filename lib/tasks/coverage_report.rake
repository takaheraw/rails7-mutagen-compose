namespace :coverage do
  task :report do
    require 'simplecov'

    SimpleCov.collate Dir['simplecov-resultset/.resultset-*.json'], 'rails' do
      formatter SimpleCov::Formatter::MultiFormatter.new([
                                                           SimpleCov::Formatter::SimpleFormatter,
                                                           SimpleCov::Formatter::HTMLFormatter
                                                         ])
    end
  end
end
