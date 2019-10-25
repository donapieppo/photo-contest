# encoding: utf-8
class ReleaseLetter < Prawn::Document

  attr_accessor :headers
  attr_accessor :filename
  attr_accessor :title
  attr_accessor :data

  def initialize(user)
    @user = user

    super(page_size: 'A4')

    font_families.update("LiberationSans" => {
      bold:   "/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf",
      normal: "/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf",
      italic: "/usr/share/fonts/truetype/liberation/LiberationMono-Italic.ttf"
    })
    font "LiberationSans"
    font_size 12

    move_down(25)

    text "LIBERATORIA PER L’UTILIZZAZIONE DI OPERE PROTETTE DAL DIRITTO D’AUTORE", size: 16, style: :bold, align: :center

    move_down(25)
    text "Il/La sottoscritto/a #{user.name} #{user.surname} nata/o a #{user.birthplace} il #{I18n.l user.birthdate}"
    text "residente in Via/P.zza #{user.address}"
    text "C.F. #{user.cf.upcase}(di seguito denominato “Autore”)"

    move_down(25)

    text "DICHIARA E GARANTISCE:", size: 16, style: :bold, align: :center

    move_down(25)

    text "di essere l’unico autore nonché l’esclusivo titolare dei diritti di utilizzazione economica delle fotografie (di seguito opere) allegate e, comunque, di poterne liberamente disporre nella misura necessaria ad eseguire il presente Atto."

    text "\u2022 qualora l’Opera sia stata precedentemente pubblicata, di non aver trasferito o, comunque, di aver riacquisito i diritti oggetto del presente Atto e, pertanto, di poterne liberamente disporre nella misura necessaria a dare esecuzione allo stesso;"
    text "\u2022 che l’Opera ha carattere di originalità, che la sua utilizzazione non è suscettibile di violare, né in tutto né in parte, diritti di terzi, e che il suo contenuto non è contrario a norme di legge;"
    text "\u2022 che, giusta quanto sopra dichiarato, nel caso e nella misura in cui l’Opera contenga o incorpori opere o altri materiali protetti, ovvero pubblichi o riveli in qualunque modo elementi, dati, notizie o informazioni su cui soggetti terzi possano vantare diritti, l’Autore ha preventivamente acquisito un titolo valido ed efficace per l’utilizzazione di tali opere o materiali protetti e/o per la pubblicazione di tali elementi, dati, notizie o informazioni;"
    text "\u2022 di manlevare sostanzialmente e processualmente l’Alma Mater Studiorum - Università di Bologna e di mantenerla indenne da ogni perdita, danno, responsabilità, costo o spesa, incluse le spese legali, derivanti da o in qualunque modo collegati a pretese o contestazioni di soggetti terzi, relativi all’utilizzazione dell’Opera da parte dell’Alma Mater Studiorum - Università di Bologna."

    move_down(25)

    text "TUTTO QUANTO SOPRA PREMESSO, DICHIARATO E GARANTITO L’AUTORE:", size: 16, style: :bold, align: :center

    move_down(25)

    text "\u2022 autorizza espressamente l’Alma Mater Studiorum - Università di Bologna ad utilizzare a titolo gratuito l’Opera, anche in forma parziale e/o modificata o adattata, per scopi istituzionali, scientifici, di ricerca, culturali e didattici, escludendo ogni utilizzazione di carattere commerciale. L’autorizzazione sopra specificata implica la concessione di una licenza non esclusiva, per tutto il mondo, trasferibile a terzi e senza limiti di durata da parte dell’Autore ad Alma Mater Studiorum - Università di Bologna per i diritti di cui agli artt. 12 segg. della legge n. 633/1941, compresi a titolo esemplificativo e non esaustivo: diritto di pubblicazione; diritto di riproduzione in qualunque modo o forma; diritto di trascrizione, montaggio, adattamento, elaborazione e riduzione; diritto di comunicazione e distribuzione al pubblico, comprendente i diritti di proiezione, trasmissione e diffusione (a titolo puramente esemplificativo mediante iptv, terminali mobili, voip, canali digitali, ecc.), anche in versione riassuntiva e/o ridotta, con qualsiasi mezzo tecnico, diritto di conservare copia dell’Opera, anche in forma elettronica e su qualsiasi supporto tecnologico noto o di futura invenzione per le finalità e nei limiti sopra definiti;"

    text "\u2022 richiede che l’Alma Mater Studiorum - Università di Bologna utilizzi l’Opera:"

    move_down(25)

    indent(15, 15) do
      text "\u2610 apponendo l’indicazione del nome dell’Autore o del suo pseudonimo (e.g. in caso di fotografie pubblicate su reti telematiche mediante l’apposizione di un watermark sul file contenente le indicazioni di cui all’art. 90 l. n. 633/1941), ferma restando la possibilità per l’Alma Mater Studiorum - Università di Bologna di omettere l’indicazione del nome dell’Autore o il suo pseudonimo nei casi in cui tale indicazione sia di difficile configurabilità tecnica;"
      move_down(25)

      text "o  in alternativa"

      move_down(25)

      text "\u2610  anche senza apporre sulla stessa l’indicazione del nome dell’Autore o del suo pseudonimo."
    end

    move_down(25)

    text "Bologna, lì ___/___/______"

    move_down(25)

    text "L’Autore (firma leggibile) _________________________________________"

    move_down(25)

    text "INFORMATIVA PRIVACY"
    text "I dati personali dell’Autore verranno trattati, anche con modalità in tutto o parzialmente automatizzate, per le sole finalità connesse con l’esecuzione del presente Atto."
    text " Il conferimento dei dati personali da parte dell’Autore è facoltativo; tuttavia l’eventuale rifiuto di conferire i dati renderà impossibile l’esecuzione del presente Atto."
    text " I dati personali potranno essere oggetto di comunicazione a dipendenti, collaboratori e fornitori dell’Alma Mater Studiorum - Università di Bologna, nonché ad ogni soggetto al quale la normativa vigente prevede debbano essere comunicati per il corretto adempimento degli obblighi connessi con l’esecuzione del presente Atto e, in ogni caso, nei limiti in cui ciò sia strettamente necessario per il conseguimento delle finalità sopra indicate."
    text " L’Autore potrà, in qualsiasi momento, esercitare i diritti di cui all’art. 7 del d.lgs. n. 196/2003, richiedendo, tra l’altro, la comunicazione in forma intellegibile dei dati, la cancellazione, l’aggiornamento, la rettificazione, l’opposizione al trattamento, mediante comunicazione scritta da inviarsi all’indirizzo del Titolare del trattamento."
    text " Il Titolare del trattamento dei dati è l’Alma Mater Studiorum - Università di Bologna, Via Zamboni, 33 – 40126 Bologna."
    text " Responsabile del trattamento è il Direttore Generale Marco Degli Esposti. L’elenco completo ed aggiornato dei Responsabili del trattamento può essere richiesta per iscritto al Titolare del trattamento."
  end
end


