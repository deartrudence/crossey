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
		profile1 = build(:profile_job_level_1)
		profile2 = build(:profile, job_level: 2)
		profile2.update(job_level: 2)
		profile3 = build(:profile, job_level: 3)
		profile3.update(job_level: 3)
		profile4 = build(:profile, job_level: 4)
		profile4.update(job_level: 4)

		profiles = Profile.less_than_level(3)

		expect(profiles.all).to eq(5)
	end

end
