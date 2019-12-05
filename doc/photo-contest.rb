CONTACT_EMAIL='dipmat-supportoweb@unibo.it'

ADMINS = ['donapieppo@example.com', 'xxx@example.it']
JURY   = ['fiorella.s@example.com', 'nicola.a@example.it']

MAX_PHOTOS_FOR_THEME = 2

SPONSOR_ORGANIZERS = { dm: { img: 'dm.png', url: 'http://www.eeee.unibo.it/it' } }
SPONSOR_SUPPORTERS = {
                       indam: { img: 'indam.png', url: 'https://www.eeee.it' },
                       pls: { img: 'pls.png', url: 'http://www.eeee.unibo.it/it' },
                       ghaia: { img: 'ghaia.png', url: 'https://site.unibo.it/eeee-eu-project/en' },
                       asterisco: { img: 'asterisco.png', url: 'https://www.eeee.srl' },
                       ossigeno: { img: 'ossigeno.png', url: 'http://eeee.it' },
                       zamboni: { img: 'zamboni.png', url: 'https://eeee.eeee.com' }
                      }

module PhotoContest
  class Application < Rails::Application
    config.i18n.default_locale = :it
    config.hosts << "photo-tester.dm.unibo.it"
    config.autoload_paths += %W(#{Rails.root}/app/pdfs)

    config.contest_interval = [ Date.new(2019, 12, 01), Date.new(2020, 02, 01) ]
  end
end
    

