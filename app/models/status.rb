class Status

  def self.active?
    #  @@active ||= Date.today.in?(Rails.configuration.contest_interval) 
    true
  end

end
