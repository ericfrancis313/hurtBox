class VocabtestController < ApplicationController

  def index
    @vocabularies = Vocabulary.all
  end

end
