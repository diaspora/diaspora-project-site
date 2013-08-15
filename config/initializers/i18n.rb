AVAILABLE_LOCALES = {
  en: "English",
  de: "Deutsch"
}

I18n.default_locale = :en
I18n.available_locales = AVAILABLE_LOCALES.keys


I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
AVAILABLE_LOCALES.keys.each do |locale|
  I18n.fallbacks[locale] = [locale, I18n.default_locale]
end

RailsLocaleDetection.config do |config|
  config.locale_expiry = 3.months
  config.set_default_url_option = :explicity # valid values are true, false, :always, :never and :explicity
  config.detection_order = [:param, :user, :cookie, :request]
  config.automatically_detect = true
  config.locale_key = :locale
end
