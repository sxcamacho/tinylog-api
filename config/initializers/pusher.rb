require 'pusher'

Pusher.app_id = '497429'
Pusher.key = '98618edc5506eaf159c0'
Pusher.secret = '667aa84d985de73c588f'
Pusher.cluster = 'us2'
Pusher.logger = Rails.logger
Pusher.encrypted = true

# app/controllers/hello_world_controller.rb
class HelloWorldController < ApplicationController
  def hello_world
    Pusher.trigger('my-channel', 'my-event', {
      message: 'hello world'
    })
  end
end
