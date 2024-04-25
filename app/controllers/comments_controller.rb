# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      @comments = @commentable.reload.comments

      if @commentable.instance_of?(Book)
        render 'books/show', status: :unprocessable_entity
      elsif @commentable.instance_of?(Report)
        render 'reports/show', status: :unprocessable_entity
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
