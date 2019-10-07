class VocabulariesController < ApplicationController

  def index
    @vocabularies = Vocabulary.all
  end

  def show
    @vocabulary = Vocabulary.find(params[:id])
  end

  def new
    @vocabulary = Vocabulary.new
  end

  def test
    @vocabularies = Vocabulary.all
  end

  def create
    @vocabulary = Vocabulary.new(vocabulary_params)
    if @vocabulary.save
      flash[:notice] = "Word created successfully"
      redirect_to @vocabulary
    else
      flash.now[:error] = @vocabulary.errors.full_messages.join(", ")
      render action: :new
    end
  end

  private
  def vocabulary_params
    params.require(:vocabulary).permit(:word)
    params.require(:vocabulary).permit(:definition)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
