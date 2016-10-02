require 'open-uri'

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

  # Should run after populate_champions
  desc 'Populate skins using db/raw/champion.json'
  task populate_skins: :environment do
    Champion.all.each do |champion|
      champion_data = JSON.load(open("http://ddragon.leagueoflegends.com/cdn/6.18.1/data/en_US/champion/#{champion.name}.json"))

      champion_data['data'][champion.name]['skins'].each do |skin_json|
        skin_hash = {
          champion_id: champion.id,
          skin_num: skin_json['num'],
          skin_id: skin_json['id'],
          name: skin_json['name'],
          chromas: ActiveRecord::Type::Boolean.new.cast(skin_json['chromas'])
        }

        skin_hash[:name] = 'Default' if skin_hash[:name] == 'default'

        skin = champion.skins.build(skin_hash)
        skin.save if !Skin.find_by(skin_id: skin.skin_id)
      end
    end
  end

  desc 'Delete champions'
  task delete_champions: :environment do
    Skin.all.each do |skin|
      skin.destroy
    end
  end

  desc 'Create a test account'
  task create_test_account: :environment do
    test_account = {
      username: 'temp',
      email: 'temp@temp.com',
      password: 'qweqwe',
      password_confirmation: 'qweqwe'
    }
    User.new(test_account).save
  end
end
