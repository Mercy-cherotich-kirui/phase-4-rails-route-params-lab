class StudentsController < ApplicationController

  def show
    student = Student.find(params[:id])
    render json: student
  end  

  def index
    if params[:query]
      students = Student.where("first_name LIKE :query OR last_name LIKE :query", query: "%#{params[:query]}%")
    else
      students = Student.all
    end
    render json: students
  end
end
