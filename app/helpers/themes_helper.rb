module ThemesHelper
  def theme_icon(t)
    case t.title
    when '#insideoutdm'
      '<i class="fas fa-camera-retro"></i>'
    when '#mathisallaround'
      '<i class="fas fa-camera-retro"></i>'
    when '#everybodylovespi' 
      '<i class="fas fa-camera-retro"></i>'
    when '#cgiandmath'
      '<i class="fas fa-camera-retro"></i>'
    when '#tre'
      '<i class="fas fa-video"></i>'
    when '#trepiùdue'
      '<i class="fas fa-video"></i>'
    else
      ''
    end.html_safe
  end

  def current_user_can_submit_in_theme?(theme)
    (! current_user.school) || (current_user.school == theme.school)
  end
end
