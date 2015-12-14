namespace :test do

  Rake::TestTask.new(:failed) do |t|
    files, tests = Minitest::Failed.get_files_and_tests
    options = "-n'/#{tests.join('|')}/'" if tests
    t.libs << 'test'
    t.test_files = files if files
    t.options = options
  end

  task f: :failed
end
