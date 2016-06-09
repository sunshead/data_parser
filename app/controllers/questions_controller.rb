class QuestionsController < ApplicationController
  def index
  	@questions = Question.sorted
  end

  def show
  	@question = Question.find_by_id(params[:id])
  end

  def new
  	@question = Question.new({:question => "What is 1 + 1 ?", :answer => "2", :distractors => "3, 4"})
  end

  def create
  	#Instantiate & save a new question using form parameters
  	@question = Question.new(question_params)
  	if @question.save
  	#If save succeeds, redirect to the index action
      flash[:notice] = "Question created successfully."
  	  redirect_to(:action => 'index')
    else
  	#If save fails, redisplay the form so user can fix problems
  	  render('new')
  	end
  end

  def edit
    @question = Question.find_by_id(params[:id])
  end

  def update
    #Find an existing question using form parameters
    @question = Question.find_by_id(params[:id])
    #Update the question
    if @question.update_attributes(question_params)
    #If save succeeds, redirect to the show action
      flash[:notice] = "Question updated successfully."
      redirect_to(:action => 'show', :id => @question.id)
    else
    #If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @question = Question.find_by_id(params[:id])
  end

  def destroy
    Question.find_by_id(params[:id]).destroy
    flash[:notice] = "Question destroyed successfully."
    redirect_to(:action => 'index')
  end

private
  def question_params
  	# strong parameters
    # same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
  	params.require(:question).permit(:question, :answer, :distractors, :difficulty)
  end

end
