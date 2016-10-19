require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability do
	let(:user) { create(:user) }
	subject { Ability.new(user) }

  it "employee can only see own review" do
    user = create(:user)
    subject = Ability.new(user)
    individual_review1 = create(:individual_review, employee: user)
    individual_review2 = create(:individual_review)
    # expect(ability.first).to be_able_to(:create, IndividualReview)
    # expect(subject).to be_able_to(:update, individual_review2)
    assert subject.can?(:update, individual_review1)
  	# expect { subject.should be_able_to(:create, individual_review2)}
  end

end