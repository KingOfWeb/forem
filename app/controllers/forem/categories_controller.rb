module Forem
  class CategoriesController < Forem::ApplicationController
    load_and_authorize_resource

    def show
      @category = Forem::Category.find(params[:id])
    end
  end
end
