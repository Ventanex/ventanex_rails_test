require 'account'

class PayAccount < ActiveRecord::Base
  belongs_to :user

  enum account_type: { bank_account: 1, debit_card: 2 }
  validates :nickname, presence: true
  validates :account_number, presence: true, length: { minimum: 4 }, numericality: { only_integer: true }
  validates :account_type, presence: true

  XML_CONTENTS = Account.read_xml_file(Rails.root.join('app', 'assets', 'xml', 'loan.xml'))

  def self.loan_number
    Account.find(XML_CONTENTS, 'LoanNumber')
  end

  def self.borrower_name
    Account.find(XML_CONTENTS, 'BorrowerName')
  end
end
