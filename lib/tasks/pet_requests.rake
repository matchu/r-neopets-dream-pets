require 'csv'
require 'redd'

namespace :pet_requests do
  desc "Import pet requests from CSV on STDIN"
  task import: :environment do
    reddit = Redd.it(:userless, ENV['REDDIT_KEY'], ENV['REDDIT_SECRET'])

    CSV($stdin, headers: :first_row) do |csv|
      csv.each do |row|
        begin
          reddit_user = reddit.user_from_name(row['Reddit username'].strip)

          user = User.find_by_provider_and_uid('reddit', reddit_user.id)
          user ||= User.create(provider: 'reddit', uid: reddit_user.id, name: reddit_user.name)

          pet_request = user.pet_requests.new(
            species: Species.find_by_name(row['Species']),
            color: Color.find_by_name(row['Colour']),
            conversion_state: ConversionState.find_by_name(row['Converted or UC?']),
            minimum_name_quality: NameQuality.find_by_abbreviation(row['Minimum Name Quality']),
            info: row['Extra Info'],
            requires_clothes: row['Only contact about clothed pets'] == 'Yes'
          )
          pet_request.save!

          puts "Imported row: #{row.inspect}"
        rescue => e
          STDERR.puts "Error importing row: #{e.inspect}\nRow: #{row.inspect}"
        end
      end
    end
  end
end
