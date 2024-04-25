# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @book = Book.find(params[:book_id]) # render 'books/show'する際に必要
    @commentable = Book.find(params[:book_id])
  end
end
