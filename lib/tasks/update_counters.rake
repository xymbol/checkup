desc "Update app counters"
task update_counters: :environment do
  Counter.create!
end
