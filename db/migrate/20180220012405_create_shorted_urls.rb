class CreateShortedUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :shorted_urls do |t|
      t.string :code
      t.string :original_url
      t.string :request_ip
      t.timestamps null: false
    end
  end
end
