ADMINS = ['ddddd@yahoo.it']
JURY   = ['fffff@gmail.com']

MAX_PHOTOS_FOR_THEME = 2

module PhotoContest
  class Application < Rails::Application
    config.i18n.default_locale = :it
    config.hosts << "tester.unibo.it"
    config.autoload_paths += %W(#{Rails.root}/app/pdfs)

    config.contest_interval = [ Date.new(2019, 12, 01), Date.new(2020, 02, 01) ]
  end
end
    

