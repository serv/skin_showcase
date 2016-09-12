namespace :model do
  desc 'Populate champions using db/raw/champion.json'
  task populate_champions: :environment do
    file = File.read(Rails.root.join('db', 'raw', 'champion.json'))
    data_hash = JSON.parse(file)
    data_hash['data'].each do |key, value|
      champion_hash = {
        name: value['id'],
        key: value['key'],
        title: value['title']
      }
      champion = Champion.new(champion_hash)
      champion.save if !Champion.find_by(name: champion.name)
    end
  end

  desc 'Delete champions'
  task delete_champions: :environment do
    Champion.all.each do |champion|
      champion.destroy
    end
  end
end
