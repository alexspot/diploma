require 'spec_helper'

describe User do
  describe 'validations' do
    context 'when correct data given' do
      it 'should be valid' do
        user = User.new(name: 'lorem', email: 'lorem@ipsim.com', password: '12345678', password_confirmation: '12345678')
        user.valid?.should be_true
      end
    end
  end
end
