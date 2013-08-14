require 'spec_helper'

  def print_am_pm
    if Time.now.hour >= 12
      'PM'
    else
      'AM'
    end
  end

describe '#print_am_pm' do
  subject { print_am_pm }
  after { Timecop.return }
  context 'when current hour == 0' do
    before { Timecop.freeze(Time.local(2008,9,9,0,0,0)) }
    it { expect(subject).to eq('AM') }
  end

  context 'when current hour 11:59:59' do
    before { Timecop.freeze(Time.local(2008,9,9,11,59,59)) }
    it { expect(subject).to eq('AM') }
  end

  context 'when PM now' do
    it { expect(subject).to eq('PM') }
  end

end

describe User do
  describe 'validations' do
    context 'when correct data given' do
      it 'should be valid' do
        user = User.new(name: 'lorem', email: 'lorem@ipsim.com', password: '12345678', password_confirmation: '12345678')
        user.valid?.should be_true
      end
    end
    context 'when no name given'  do
      it 'should raise error'  do
        user = User.new(email: 'lorem@ipsim.com', password: '12345678', password_confirmation: '12345678')
        user.valid?.should be_false
      end
    end
    context 'when no email given'  do
      it 'should raise error'  do
        user = User.new(name: 'lorem',password: '12345678', password_confirmation: '12345678')
        user.valid?.should be_false
      end
    end
    context 'when no password given' do
      it 'should raise error' do
        user = User.new(name: 'lorem', email: 'lorem@ipsim.com',)
        user.valid?.should be_false
      end
    end
    context 'when name is 51 char long' do
      it 'should raise error' do
        user = User.new(name: 'loremloremloremloremloremloremloremloremloremlorem1', email: 'lorem@ipsim.com', password: '12345678', password_confirmation: '12345678')
        user.valid?.should be_false
      end
    end
    context 'when name is 50 char long' do
      it 'should raise error' do
        user = User.new(name: 'loremloremloremloremloremloremloremloremloremlorem', email: 'lorem@ipsim.com', password: '12345678', password_confirmation: '12345678')
        user.valid?.should be_true
      end
    end
  end
end
