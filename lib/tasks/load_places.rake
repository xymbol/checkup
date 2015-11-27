desc "Load places from file"
task load_places: :environment do
  File.open(Rails.root.join('db', 'places.txt')).each do |url|
    url.chomp!
    Place.where(url: url).first_or_create!
  end
end
