class DojosControllerController < ApplicationController
  def index
    @dojos = Dojo.all
    @total = Dojo.all.count 
  end
end
