class VocabularyController < ApplicationController

  def index
    @vocabulary = Vocabulary.all
  end

end
