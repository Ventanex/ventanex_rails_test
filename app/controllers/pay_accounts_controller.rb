class PayAccountsController < ApplicationController

  def index
    @pay_accounts = PayAccount.all
  end

  def show
  	@account= PayAccount.find_by(id: params[:id])
  end

  def create
  	@account_number= rand 111111111111...999999999999
  	@new_account = PayAccount.create(nickname: params[:nickname], account_number: @account_number, account_type: params[:account_type].to_i)
  	@new_account.save
  	return redirect_to root_path
  end

  def destroy
  	@account = PayAccount.find(params[:id])
  	@account.destroy
    return redirect_to root_path
  end

end
