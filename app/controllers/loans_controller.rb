class LoansController < ApplicationController
  before_filter :set_the_client_to_loan, :only => [:new, :create]
  
  def index
    @loans = Loan.all
  end

  def show
    @loan = Loan.find(params[:id])
    @client = @loan.client
  end

  def new
    @loan = @client.loans.new
  end

  def edit
    @loan = Loan.find(params[:id])
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
    
    if @loan.update_attribute(params[:loan])
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
  
  def set_the_client_to_loan
    @client = Client.find_by_id(params[:client_id])      
  end
  
end