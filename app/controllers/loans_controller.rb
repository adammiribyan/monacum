class LoansController < ApplicationController
  def index
    @loans = Loan.all
  end

  def show
    @loan = Loan.find(params[:id])
  end

  def new
    @loan = Loan.new
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def create
    @loan = Loan.new(params[:loan])
    
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
  
end