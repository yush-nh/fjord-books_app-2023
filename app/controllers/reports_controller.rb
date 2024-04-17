# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[edit update destroy]

  def index
    @reports = Report.includes(:user).order(id: :desc).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
  end

  # GET /reports/new
  def new
    @report = current_user.reports.new
  end

  def edit; end

  def create
    ActiveRecord::Base.transaction do
      @report = current_user.reports.new(report_params)

      if @report.save && create_mentions(@report)
        redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    ActiveRecord::Base.transaction do
      @report.mentioning_relations.map(&:delete)

      if @report.update(report_params) && create_mentions(@report)
        redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @report.destroy

    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def set_report
    @report = current_user.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end

  def get_report_ids(content)
    urls = URI.extract(content, ['http'])
    return [] if urls.empty?

    ids = urls.map do |url|
      match = url.match(%r{http://localhost:3000/reports/(?<id>\d+)})
      match ? match[:id] : nil
    end
    ids.compact.map(&:to_i)
  end

  def create_mentions(report)
    report_ids = get_report_ids(report.content)

    report_ids.each do |id|
      mention = report.mentioning_relations.build(mentioned_report_id: id)
      mention.save
    end
  end
end
