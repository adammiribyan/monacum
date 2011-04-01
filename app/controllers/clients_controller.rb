class ClientsController < ApplicationController
  autocomplete :client, :personal_last_name, :full => true
  before_filter :show_photo_preview, :only => [:edit, :update]
  
  def index
    @clients = Client.all #todo search
  end

  def show
    @client = Client.find(params[:id])    
    @current_loan = @client.current_loan
    @repaid_loans = @client.loans.repaid
  end  

  def new
    @client = Client.new
    
    # Default values
    @client.personal_izhd_count = 0
    @client.fact_region = t "monacum.clients.form.default.region"
    @client.reg_region = t "monacum.clients.form.default.region"
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(params[:client])
    @client.personal_full_name = [@client.personal_last_name, @client.personal_first_name, @client.personal_surname].join(' ')
    
    if @client.save 
    	redirect_to @client, :notice => t("monacum.clients.create.success")
    else
    	render  :action => "new"
  	end
  end

  def update
    @client = Client.find(params[:id])
    @client.personal_full_name = [params[:client][:personal_last_name], params[:client][:personal_first_name], params[:client][:personal_surname]].join(' ')
    
    if @client.update_attributes(params[:client])
    	redirect_to @client, :notice => t("monacum.clients.update.success")
  	else
  		render :action => "edit"
		end
  end

  def destroy
    @client = Client.find(params[:id])
    
    @client.destroy
    redirect_to clients_url
  end
  
  
  private
    
  def show_photo_preview
    @show_photo_preview = true
  end
  
end
