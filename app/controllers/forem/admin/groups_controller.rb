module Forem
  module Admin
    class GroupsController < BaseController
      def index
        @groups = Forem::Group.all
      end

      def new
        @group = Forem::Group.new
      end

      def create
        @group = Forem::Group.new(params[:group])
        if @group.save
          flash[:notice] = t("forem.admin.group.created")
          redirect_to [:admin, @group]
        else
          flash[:alert] = t("forem.admin.group.not_created")
          render :new
        end
      end

      def show
        @group = Forem::Group.find(params[:id])
      end

      def destroy
        @group = Forem::Group.find(params[:id])
        @group.destroy
        flash[:notice] = t("forem.admin.group.deleted")
        redirect_to admin_groups_path
      end
    end
  end
end
