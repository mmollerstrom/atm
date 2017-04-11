require './lib/atm.rb'
require 'date'

describe Atm do
  let(:account) { instance_double('Account') }

  before do
    #before each test we need to add an attribute of 'balance'
    #to the 'account' object and set the value to '100'
    allow(account).to receive(:balance).and_return(100)
    #we also need to allow 'account' to recieve the new balance
    #using the setter method 'balance='
    allow(account).to receive(:balance=)
  end

#describe 'Basic Shit' do
#    it "has 1000$ on initialize" do
#      expect(subject.funds).to eq 1000

  it 'funds are reduced at withdraw' do
    subject.withdraw(50, '1337' account)
    expect(subject.funds).to eq 950
  end

  it 'allow withdraw if account has enough balance.' do
    expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
    expect(subject.withdraw(45, account)).to eq expected_output
  end

  it 'if expected_output does not have enough balance.' do
    expected_output = { status: false, message: '[reason for failure]', date: Date.today }
  end

  it 'rejects withdraw if account has insufficient funds' do
    subject.funds = 50

    expected_output = { status: false, message: 'insufficient funds in account?', date: Date.today }
    actual_output = subject.withdraw(105, account)

    expect(actual_output).to eq expected_output
  end
end
