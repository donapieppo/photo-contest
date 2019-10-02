module ApplicationHelper
  def icon(i, txt='', size: 16, bold: false)
    "<i class='#{i}' style='font-weigh: #{bold ? 'bold': 'normal'} font-size: #{size}px'></i>".html_safe + ' ' + txt
  end
end
