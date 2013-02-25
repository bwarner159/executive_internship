module Refinery
  module InternProfiles
    class InternProfile < Refinery::Core::BaseModel
      self.table_name = 'refinery_intern_profiles'

      attr_accessible :name, :class_year, :organization, :mentor, :college, :job_title, :info, :profile_pic_id, :position

      acts_as_indexed :fields => [:name, :organization, :mentor, :college, :job_title, :info]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :profile_pic, :class_name => '::Refinery::Image'
    end
  end
end
