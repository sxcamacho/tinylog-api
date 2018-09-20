require 'json'

class FilesController < ApplicationController
  before_action :set_file, only: [:show, :update, :destroy]

  def index
    begin
      files = TinyLog::File.all
      render json: files
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def show
    begin
      if @file.present?
        render json: @file
      else
        render :status => :not_found
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def create
    begin
      file = TinyLog::File.new({
        :name => file_params[:name],
        :uid => SecureRandom.urlsafe_base64
      })

      if file.save
        render json: file, status: :created
      else
        render json: file.errors, status: :unprocessable_entity
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def update
    begin
      if @file.present?
        @file.attributes = file_params
        if @file.save
          render json: @file, status: :created
        else
          render json: file.errors, status: :unprocessable_entity
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
      if @file.present?
        @file.delete
        render :status => :ok
      else
        render :status => :not_found
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  private
  def file_params
    params.require(:file).permit(:name)
  end

  def set_file
    @file = TinyLog::File.where(:uid => params[:id]).first
  end
end
