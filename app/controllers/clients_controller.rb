require 'json'

class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  def index
    begin
      clients = Client.all
      render json: clients
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def show
    begin
      if @client.present?
        render json: @client
      else
        render :status => :not_found
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def create
    begin
      client = Client.new({
        :user_id => client_params[:user_id],
        :title => client_params[:title],
        :uid => SecureRandom.urlsafe_base64
      })

      if client.save
        render json: client, status: :created
      else
        render json: client.errors, status: :unprocessable_entity
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def update
    begin
      if @client.present?
        @client.attributes = client_params
        if @client.save
          render json: @client, status: :created
        else
          render json: client.errors, status: :unprocessable_entity
        end
      else
        render :status => :not_found
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def destroy
    begin
      if @client.present?
        @client.delete
        render :status => :ok
      else
        render :status => :not_found
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  private
  def client_params
    params.require(:client).permit(:title, :user_id)
  end

  def set_client
    @client = Client.where(:uid => params[:client_id]).first
  end
end
