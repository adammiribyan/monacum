class PaymentsController < ApplicationController
  before_filter :set_loan_to_payment, :only => [:new, :create]
  
  def new
    @payment = @loan.payments.new
  end
  
  def create
    @payment = @loan.payments.new(params[:payment])
    
    if @payment.save
      redirect_to @loan, :notice => t("monacum.payments.create.success")
    else
      render :action => "new"
    end
  end
  
  def edit
    @payment = Payment.find(params[:id])        
  end
  
  def update
    @payment = Payment.find(params[:id])
    
    if @payment.update_attributes(params[:payment])
      redirect_to @payment.loan, :notice => t("monacum.payments.update.success")
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @payment = Payment.find(params[:id])
    
    if @payment.destroy
      redirect_to @payment.loan, :notice => t("monacum.payments.destroy.success")
    else
      redirect_to @payment.loan, :notice => t("monacum.payments.destroy.fail")
    end
  end
  
  
  private
  
  def set_loan_to_payment
    @loan = Loan.find_by_id(params[:loan_id]) if params[:loan_id]
  end
  
end
