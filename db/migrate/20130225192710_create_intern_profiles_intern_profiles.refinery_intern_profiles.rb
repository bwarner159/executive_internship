# This migration comes from refinery_intern_profiles (originally 1)
class CreateInternProfilesInternProfiles < ActiveRecord::Migration

  def up
    create_table :refinery_intern_profiles do |t|
      t.string :name
      t.integer :class_year
      t.string :organization
      t.string :mentor
      t.string :college
      t.string :job_title
      t.text :info
      t.integer :profile_pic_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-intern_profiles"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/intern_profiles/intern_profiles"})
    end

    drop_table :refinery_intern_profiles

  end

end
