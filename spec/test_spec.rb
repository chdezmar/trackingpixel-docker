feature 'event tracking' do

  scenario 'all ok' do
    visit '/'
    expect(page.status_code).to eq 200
  end
end
