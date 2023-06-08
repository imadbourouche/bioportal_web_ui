# frozen_string_literal: true

class LanguageFieldComponent < ViewComponent::Base

  LEXVO_TO_FLAG = { 'http://lexvo.org/id/iso639-3/aar' => 'aa', 'http://lexvo.org/id/iso639-3/abk' => 'ab',
                     'http://lexvo.org/id/iso639-3/ave' => 'ae', 'http://lexvo.org/id/iso639-3/afr' => 'af',
                     'http://lexvo.org/id/iso639-3/aka' => 'ak', 'http://lexvo.org/id/iso639-3/amh' => 'am',
                     'http://lexvo.org/id/iso639-3/arg' => 'an', 'http://lexvo.org/id/iso639-3/ara' => 'ar', 'http://lexvo.org/id/iso639-3/asm' => 'as', 'http://lexvo.org/id/iso639-3/ava' => 'av', 'http://lexvo.org/id/iso639-3/aym' => 'ay', 'http://lexvo.org/id/iso639-3/aze' => 'az', 'http://lexvo.org/id/iso639-3/bak' => 'ba', 'http://lexvo.org/id/iso639-3/bel' => 'be', 'http://lexvo.org/id/iso639-3/bul' => 'bg', 'http://lexvo.org/id/iso639-3/bis' => 'bi', 'http://lexvo.org/id/iso639-3/bam' => 'bm', 'http://lexvo.org/id/iso639-3/ben' => 'bn', 'http://lexvo.org/id/iso639-3/bod' => 'bo', 'http://lexvo.org/id/iso639-3/bre' => 'br', 'http://lexvo.org/id/iso639-3/bos' => 'bs', 'http://lexvo.org/id/iso639-3/cat' => 'ca', 'http://lexvo.org/id/iso639-3/che' => 'ce', 'http://lexvo.org/id/iso639-3/cha' => 'ch', 'http://lexvo.org/id/iso639-3/cos' => 'co', 'http://lexvo.org/id/iso639-3/cre' => 'cr', 'http://lexvo.org/id/iso639-3/ces' => 'cs', 'http://lexvo.org/id/iso639-3/chu' => 'cu', 'http://lexvo.org/id/iso639-3/chv' => 'cv', 'http://lexvo.org/id/iso639-3/cym' => 'cy', 'http://lexvo.org/id/iso639-3/dan' => 'da', 'http://lexvo.org/id/iso639-3/deu' => 'de', 'http://lexvo.org/id/iso639-3/div' => 'dv', 'http://lexvo.org/id/iso639-3/dzo' => 'dz', 'http://lexvo.org/id/iso639-3/ewe' => 'ee', 'http://lexvo.org/id/iso639-3/ell' => 'el', 'http://lexvo.org/id/iso639-3/eng' => 'en', 'http://lexvo.org/id/iso639-3/epo' => 'eo', 'http://lexvo.org/id/iso639-3/spa' => 'es', 'http://lexvo.org/id/iso639-3/est' => 'et', 'http://lexvo.org/id/iso639-3/eus' => 'eu', 'http://lexvo.org/id/iso639-3/fas' => 'fa', 'http://lexvo.org/id/iso639-3/ful' => 'ff', 'http://lexvo.org/id/iso639-3/fin' => 'fi', 'http://lexvo.org/id/iso639-3/fij' => 'fj', 'http://lexvo.org/id/iso639-3/fao' => 'fo', 'http://lexvo.org/id/iso639-3/fra' => 'fr', 'http://lexvo.org/id/iso639-3/fry' => 'fy', 'http://lexvo.org/id/iso639-3/gle' => 'ga', 'http://lexvo.org/id/iso639-3/gla' => 'gd', 'http://lexvo.org/id/iso639-3/glg' => 'gl', 'http://lexvo.org/id/iso639-3/grn' => 'gn', 'http://lexvo.org/id/iso639-3/guj' => 'gu', 'http://lexvo.org/id/iso639-3/glv' => 'gv', 'http://lexvo.org/id/iso639-3/hau' => 'ha', 'http://lexvo.org/id/iso639-3/heb' => 'he', 'http://lexvo.org/id/iso639-3/hin' => 'hi', 'http://lexvo.org/id/iso639-3/hmo' => 'ho', 'http://lexvo.org/id/iso639-3/hrv' => 'hr', 'http://lexvo.org/id/iso639-3/hat' => 'ht', 'http://lexvo.org/id/iso639-3/hun' => 'hu', 'http://lexvo.org/id/iso639-3/hye' => 'hy', 'http://lexvo.org/id/iso639-3/her' => 'hz', 'http://lexvo.org/id/iso639-3/ina' => 'ia', 'http://lexvo.org/id/iso639-3/ind' => 'id', 'http://lexvo.org/id/iso639-3/ile' => 'ie', 'http://lexvo.org/id/iso639-3/ibo' => 'ig', 'http://lexvo.org/id/iso639-3/iii' => 'ii', 'http://lexvo.org/id/iso639-3/ipk' => 'ik', 'http://lexvo.org/id/iso639-3/ido' => 'io', 'http://lexvo.org/id/iso639-3/isl' => 'is', 'http://lexvo.org/id/iso639-3/ita' => 'it', 'http://lexvo.org/id/iso639-3/iku' => 'iu', 'http://lexvo.org/id/iso639-3/jpn' => 'ja', 'http://lexvo.org/id/iso639-3/jav' => 'jv', 'http://lexvo.org/id/iso639-3/kat' => 'ka', 'http://lexvo.org/id/iso639-3/kon' => 'kg', 'http://lexvo.org/id/iso639-3/kik' => 'ki', 'http://lexvo.org/id/iso639-3/kua' => 'kj', 'http://lexvo.org/id/iso639-3/kaz' => 'kk', 'http://lexvo.org/id/iso639-3/kal' => 'kl', 'http://lexvo.org/id/iso639-3/khm' => 'km', 'http://lexvo.org/id/iso639-3/kan' => 'kn', 'http://lexvo.org/id/iso639-3/kor' => 'ko', 'http://lexvo.org/id/iso639-3/kau' => 'kr', 'http://lexvo.org/id/iso639-3/kas' => 'ks', 'http://lexvo.org/id/iso639-3/kur' => 'ku', 'http://lexvo.org/id/iso639-3/kom' => 'kv', 'http://lexvo.org/id/iso639-3/cor' => 'kw', 'http://lexvo.org/id/iso639-3/kir' => 'ky', 'http://lexvo.org/id/iso639-3/lat' => 'la', 'http://lexvo.org/id/iso639-3/ltz' => 'lb', 'http://lexvo.org/id/iso639-3/lug' => 'lg', 'http://lexvo.org/id/iso639-3/lim' => 'li', 'http://lexvo.org/id/iso639-3/lin' => 'ln', 'http://lexvo.org/id/iso639-3/lao' => 'lo', 'http://lexvo.org/id/iso639-3/lit' => 'lt', 'http://lexvo.org/id/iso639-3/lub' => 'lu', 'http://lexvo.org/id/iso639-3/lav' => 'lv', 'http://lexvo.org/id/iso639-3/mlg' => 'mg', 'http://lexvo.org/id/iso639-3/mah' => 'mh', 'http://lexvo.org/id/iso639-3/mri' => 'mi', 'http://lexvo.org/id/iso639-3/mkd' => 'mk', 'http://lexvo.org/id/iso639-3/mal' => 'ml', 'http://lexvo.org/id/iso639-3/mon' => 'mn', 'http://lexvo.org/id/iso639-3/mar' => 'mr', 'http://lexvo.org/id/iso639-3/msa' => 'ms', 'http://lexvo.org/id/iso639-3/mlt' => 'mt', 'http://lexvo.org/id/iso639-3/mya' => 'my', 'http://lexvo.org/id/iso639-3/nau' => 'na', 'http://lexvo.org/id/iso639-3/nob' => 'nb', 'http://lexvo.org/id/iso639-3/nde' => 'nd', 'http://lexvo.org/id/iso639-3/nep' => 'ne', 'http://lexvo.org/id/iso639-3/ndo' => 'ng', 'http://lexvo.org/id/iso639-3/nld' => 'nl', 'http://lexvo.org/id/iso639-3/nno' => 'nn', 'http://lexvo.org/id/iso639-3/nor' => 'no', 'http://lexvo.org/id/iso639-3/nbl' => 'nr', 'http://lexvo.org/id/iso639-3/nav' => 'nv', 'http://lexvo.org/id/iso639-3/nya' => 'ny', 'http://lexvo.org/id/iso639-3/oci' => 'oc', 'http://lexvo.org/id/iso639-3/oji' => 'oj', 'http://lexvo.org/id/iso639-3/orm' => 'om', 'http://lexvo.org/id/iso639-3/ori' => 'or', 'http://lexvo.org/id/iso639-3/oss' => 'os', 'http://lexvo.org/id/iso639-3/pan' => 'pa', 'http://lexvo.org/id/iso639-3/pli' => 'pi', 'http://lexvo.org/id/iso639-3/pol' => 'pl', 'http://lexvo.org/id/iso639-3/pus' => 'ps', 'http://lexvo.org/id/iso639-3/por' => 'pt', 'http://lexvo.org/id/iso639-3/que' => 'qu', 'http://lexvo.org/id/iso639-3/roh' => 'rm', 'http://lexvo.org/id/iso639-3/run' => 'rn', 'http://lexvo.org/id/iso639-3/ron' => 'ro', 'http://lexvo.org/id/iso639-3/rus' => 'ru', 'http://lexvo.org/id/iso639-3/kin' => 'rw', 'http://lexvo.org/id/iso639-3/san' => 'sa', 'http://lexvo.org/id/iso639-3/srd' => 'sc', 'http://lexvo.org/id/iso639-3/snd' => 'sd', 'http://lexvo.org/id/iso639-3/sme' => 'se', 'http://lexvo.org/id/iso639-3/sag' => 'sg', 'http://lexvo.org/id/iso639-3/hbs' => 'sh', 'http://lexvo.org/id/iso639-3/sin' => 'si', 'http://lexvo.org/id/iso639-3/slk' => 'sk', 'http://lexvo.org/id/iso639-3/slv' => 'sl', 'http://lexvo.org/id/iso639-3/smo' => 'sm', 'http://lexvo.org/id/iso639-3/sna' => 'sn', 'http://lexvo.org/id/iso639-3/som' => 'so', 'http://lexvo.org/id/iso639-3/sqi' => 'sq', 'http://lexvo.org/id/iso639-3/srp' => 'sr', 'http://lexvo.org/id/iso639-3/ssw' => 'ss', 'http://lexvo.org/id/iso639-3/sot' => 'st', 'http://lexvo.org/id/iso639-3/sun' => 'su', 'http://lexvo.org/id/iso639-3/swe' => 'sv', 'http://lexvo.org/id/iso639-3/swa' => 'sw', 'http://lexvo.org/id/iso639-3/tam' => 'ta', 'http://lexvo.org/id/iso639-3/tel' => 'te', 'http://lexvo.org/id/iso639-3/tgk' => 'tg', 'http://lexvo.org/id/iso639-3/tha' => 'th', 'http://lexvo.org/id/iso639-3/tir' => 'ti', 'http://lexvo.org/id/iso639-3/tuk' => 'tk', 'http://lexvo.org/id/iso639-3/tgl' => 'tl', 'http://lexvo.org/id/iso639-3/tsn' => 'tn', 'http://lexvo.org/id/iso639-3/ton' => 'to', 'http://lexvo.org/id/iso639-3/tur' => 'tr', 'http://lexvo.org/id/iso639-3/tso' => 'ts', 'http://lexvo.org/id/iso639-3/tat' => 'tt', 'http://lexvo.org/id/iso639-3/twi' => 'tw', 'http://lexvo.org/id/iso639-3/tah' => 'ty', 'http://lexvo.org/id/iso639-3/uig' => 'ug', 'http://lexvo.org/id/iso639-3/ukr' => 'uk', 'http://lexvo.org/id/iso639-3/urd' => 'ur', 'http://lexvo.org/id/iso639-3/uzb' => 'uz', 'http://lexvo.org/id/iso639-3/ven' => 've', 'http://lexvo.org/id/iso639-3/vie' => 'vi', 'http://lexvo.org/id/iso639-3/vol' => 'vo', 'http://lexvo.org/id/iso639-3/wln' => 'wa', 'http://lexvo.org/id/iso639-3/wol' => 'wo', 'http://lexvo.org/id/iso639-3/xho' => 'xh', 'http://lexvo.org/id/iso639-3/yid' => 'yi', 'http://lexvo.org/id/iso639-3/yor' => 'yo', 'http://lexvo.org/id/iso639-3/zha' => 'za', 'http://lexvo.org/id/iso639-3/zho' => 'zh', 'http://lexvo.org/id/iso639-3/zul' => 'zu' }


  def initialize(value: )
    super
    @lang_code =  lang_codes_init(value)
  end

  def lang_codes_init(lang)
    if lang.to_s.eql?("en") || lang.to_s.eql?("eng") || lang.to_s.eql?("http://lexvo.org/id/iso639-3/eng")
      lang_codes = "gb"
    elsif lang.to_s.start_with?("http://lexvo.org")
      lang_codes = LEXVO_TO_FLAG[lang]
    else
      lang_codes = lang
    end
    lang_codes
  end
end
