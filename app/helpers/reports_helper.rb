# frozen_string_literal: true

module ReportsHelper
  def format_datetime(datetime)
    datetime.strftime('%Y-%m-%d %H:%M')
  end
end
