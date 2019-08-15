class VocabulariesController < ApplicationController

  def index
    @vocabularies = Vocabulary.all
  end

  def show
    @vocabulary = Vocabulary.find(params[:id])
  end

  def test
    @vocabularies = Vocabulary.all
  end

end
