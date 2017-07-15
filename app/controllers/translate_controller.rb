class TranslateController < ApplicationController
  def index
  end

  def translator
    if request.xhr?
      token = getToken
      data = getTranslate(token, params[:str])
    end
    render json: {eng: data}.to_json, status: 200
  end
end