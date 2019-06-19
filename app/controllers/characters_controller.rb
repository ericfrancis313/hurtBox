class CharactersContorller < ApplicationController
  def index
    @characters = Character.all
  end
end
