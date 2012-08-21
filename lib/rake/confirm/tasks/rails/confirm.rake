%w(db:drop db:fixtures:load db:rollback db:migrate db:schema:load db:seed db:setup).each do |name|
  Rake::Task[name].enhance([:confirm])
end
