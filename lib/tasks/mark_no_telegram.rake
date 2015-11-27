desc "Marks places without telegram"
task mark_no_telegram: :environment do
  File.open(Rails.root.join('db', 'no_telegram.txt')).each do |url|
    url.chomp!
    Place.unscoped.where(url: url).update_all(telegram: false)
  end
end
