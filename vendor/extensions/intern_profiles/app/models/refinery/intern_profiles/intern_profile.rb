module Refinery
  module InternProfiles
    class InternProfile < Refinery::Core::BaseModel
      self.table_name = 'refinery_intern_profiles'

      attr_accessible :name, :school, :class_year, :college, :organization, :job_title, :mentor, :info, :profile_pic_id, :position

      acts_as_indexed :fields => [:name, :school, :college, :organization, :job_title, :mentor, :info]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :profile_pic, :class_name => '::Refinery::Image'
    end
  end
end
