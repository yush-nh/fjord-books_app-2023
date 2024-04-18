# frozen_string_literal: true

require 'uri'

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :mentioning_relations, class_name: 'Mention', foreign_key: :mentioning_report_id, inverse_of: :mentioning_report, dependent: :destroy
  has_many :mentioning_reports, through: :mentioning_relations, source: :mentioned_report

  has_many :mentioned_relations, class_name: 'Mention', foreign_key: :mentioned_report_id, inverse_of: :mentioned_report, dependent: :destroy
  has_many :mentioned_reports, through: :mentioned_relations, source: :mentioning_report

  validates :title, presence: true
  validates :content, presence: true

  def editable?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end

  def extract_report_ids(content)
    urls = URI.extract(content, ['http'])
    return [] if urls.empty?

    ids = urls.map do |url|
      match = url.match(%r{http://localhost:3000/reports/(?<id>\d+)})
      match ? match[:id] : nil
    end
    ids.compact.uniq.map(&:to_i)
  end

  def create_mentions
    report_ids = extract_report_ids(content)

    report_ids.each do |id|
      mention = mentioning_relations.build(mentioned_report_id: id)
      mention.save
    end
  end
end
