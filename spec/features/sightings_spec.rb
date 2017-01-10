require 'rails_helper'

RSpec.feature "Sightings", type: :feature do
  before(:each) do
    @animal = Animal.new(common_name: "Lion", latin_name: "Latinlion", kingdom: "Mammal")
    @animal.save
    @region = Region.new(name: "South")
    @region.save
  end

  context 'Creating an sighting' do
    Steps 'Creating an sighting' do
      Given 'I am on the Sightings page' do
        visit '/sightings'
      end
      Then 'I can click a link to create sighting' do
        expect(page).to have_content('New Sighting')
        click_link('New Sighting')
      end
      Then 'I am taken to a page where I can create an sighting' do
        select '2015', from: 'sighting_date_1i'
        select 'January', from: 'sighting_date_2i'
        select '2', from: 'sighting_date_3i'
        select '05', from: 'sighting_time_4i'
        select '30', from: 'sighting_time_5i'
        fill_in 'sighting_latitude', with: '100.2'
        fill_in 'sighting_longitude', with: '120.0'
        fill_in 'Animal', with: @animal.id
        fill_in 'Region', with: @region.id
        click_button 'Create Sighting'
      end
      Then 'I am taken to a page which shows the new sighting' do
        expect(page).to have_content('Sighting was successfully created.')
        expect(page).to have_content('2015-01-02')
        expect(page).to have_content('05:30')
        expect(page).to have_content('100.2')
        expect(page).to have_content('120.0')
        expect(page).to have_content(@animal.common_name)
        expect(page).to have_content(@region.name)
      end
    end
  end
  context 'Viewing the sighting index' do
    Steps 'Viewing the sighting index' do
      Given 'I am on the Sightings page' do
        visit '/sightings'
      end
      Then 'I can click a link to create sighting' do
        expect(page).to have_content('New Sighting')
        click_link('New Sighting')
      end
      Then 'I am taken to a page where I can create an sighting' do
        select '2015', from: 'sighting_date_1i'
        select 'January', from: 'sighting_date_2i'
        select '2', from: 'sighting_date_3i'
        select '05', from: 'sighting_time_4i'
        select '30', from: 'sighting_time_5i'
        fill_in 'sighting_latitude', with: '100.2'
        fill_in 'sighting_longitude', with: '120.0'
        fill_in 'Animal', with: @animal.id
        fill_in 'Region', with: @region.id
        click_button 'Create Sighting'
      end
      Then 'I am taken to a page which shows the new sighting' do
        expect(page).to have_content('Sighting was successfully created.')
        expect(page).to have_content('2015-01-02')
        expect(page).to have_content('05:30')
        expect(page).to have_content('100.2')
        expect(page).to have_content('120.0')
        expect(page).to have_content(@animal.common_name)
        expect(page).to have_content(@region.name)
      end
      Then 'I can go back to the index page' do
        click_link 'Back'
      end
      And 'I can see the list of sightings' do
        expect(page).to have_content('2015-01-02')
        expect(page).to have_content('')
        expect(page).to have_content('100.2')
        expect(page).to have_content('120.0')
        expect(page).to have_content(@animal.common_name)
        expect(page).to have_content(@region.name)
      end
    end
  end
  context 'Deleting an sighting' do
    Steps 'Deleting an sighting' do
      Given 'I am on the Sightings page' do
        visit '/sightings'
      end
      Then 'I can click a link to create sighting' do
        expect(page).to have_content('New Sighting')
        click_link('New Sighting')
      end
      Then 'I am taken to a page where I can create an sighting' do
        select '2015', from: 'sighting_date_1i'
        select 'January', from: 'sighting_date_2i'
        select '2', from: 'sighting_date_3i'
        select '05', from: 'sighting_time_4i'
        select '30', from: 'sighting_time_5i'
        fill_in 'sighting_latitude', with: '100.2'
        fill_in 'sighting_longitude', with: '120.0'
        fill_in 'Animal', with: @animal.id
        fill_in 'Region', with: @region.id
        click_button 'Create Sighting'
      end
      Then 'I am taken to a page which shows the new sighting' do
        expect(page).to have_content('2015-01-02')
        expect(page).to have_content('05:30')
        expect(page).to have_content('100.2')
        expect(page).to have_content('120.0')
        expect(page).to have_content(@animal.common_name)
        expect(page).to have_content(@region.name)
      end
      Then 'I can go back to the index page' do
        click_link 'Back'
      end
      And 'I can delete the sighting' do
        expect { click_link 'Destroy' }.to change(Sighting, :count).by(-1)
      end
    end
  end
  context 'Edit an sighting' do
    Steps 'Edit an sighting' do
      Given 'I am on the Sightings page' do
        visit '/sightings'
      end
      Then 'I can click a link to create sighting' do
        expect(page).to have_content('New Sighting')
        click_link('New Sighting')
      end
      Then 'I am taken to a page where I can create an sighting' do
        select '2015', from: 'sighting_date_1i'
        select 'January', from: 'sighting_date_2i'
        select '2', from: 'sighting_date_3i'
        select '05', from: 'sighting_time_4i'
        select '30', from: 'sighting_time_5i'
        fill_in 'sighting_latitude', with: '100.2'
        fill_in 'sighting_longitude', with: '120.0'
        fill_in 'Animal', with: @animal.id
        fill_in 'Region', with: @region.id
        click_button 'Create Sighting'
      end
      Then 'I am taken to a page which shows the new sighting' do
        expect(page).to have_content('2015-01-02')
        expect(page).to have_content('05:30')
        expect(page).to have_content('100.2')
        expect(page).to have_content('120.0')
        expect(page).to have_content(@animal.common_name)
        expect(page).to have_content(@region.name)
      end
      Then 'I can click a link to edit the sighting' do
        click_link 'Edit'
      end
      Then 'I can edit the sighting info' do
        select '2015', from: 'sighting_date_1i'
        select 'February', from: 'sighting_date_2i'
        select '4', from: 'sighting_date_3i'
        select '12', from: 'sighting_time_4i'
        select '40', from: 'sighting_time_5i'
        fill_in 'sighting_latitude', with: '200.2'
        fill_in 'sighting_longitude', with: '220.0'
        fill_in 'Animal', with: @animal.id
        fill_in 'Region', with: @region.id
        click_button 'Update Sighting'
      end
      Then 'I am taken to a page which shows the updated sighting' do
        expect(page).to have_content('Sighting was successfully updated')
        expect(page).to have_content('2015-02-04')
        expect(page).to have_content('12:40')
        expect(page).to have_content('200.2')
        expect(page).to have_content('220.0')
        expect(page).to have_content(@animal.common_name)
        expect(page).to have_content(@region.name)
      end
    end
  end
end
