RSpec.describe 'Events CREATE' do
  before do
    assume_admin_logged_in
    visit '/admin/events/new'
  end

  let!(:default_started_at_hour) { Event::DEFAULT_STARTED_AT_HOURS }
  let!(:default_finished_at_hour) { Event::DEFAULT_FINISHED_AT_HOURS }

  context 'dateTime inputs' do
    it 'should have default values' do
      expect(find(:xpath, '//select[contains(@id, "started_at_4i")]').value).to eq(default_started_at_hour.to_s)
      expect(find(:xpath, '//select[contains(@id, "finished_at_4i")]').value).to eq(default_finished_at_hour.to_s)
    end
  end

  context 'invalid input' do
    it 'validates errors' do
      fill_in 'Title',  with: ''
      click_button 'Create Event'

      expect_an_error event_title:  :blank
    end
  end

  context 'valid input' do
    let!(:venue) { create(:venue) }

    it 'create new event' do
      fill_in 'Title', with: 'Super New Event'
      click_button 'Create Event'

      expect(page).to have_current_path '/admin/events/super-new-event/edit'
    end

    it 'creates event with image' do
      fill_in 'Title',  with: 'Super New Event'
      attach_file('event[cover]', Rails.root + 'spec/fixtures/images/pivorak.png')

      click_button 'Create Event'

      expect(Event.last.cover).to be_present
    end

    it 'creates event with venue' do
      visit '/admin/events/new'

      fill_in 'Title',  with: 'Super New Event'
      select(venue.name, from: 'Venue')

      click_button 'Create Event'

      expect(Event.last.venue_id).to be_present
    end
  end
end
