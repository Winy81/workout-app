class ExercisesController < ApplicationController

  before_action :set_exercise, only:[:show, :edit, :update, :destroy]
  
  def index
  	@exercises = current_user.exercises.all
    @friends = current_user.friends
    set_current_room
    @message = Message.new
    @messages = current_room.messages if current_room
    @followers = Frinedship.where(friend_id: current_user.id)
  end

  def show

  end

  def new
  	@exercise = current_user.exercises.new
  end

  def create
  	@exercise = current_user.exercises.new(exercise_params)
  	if @exercise.save
  	  flash[:notice] = "Exercise has been created"
  	  redirect_to user_exercise_path(current_user, @exercise) # or redirect_to [current_user, @exercise]  	  
  	else
  	  flash.now[:alert] = "Exercise has not been created"
  	  #flash.now for render template only, for the same request not for the next as normal
  	  render :new
  	end
  end

  def edit

  end

  def update
  	if @exercise.update(exercise_params)
  	  flash[:notice] = "Exercise has been updated"
  	  redirect_to :action => "show", :id => @exercise
  	else
  	  flash[:alert] = "Exercise has not been updated"
  	  render :edit
  	end
  end

  def destroy
  	if @exercise.delete
  	  flash[:alert] = "Exercise has been deleted"
  	  redirect_to user_exercises_path(current_user.id)
  	else
  	  flash[:alert]	= "Exercise has not been deleted"
  	  redirect_to :action => "show", :id => @exercise
  	end
  end

  private

  def exercise_params
  	params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end

  def set_exercise
  	@exercise = current_user.exercises.find(params[:id])
  end

  def set_current_room
    if params[:roomId]
      @room = Room.find_by(id params[:roomId])
    else
      @room = current_user.room
    end
    session[:current_room] = @room.id if @room
  end

end