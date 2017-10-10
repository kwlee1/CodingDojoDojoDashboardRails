class DojosControllerController < ApplicationController
  def index
    @dojos = Dojo.all
    @total = Dojo.all.count 
  end

  def new 
      @errors = session[:errors]
  end 

  def create 
    newDojo = Dojo.new(dojo_params)
    newDojo.valid? 
    session[:errors] = newDojo.errors
    if newDojo.errors.count > 0
      session[:errors] = newDojo.errors
      redirect_to '/dojos/new'
    else 
      newDojo.save
      redirect_to "/dojos/#{params[:id]}"
    end 
  end 

  def show
    @dojo = Dojo.find(params[:id])
    @students = Student.where(dojo:@dojo[:id])
  end

  def destroy
    Dojo.find(params[:id]).destroy
    redirect_to '/'
  end 

  def edit
    @dojo = Dojo.find(params[:id])
  end 

  def update
    dojo = Dojo.find(params[:id])
    dojo.branch = params[:branch]
    dojo.street = params[:street]
    dojo.city = params[:city]
    dojo.state = params[:state]
    dojo.valid? 
    if dojo.errors.count > 0 
      redirect_to "/dojos/#{params[:id]}"
    else 
      dojo.save 
      redirect_to "/dojos/#{params[:id]}"
    end 
  end 

  private
  def dojo_params
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end 
end
