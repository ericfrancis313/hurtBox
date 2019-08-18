class Api::V1::VocabulariesController < ApplicationController
  def index
    @vocabularies = Vocabulary.all
  end

  def show
    @vocabulary= Vocabulary.find(params[:id])
    response = {vocabulary:@vocabulary}
    render json:response
  end
end
