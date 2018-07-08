require 'json'

class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :update, :destroy]

  def index
    begin
      folders = Folder.all
      render json: folders
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def show
    begin
      if @folder.present?
        render json: @folder
      else
        render :status => :not_found
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def create
    begin
      folder = Folder.new({
        :title => folder_params[:title],
        :uid => SecureRandom.urlsafe_base64
      })

      if folder.save!
        render json: folder, status: :created
      else
        render json: folder.errors, status: :unprocessable_entity
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def update
    begin
      if @folder.present?
        @folder.attributes = folder_params
        if @folder.save
          render json: @folder, status: :created
        else
          render json: folder.errors, status: :unprocessable_entity
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
      if @folder.present?
        @folder.delete
        render :status => :ok
      else
        render :status => :not_found
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  private
  def folder_params
    params.require(:folder).permit(:title)
  end

  def set_folder
    @folder = Folder.where(:uid => params[:id]).first
  end
end
