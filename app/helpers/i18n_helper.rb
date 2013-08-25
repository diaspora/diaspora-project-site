module I18nHelper
  def locale_switcher_entries
    AVAILABLE_LOCALES.map { |key, name|
      locale_switcher_entry key, name
    }.join("\n").html_safe
  end

  def locale_switcher_entry key, name
    content_tag(:li, class: current_locale == key ? 'current' : nil) do
      link_to name, switch_locale_path(locale: key)
    end
  end
end
