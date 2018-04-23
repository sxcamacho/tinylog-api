class DummyController < ApplicationController
  def greet
    render json: { say: "Hello!" }
  end
end
