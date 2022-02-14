require 'rails_helper'

RSpec.describe PayAccount, type: :model do
  describe 'Validations' do
    let(:user) { User.create({email: '1@1.com', password: '123456'})}
    let(:pay1) { PayAccount.new({nickname: "Nikename", account_number: '123456', account_type: :bank_account})}
    let(:pay2) { PayAccount.new({account_number: '123456', account_type: :bank_account})}
    let(:pay3) { PayAccount.new({nickname: "Nikename", account_type: :bank_account})}
    let(:pay4) { PayAccount.new({nickname: "Nikename", account_number: '123456'})}
    let(:pay5) { PayAccount.new({nickname: "Nikename", account_number: '123', account_type: :debit_card})}
    let(:pay6) { PayAccount.new({nickname: "Nikename", account_number: 'ABCDEF', account_type: :debit_card})}

    it 'user should be created' do
      expect(user).to be_valid
    end

    it 'should not be valid, user must exist' do
      pay1.save
      expect(pay1).to_not be_valid
    end

    it 'should be valid' do
      pay1.user_id = user.id
      pay1.save
      expect(pay1).to be_valid
    end

    it 'should not be valid, nickname must exist' do
      pay2.user_id = user.id
      pay2.save
      expect(pay2).to_not be_valid
    end

    it 'should not be valid, account_number must exist' do
      pay3.user_id = user.id
      pay3.save
      expect(pay3).to_not be_valid
    end

    it 'should not be valid, account_type must exist' do
      pay4.user_id = user.id
      pay4.save
      expect(pay4).to_not be_valid
    end
        
    it 'should not be valid, account_number is too short' do
      pay5.user_id = user.id
      pay5.save
      expect(pay5).to_not be_valid
    end 

    it 'should not be valid, account_number is not a number'do
      pay6.user_id = user.id
      pay6.save
      expect(pay6).to_not be_valid
    end  
  end
end
