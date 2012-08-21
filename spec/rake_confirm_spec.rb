require 'rake'

describe "Rake::Confirm" do
  describe "confirm" do
    # TODO: not DRY, but I don't know how to share variables with rspec DSL in/out context
    @confirmed_tasks     = %w(db:drop db:fixtures:load db:rollback db:migrate db:schema:load db:seed db:setup)
    let(:confirmed_tasks){ %w(db:drop db:fixtures:load db:rollback db:migrate db:schema:load db:seed db:setup) }

    @not_confirmed_tasks     = %w(db:create db:migrate:status db:schema:dump db:structure:dump db:version)
    let(:not_confirmed_tasks){ %w(db:create db:migrate:status db:schema:dump db:structure:dump db:version) }

    before(:each) do
      # # inject dummy tasks
      confirmed_tasks.each do |t|
        Rake::Task.define_task(t)
      end

      not_confirmed_tasks.each do |t|
        Rake::Task.define_task(t)
      end

      # delayed loading because 'task' is evaluated before stubbing
      require 'rake-confirm'
      load "rake/confirm/tasks/rails/confirm.rake"
    end

    @confirmed_tasks.each do |t|
      it "should make #{t} with confirmation" do
        Rake::Task[t].prerequisites.should include(:confirm)
      end
    end

    @not_confirmed_tasks.each do |t|
      it "should not make #{t} with confirmation" do
        Rake::Task[t].prerequisites.should_not include(:confirm)
      end
    end
  end
end
