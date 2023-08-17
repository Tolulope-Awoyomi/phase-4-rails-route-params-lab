class StudentsController < ApplicationController

  def index
    if params[:name].present?
      search_term = params[:name].downcase
      students = Student.where("LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?", "%#{search_term}%", "%#{search_term}%")
    else
      students = Student.all
    end
  
      render json: students
  end

  def show
    student = Student.find_by(id: params[:id])
    render json: student
  end

end
