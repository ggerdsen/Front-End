class PomsController < ApplicationController
  def single_trivia_question
    response = Faraday.get("#{ENV['CLASS_WARS_DOMAIN']}/api/v1/pom/single_trivia_question")
    body = JSON.parse(response.body, symbolize_names: true)
    # render json: body

    session[:pom] = body[:results][0][:question]
    session[:answer] = body[:results][0][:correct_answer]
  
    redirect_to teachers_courses_url
  end
end
