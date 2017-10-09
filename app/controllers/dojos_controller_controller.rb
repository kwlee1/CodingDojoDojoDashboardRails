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
      redirect_to '/'
    end 
  end 

  private
  def dojo_params
    params.require(:dojo).permit(:branch, :street, :city, :state)
  end 
end
