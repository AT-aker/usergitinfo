require 'rails_helper'

RSpec.describe Repo, type: :model do
  subject do
    described_class.new(name: 'Anything',
                        user_id: 1)
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
