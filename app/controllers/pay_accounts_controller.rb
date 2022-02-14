class PayAccountsController < ApplicationController
  # TODO: Add lookup to Account class

  def index
    @pay_accounts = current_user&.pay_accounts&.all
  end

  def show
    return redirect_to new_user_session_path unless user_signed_in?

    @pay_account = current_user&.pay_accounts&.find(params[:id])
  end

  def new
    return redirect_to new_user_session_path unless user_signed_in?

     @pay_account = PayAccount.new
  end

  def create
    return redirect_to new_user_session_path unless user_signed_in?

    @pay_account = PayAccount.new(pay_account_params)
    @pay_account.user_id = current_user.id

    if @pay_account.save
      redirect_to root_path
    else
      render :new, notice: :unprocessable_entity
    end
  end

  def destroy
    return redirect_to new_user_session_path unless user_signed_in?

    @pay_account = PayAccount.find(params[:id])
    @pay_account.destroy

    redirect_to root_path
  end

  private

  def pay_account_params
    temp_params = params.require(:pay_account).permit(:nickname, :account_number, :account_type)
    temp_params[:account_type] = temp_params[:account_type]&.to_i
    temp_params
  end
end
