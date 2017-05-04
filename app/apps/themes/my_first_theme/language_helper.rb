module Themes::MyFirstTheme::LanguageHelper
  def self.included(klass)
    klass.helper_method [:mycms_language] rescue ""
  end

  def mycms_language(lang)
    locales = %w(en km).map { |l| l.prepend '/'  }
    if is_post_type?
      "#{@post_type.the_url.sub(Regexp.union(locales), '')}/?locale=#{lang}"
    else
      url_for(locale: :"#{lang}")
    end
  end
end