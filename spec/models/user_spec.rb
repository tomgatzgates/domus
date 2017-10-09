require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#email=' do
    it 'downcases emails' do
      user = User.new(email: 'TOM@TOM.COM')
      expect(user.email).to eq 'tom@tom.com'
    end

    it 'removes whitespace' do
      user = User.new(email: '      tom@tom.com     ')
      expect(user.email).to eq 'tom@tom.com'
    end
  end
end
