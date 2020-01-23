module ApplicationHelper
  def icon(i, txt='', size: 16, bold: false)
    "<i class='#{i}' style='font-weigh: #{bold ? 'bold': 'normal'}; font-size: #{size}px'></i>".html_safe + ' ' + txt
  end

  def link_to_delete(name = "", url, button: false)
    link_to icon('fas fa-trash') + " " + name, url, method: :delete, title: 'elimina', data: {confirm: 'Siete sicuri di voler cancellare?'}, class: (button ? 'button' : '')
  end

  def link_to_edit(name = "", url, button: false, modal: false)
    link_to icon('fas fa-edit') + " " + name, url, title: "Inserisci/modifica dati", class: (button ? 'button ' : '') + (modal ? 'modal-link ' : '')
  end

  def mail_to_contact
    mail_to CONTACT_EMAIL, CONTACT_EMAIL
  end

  def edit_and_delete_info
    content_tag :p, class: "alert alert-info my-3" do 
      "Gentile #{current_user}, hai tempo fino alla chiusura del concorso per modificare o cancellare le seguenti foto:"
    end
  end

  def link_to_new_photo
    if policy(:photo).new? 
      content_tag :div, class: "text-center my-5" do
        link_to icon('fas fa-plus-circle', t(:new_photo), size: 42), new_photo_path, class: 'new-button'  
      end
    end
  end

  def link_to_new_video
    if policy(:video).new? 
      content_tag :div, class: "text-center my-5" do
        link_to icon('fas fa-plus-circle', t(:new_video), size: 42), new_video_path, class: 'new-button'  
      end
    end
  end

  def release_description
    content_tag :p do 
      'Nel caso siano state fotografate/riprese persone, è necessario far compilare ai soggetti la '.html_safe + 
        link_to('liberatoria per utilizzo del ritratto/riprese audio-video', '/liberatoria_ritratto_video.pdf') + 
        ' e inviarla a '.html_safe + 
        mail_to('dipmat-supportoweb@unibo.it', 'dipmat-supportoweb@unibo.it.')
    end
  end
end
