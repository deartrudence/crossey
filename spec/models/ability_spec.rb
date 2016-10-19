require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability do
 #  subject { Ability.new(user) }
	# let(:user) { create(:user) }


  it "employee can only see own review" do
    user = create(:user)
    profile = create(:profile, user: user)
    user_role = create(:user_role, user: user)
    subject = Ability.new(user)
    individual_review1 = create(:individual_review, employee: user)
    individual_review2 = create(:individual_review)
    # should be_able_to(:update, individual_review1)
    expect(subject).to eq(1)
    # expect(ability.first).to be_able_to(:create, IndividualReview)
    # expect(subject).to be_able_to(:update, individual_review2)
    # assert subject.can?(:update, individual_review1)
  	# expect { subject.should be_able_to(:create, individual_review2)}
    # subject.should be_able_to(:update, individual_review1)
  end

end