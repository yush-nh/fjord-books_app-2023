# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable

  def set_commentable
    @report = Report.find(params[:report_id]) # render 'reports/show'する際に必要
    @commentable = Report.find(params[:report_id])
  end
end
