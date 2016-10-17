require 'rails_helper'

RSpec.describe Profile, type: :model do
  
  it "has a valid factory" do
    expect(build(:profile)).to be_valid
  end

  it "returns correct name" do
  	profile = create(:profile)
  	expect(profile.name).to eq("Trudy MacNabb")
	end

	it "successfully sets job level" do
		profile = create(:profile)
		profile.set_job_level
		expect(profile.job_level).to eq(2)
	end

	it 'returns all profiles below a certain job level' do
		profile1 = create(:profile, job_title: 'EIT1')
		profile2 = create(:profile, job_title: 'EIT2')
		profile3 = create(:profile, job_title: 'EIT3')
		profile4 = create(:profile, job_title: 'EIT4')

		profiles = Profile.less_than_level(3)

		expect(profiles).to eq([profile1, profile2])
	end

	it 'returns all profiles with same job type' do
		profile1 = create(:profile, job_type: 'Engineer')
		profile2 = create(:profile, job_type: 'Engineer')
		profile3 = create(:profile, job_type: 'Designer')
		profile4 = create(:profile, job_type: 'Designer')

		profiles = Profile.by_job_type('Engineer')

		expect(profiles).to eq([profile1, profile2])
	end

end
