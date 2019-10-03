module ApplicationHelper
  def icon(i, txt='', size: 16, bold: false)
    "<i class='#{i}' style='font-weigh: #{bold ? 'bold': 'normal'}; font-size: #{size}px'></i>".html_safe + ' ' + txt
  end

  def link_to_delete(name = "", url, button: false)
    link_to icon('fas fa-trash') + " " + name, url, method: :delete, title: 'elimina', data: {confirm: 'Siete sicuri di voler cancellare?'}, class: (button ? 'button' : '')
  end
end
