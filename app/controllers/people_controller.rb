class PeopleController < ApplicationController
  #GET 
  #listing all people
  def index
    @people = Person.all
  end

  #GET
  #listing a specific person
  def show
    @person = Person.find(params[:id])
  end

  #GET
  #retrieving form to create new person
  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  #GET
  #finding specific person
  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to people_path(@people)
    else
      render :edit
    end
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path(@people)
    else
      render :new
    end
  end

  def destroy
    @person = Person.find(params[:id])
    if @person.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :age)
  end

end














