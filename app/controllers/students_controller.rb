class StudentsController < ApplicationController
  def index
  end

  def new
    @errors = session[:errors]
    @dojo = Dojo.find(params[:id])
  end

  def create
    @student = student_params
    newStudent = Student.new(first_name:@student[:first_name], last_name:@student[:last_name], email:@student[:email], dojo:Dojo.where(branch:@student[:dojo]).take)
    newStudent.valid?
    session[:errors] = newStudent.errors
    if newStudent.errors.count > 0 
      redirect_to "/dojos/#{params[:id]}/students/new"
    else 
      newStudent.save
      redirect_to "/dojos/#{params[:id]}"
    end 
  end

  def show
    @students = Student.where(dojo:Dojo.find(params[:id]))
    @me = Student.find(params[:student_id])
    @dojo = Dojo.find(params[:id])
  end

  def edit
    @student = Student.find(params[:student_id])
    @dojo = Dojo.find(params[:id])
  end

  def update
    student = Student.find(params[:student_id])
    student.first_name = params[:first_name]
    student.last_name = params[:last_name]
    student.email = params[:email]
    student.dojo = Dojo.where(branch:params[:dojo_name]).take
    student.valid?
    if student.errors.count > 0 
      redirect_to "/dojos/#{params[:id]}/students/#{params[:student_id]}"
    else 
      student.save 
      redirect_to "/dojos/#{params[:id]}/students/#{params[:student_id]}"
    end 
  end

  def destroy
    Student.find(params[:student_id]).destroy
    redirect_to "/dojos/#{params[:id]}"
  end

  private 
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :dojo)
  end 
end
