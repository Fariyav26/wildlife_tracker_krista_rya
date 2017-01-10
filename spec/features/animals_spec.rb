require 'rails_helper'

RSpec.feature "Animals", type: :feature do
  context 'Creating an animal' do
    Steps 'Creating an animal' do
      Given 'I am on the Animals page' do
        visit '/'
      end
      Then 'I can click a link to create animal' do
        expect(page).to have_content('New Animal')
        click_link('New Animal')
      end
      Then 'I am taken to a page where I can create an animal' do
        fill_in 'animal_common_name', with: 'Lion'
        fill_in 'animal_latin_name', with: 'Lionlatin'
        fill_in 'animal_kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then 'I am taken to a page which shows the new animal' do
        expect(page).to have_content('Lion')
        expect(page).to have_content('Lionlatin')
        expect(page).to have_content('Mammal')
      end
    end
  end
  context 'Viewing the animal index' do
    Steps 'Viewing the animal index' do
      Given 'I am on the Animals page' do
        visit '/'
      end
      Then 'I can click a link to create animal' do
        expect(page).to have_content('New Animal')
        click_link('New Animal')
      end
      Then 'I am taken to a page where I can create an animal' do
        fill_in 'animal_common_name', with: 'Lion'
        fill_in 'animal_latin_name', with: 'Lionlatin'
        fill_in 'animal_kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then 'I am taken to a page which shows the new animal' do
        expect(page).to have_content('Lion')
        expect(page).to have_content('Lionlatin')
        expect(page).to have_content('Mammal')
      end
      Then 'I can go back to the index page' do
        click_link 'Back'
      end
      And 'I can see the list of animals' do
        expect(page).to have_content('Listing')
        expect(page).to have_content('Lion')
        expect(page).to have_content('Lionlatin')
        expect(page).to have_content('Mammal')
      end
    end
  end
  context 'Deleting an animal' do
    Steps 'Deleting an animal' do
      Given 'I am on the Animals page' do
        visit '/'
      end
      Then 'I can click a link to create animal' do
        expect(page).to have_content('New Animal')
        click_link('New Animal')
      end
      Then 'I am taken to a page where I can create an animal' do
        fill_in 'animal_common_name', with: 'Lion'
        fill_in 'animal_latin_name', with: 'Lionlatin'
        fill_in 'animal_kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then 'I am taken to a page which shows the new animal' do
        expect(page).to have_content('Animal was successfully created')
        expect(page).to have_content('Lion')
        expect(page).to have_content('Lionlatin')
        expect(page).to have_content('Mammal')
      end
      Then 'I can go back to the index page' do
        click_link 'Back'
      end
      And 'I can delete the animal' do
        expect { click_link 'Destroy' }.to change(Animal, :count).by(-1)
      end
    end
  end
  context 'Edit an animal' do
    Steps 'Edit an animal' do
      Given 'I am on the Animals page' do
        visit '/'
      end
      Then 'I can click a link to create animal' do
        expect(page).to have_content('New Animal')
        click_link('New Animal')
      end
      Then 'I am taken to a page where I can create an animal' do
        fill_in 'animal_common_name', with: 'Lion'
        fill_in 'animal_latin_name', with: 'Lionlatin'
        fill_in 'animal_kingdom', with: 'Mammal'
        click_button 'Create Animal'
      end
      Then 'I am taken to a page which shows the new animal' do
        expect(page).to have_content('Animal was successfully created')
        expect(page).to have_content('Lion')
        expect(page).to have_content('Lionlatin')
        expect(page).to have_content('Mammal')
      end
      Then 'I can click a link to edit the animal' do
        click_link 'Edit'
      end
      Then 'I can edit the animal info' do
        fill_in 'animal_common_name', with: 'Hedgehog'
        fill_in 'animal_latin_name', with: 'Hedgehoglatin'
        fill_in 'animal_kingdom', with: 'Mammal'
        click_button 'Update Animal'
      end
      Then 'I am taken to a page which shows the updated animal' do
        expect(page).to have_content('Animal was successfully updated')
        expect(page).to have_content('Hedgehog')
        expect(page).to have_content('Hedgehoglatin')
        expect(page).to have_content('Mammal')
      end
    end
  end
  context 'Animal alerts' do
    Steps 'Animal alerts' do
      Given 'I am on the Animals page' do
        visit '/'
      end
      Then 'I can click a link to create animal' do
        expect(page).to have_content('New Animal')
        click_link('New Animal')
      end
      Then 'I am taken to a page where I can create an animal. If I create without a common name and kingdom' do
        fill_in 'animal_common_name', with: ''
        fill_in 'animal_latin_name', with: ''
        fill_in 'animal_kingdom', with: ''
        click_button 'Create Animal'
      end
      Then 'I see an alert' do
        expect(page).to have_content("Common name can't be blank")
        expect(page).to have_content("Kingdom can't be blank")
      end
      Then 'I can fill in new info. If I create with a common name and kingdom shorter than 2 characters' do
        fill_in 'animal_common_name', with: 'L'
        fill_in 'animal_latin_name', with: ''
        fill_in 'animal_kingdom', with: 'M'
        click_button 'Create Animal'
      end
      Then 'I see an alert' do
        expect(page).to have_content("Common name is too short (minimum is 2 characters)")
        expect(page).to have_content("Kingdom is too short (minimum is 2 characters)")
      end
    end
  end
end
