module ApplicationHelper

  def calendar(month, year)
    cal_str = ""
    first_day = Date.new(year, month).at_beginning_of_month.wday
    last_day = Date.new(year, month).at_end_of_month.strftime("%-d").to_i
    days_of_the_week = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    cells_printed = 0
    day_counter = 1
    days_this_week = 0
    prev_month = month - 1
    prev_year = year
    if prev_month == 0
      prev_month = 12
      prev_year = year - 1
    end
    next_month = month + 1
    next_year = year
    if next_month == 13
      next_month = 1
      next_year = year + 1
    end
    cal_str += '<table style="border: 2px solid #000" id="styled_table">'
    cal_str += '<thead>'
    cal_str += '<tr>'
    cal_str += '<th style="border: 2px solid #000">'
    cal_str += link_to "Previous", calendar_path(month: prev_month, year: prev_year)
    cal_str += '</th>'
    cal_str += '<th colspan="5" style="border: 2px solid #000">'
    cal_str += Date.new(year, month).strftime("%B %Y")
    cal_str += '</th>'
    cal_str += '<th style="border: 2px solid #000; text-align: right">'
    cal_str += link_to "Next", calendar_path(month: next_month, year: next_year)
    cal_str += '</th>'
    cal_str += '</tr>'
    cal_str += '</thead>'
    cal_str += '<tbody>'
    cal_str += '<tr>'
    days_of_the_week.each do |day_of_week|
      cal_str += '<td style="background: #999; border: 2px solid #000; font-weight: bold; align: center; padding: 5px">'
      cal_str += day_of_week
      cal_str += '</td>'
    end
    cal_str += '</tr>'
    cal_str += '<tr>'
    first_day.times do
      cal_str += '<td style="border: 2px solid #000; text-align: right">&nbsp;</td>'
      cells_printed += 1
    end
    (7 - first_day).times do |day|
      cal_str += '<td style="border: 2px solid #000; text-align: right">'
      cal_str += (day + 1).to_s
      cal_str += '</td>'
      day_counter += 1
      cells_printed += 1
    end
    cal_str += '</tr>'
    cal_str += '<tr>'
    while day_counter <= last_day
      cal_str += '<td style="border: 2px solid #000; text-align: right">'
      cal_str += day_counter.to_s
      cal_str += '</td>'
      day_counter += 1
      cells_printed += 1
      days_this_week += 1
      if cells_printed % 7 == 0
        cal_str += '<tr></tr>'
        days_this_week = 0
      end
    end
    while days_this_week < 7
      cal_str += '<td style="border: 2px solid #000; text-align: right">&nbsp;</td>'
      days_this_week += 1
    end
    cal_str += '</tr>'
    cal_str += '</tbody>'
    cal_str += '</table>'
    return cal_str.html_safe
  end

end