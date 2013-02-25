# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "InternProfiles" do
    describe "Admin" do
      describe "intern_profiles" do
        login_refinery_user

        describe "intern_profiles list" do
          before do
            FactoryGirl.create(:intern_profile, :name => "UniqueTitleOne")
            FactoryGirl.create(:intern_profile, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.intern_profiles_admin_intern_profiles_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.intern_profiles_admin_intern_profiles_path

            click_link "Add New Intern Profile"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::InternProfiles::InternProfile.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::InternProfiles::InternProfile.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:intern_profile, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.intern_profiles_admin_intern_profiles_path

              click_link "Add New Intern Profile"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::InternProfiles::InternProfile.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:intern_profile, :name => "A name") }

          it "should succeed" do
            visit refinery.intern_profiles_admin_intern_profiles_path

            within ".actions" do
              click_link "Edit this intern profile"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:intern_profile, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.intern_profiles_admin_intern_profiles_path

            click_link "Remove this intern profile forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::InternProfiles::InternProfile.count.should == 0
          end
        end

      end
    end
  end
end
