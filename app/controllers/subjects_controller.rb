class SubjectsController < ApplicationController
  
  layout 'admin'
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index
    list
    render('list')
  end
  
  def list
    # assign all subjects in order from database to instance variable.
    @subjects = Subject.order("subjects.position ASC")
  end
  
  def show
    # Set instance variable to be available in show.html.erb template
    # Set find method to pull in URL parameters from the browser request
    @subject = Subject.find(params[:id])
  end
  
  def new
    @subject = Subject.new
    @subject_count = Subject.count +1
  end
      
  def create
  # Instantiate a new object using form parameters
  @subject = Subject.new(params[:subject])
  # Save the object
  @subject.save
  if @subject.save
  # if the save succeeds, redirect to the list action.
  redirect_to(:action => 'list')
  flash[:notice] = "Subject created succesfully."
else
  # if the save fails, redisplay the form so user can fix problem.
  # reset the subject_count variable
  @subject_count = Subject.count +1
    render('new')
  end
end

def edit
  @subject = Subject.find(params[:id])
  @subject_count = Subject.count
end
  
  def update
  # Find object using form parameters
  @subject = Subject.find(params[:id])
  # Update the object
  if @subject.update_attributes(params[:subject])
  # if the update succeeds, redirect to the list action.
   flash[:notice] = "Subject updated succesfully."
  redirect_to(:action => 'show', :id => @subject.id)
else
  # if the save fails, redisplay the form so user can fix problem.
     @subject_count = Subject.count
    render('edit')
  end
end
  
  def delete
    @subject = Subject.find(params[:id])
  end
  
  def destroy
    Subject.find(params[:id]).destroy
    flash[:notice] = "Subject destroyed succesfully."
    redirect_to(:action => 'list')
  end

end
