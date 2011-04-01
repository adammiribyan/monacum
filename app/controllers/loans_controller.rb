class LoansController < ApplicationController
  before_filter :set_client_to_loan, :only => [:new, :create]
  before_filter :check_for_unpaid_loans, :only => :new
  
  def show
    @loan = Loan.find(params[:id])
    @client = @loan.client
  end

  def new
    @loan = @client.loans.new
  end

  def edit
    @loan = Loan.find(params[:id])
    @client = @loan.client
  end

  def create
    @loan = @client.loans.new(params[:loan])
    
    if @loan.save
      redirect_to @loan, :notice => t("monacum.loans.create.success")
    else
      render :action => "new"
    end
  end

  def update
    @loan = Loan.find(params[:id])
    
    if @loan.update_attributes(params[:loan])
      redirect_to @loan, :notice => t("monacum.loans.update.success")
    else
      render :action => "edit"
    end
  end

  def destroy
    @loan = Loan.find(params[:id])
    
    if @loan.destroy
      redirect_to client_url(@loan.client), :notice => t("monacum.loans.destroy.success")
    else
      redirect_to client_url(@loan.client) 
    end
  end
  
  
  private
  
  def set_client_to_loan
    @client = Client.find_by_id(params[:client_id])      
  end  
  
  def check_for_unpaid_loans
    redirect_to @client, :alert => t("monacum.loans.new.flashes.has_unpaid_loans") if @client.loans.unpaid.count > 0
  end
  
end