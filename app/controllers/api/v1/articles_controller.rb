module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        article = Article.order('created_at ASC');
        render json: {status: 'Success',message: 'Fetched successfully',data: article}, status: :ok
      end

      def show
        article=Article.find(params[:id])
        render json: {status: 'Success',message: 'Fetched successfully',data: article}, status: :ok
      end

      def create
        article=Article.new(article_params)
        if article.save
          render json: {status: 'Success',message: 'created successfully',data: article},
                 status: :ok
        else
          render json: {status: 'Failed',message: 'Create failed',data: article},
                 status: :unprocessable_entity
        end
      end

      def update
        article=Article.find(params[:id])
        if article.update_attributes(article_params)
          render json: {status: 'Success',message: 'updated successfully',data: article},
                 status: :ok
        else
          render json: {status: 'Failed',message: 'update failed',data: article},
                 status: :unprocessable_entity
        end
      end

      def destroy
        article=Article.find(params[:id])
        article.destroy
        render json: {status: 'Success',message: 'deleted successfully',data: article},
                 status: :ok
      end
      private def article_params
        params.permit( :title, :body)
      end

    end
  end
end
