class ExercisesController < ApplicationController

  def index

  end

  def new
  	@exercise = current_user.exercises.new
  end

  def create
  	@exercise = current_user.exercises.new
  	if @exercise.save
  	  flash[:notice] = "Exercise has been created"
  	  redirect_to user_exercise_path(current_user, @exercise) # or redirect_to [current_user, @exercise]  	  
  	else
  	  flash[:alert] = "Exercise has not been created"
  	  render :new
  	end
  end

end