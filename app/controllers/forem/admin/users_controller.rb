module Forem
  module Admin
    class UsersController < BaseController
      def autocomplete
        users = Forem.user_class.forem_autocomplete(params[:term])
        render :json => users.map { |u| u.send(Forem.autocomplete_field) }
      end
    end
  end
end

