class ClientsController < ApplicationController
  before_filter :show_photo_preview, :only => [:edit, :update]
  
  def index
    @clients = Client.all #todo search
  end

  def show
    @client = Client.find(params[:id])	
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(params[:client])
    
    if @client.save 
    	redirect_to @client, :notice => t("monacum.clients.create.success")
    else
    	render  :action => "new"
  	end
  end

  def update
    @client = Client.find(params[:id])
    
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
