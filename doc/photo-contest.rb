ADMINS = ['donapieppo@example.com', 'xxx@example.it']
JURY   = ['fiorella.s@example.com', 'nicola.a@example.it']

MAX_PHOTOS_FOR_THEME = 2

module PhotoContest
  class Application < Rails::Application
    config.i18n.default_locale = :it
    config.hosts << "photo-tester.dm.unibo.it"
    config.autoload_paths += %W(#{Rails.root}/app/pdfs)

    config.contest_interval = [ Date.new(2019, 12, 01), Date.new(2020, 02, 01) ]
  end
end
    

