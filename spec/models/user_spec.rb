require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(login: 'Anything',
                        full_name: 'Lorem ipsum')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a login' do
    subject.login = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.full_name = nil
    expect(subject).to_not be_valid
  end
end
