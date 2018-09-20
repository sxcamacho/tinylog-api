class LogsController < ApplicationController
  before_action :set_log, only: [:show, :update, :destroy]
  before_action :set_file, only: [:index, :show, :create, :update, :destroy]

  def index
    begin
      if @file.nil?
        render :status => :not_found
      else
        logs = @file.logs
        render json: logs
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def show
    begin
      if @log.present?
        render json: @log
      else
        render :status => :not_found
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def create
    begin
      log = TinyLog::Log.new({
        :text => log_params[:text],
        :log_type => log_params[:type].to_sym,
        :file => @file,
        :uid => SecureRandom.urlsafe_base64
      })

      if log.save
        # begin
        #   Pusher.trigger('my-channel', @folder.uid, :log =>  LogSerializer.new(log))
        # rescue Pusher::Error => e
        #   (Pusher::AuthenticationError, Pusher::HTTPError, or Pusher::Error)
        # end
        render json: log, status: :created
      else
        render json: log.errors, status: :unprocessable_entity
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  def destroy
    begin
      if @log.present?
        @log.delete
        render :status => :ok
      else
        render :status => :not_found
      end
    rescue => e
      render json: { message: e.message }, :status => 500
    end
  end

  private
  def log_params
    params.require(:log).permit(:text, :type)
  end

  def set_file
    @file = TinyLog::File.where(:uid => params[:file_id]).first
  end

  def set_log
    @log = TinyLog::Log.where(:uid => params[:id]).first
  end

end
