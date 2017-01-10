require 'rails_helper'

RSpec.feature "Regions", type: :feature do
  context 'Creating an region' do
    Steps 'Creating an region' do
      Given 'I am on the regions page' do
        visit '/regions'
      end
      Then 'I can click a link to create region' do
        expect(page).to have_content('New Region')
        click_link('New Region')
      end
      Then 'I am taken to a page where I can create region' do
        fill_in 'region_name', with: 'North'
        click_button 'Create Region'
      end
      Then 'I am taken to a page which shows the new region' do
        expect(page).to have_content('North')
      end
    end
  end
  context 'Viewing the region index' do
    Steps 'Viewing the region index' do
      Given 'I am on the Region page' do
        visit '/regions'
      end
      Then 'I can click a link to create region' do
        expect(page).to have_content('New Region')
        click_link('New Region')
      end
      Then 'I am taken to a page where I can create region' do
        fill_in 'region_name', with: 'North'
        click_button 'Create Region'
      end
      Then 'I am taken to a page which shows the new region' do
        expect(page).to have_content('North')
      end
      Then 'I can go back to the index page' do
        click_link 'Back'
      end
      And 'I can see the list of animals' do
        expect(page).to have_content('Listing')
        expect(page).to have_content('North')
      end
    end
  end
  context 'Deleting a region' do
    Steps 'Deleting a region' do
      Given 'I am on the regions page' do
        visit '/regions'
      end
      Then 'I can click a link to create region' do
        expect(page).to have_content('New Region')
        click_link('New Region')
      end
      Then 'I am taken to a page where I can create an region' do
        fill_in 'region_name', with: 'North'
        click_button 'Create Region'
      end
      Then 'I am taken to a page which shows the new region' do
        expect(page).to have_content('Region was successfully created')
        expect(page).to have_content('North')
      end
      Then 'I can go back to the index page' do
        click_link 'Back'
      end
      And 'I can delete the region' do
        expect { click_link 'Destroy' }.to change(Region, :count).by(-1)
      end
    end
  end
  context 'Edit an animal' do
    Steps 'Edit an animal' do
      Given 'I am on the Region page' do
        visit '/regions'
      end
      Then 'I can click a link to create region' do
        expect(page).to have_content('New Region')
        click_link('New Region')
      end
      Then 'I am taken to a page where I can create region' do
        fill_in 'region_name', with: 'North'
        click_button 'Create Region'
      end
      Then 'I am taken to a page which shows the new region' do
        expect(page).to have_content('North')
      end
      Then 'I can click a link to edit the region' do
        click_link 'Edit'
      end
      Then 'I can edit the region info' do
        fill_in 'region_name', with: 'South'
        click_button 'Update Region'
      end
      Then 'I am taken to a page which shows the updated region' do
        expect(page).to have_content('Region was successfully updated')
        expect(page).to have_content('South')
      end
    end
  end
  context 'Region alerts' do
    Steps 'Region alerts' do
      Given 'I am on the Regions page' do
        visit '/regions'
      end
      Then 'I can click a link to create region' do
        expect(page).to have_content('New Region')
        click_link('New Region')
      end
      Then 'I am taken to a page where I can create an region. If I create without a name' do
        fill_in 'region_name', with: ''
        click_button 'Create Region'
      end
      Then 'I see an alert' do
        expect(page).to have_content("Name can't be blank")
      end
    end
  end
end
