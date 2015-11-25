desc "Load places from file"
task load_places: :environment do
  File.open(Rails.root.join('db', 'places.txt')).map(&:chomp).each do |url|
    Place.where(url: url).first_or_create!
  end
end
