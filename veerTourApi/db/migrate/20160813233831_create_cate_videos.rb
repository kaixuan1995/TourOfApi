class CreateCateVideos < ActiveRecord::Migration
  def change
    create_table :cate_videos do |t|

      t.timestamps
    end
  end
end
