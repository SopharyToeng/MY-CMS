module Themes::MyFirstTheme::MainHelper
  def self.included(klass)
    klass.helper_method [:ccca_get_nav_menu] rescue ""
  end

  def my_first_theme_settings(theme)
  end

  def my_first_theme_on_install_theme(theme)
    mycms_add_customize_theme_setting(theme)
    mycms_add_default_pages
    mycms_add_contact_post_type
  end

  def my_first_theme_on_uninstall_theme(theme)
  end

  def ccca_get_nav_menu(key = 'main_menu', class_name = "navigation")
    option = {
      menu_slug: key,
      container_class: class_name,
      container_id: 'main-menu-ul',
      item_class_parent: 'dropdown',
      sub_class:        'dropdown-menu submenu-dropdown',
      callback_item: lambda do |args|
        args[:link_attrs] = "data-title='#{args[:link][:name].parameterize}'"
        if args[:has_children]
          args[:settings][:after] = "<span class='dropdown-icon'><i class='fa fa-angle-down' aria-hidden='true'></i></span>"
          args[:link_attrs] += "data-toggle='dropdown'"
        end
      end
    }
    draw_menu(option)
  end

  def mycms_add_customize_theme_setting(theme)
    if theme.get_field_groups.where(slug: 'theme-setting').blank?
      group = theme.add_field_group({name: 'Theme Setting', slug: 'theme-setting'})
      group.add_field({ name: 'MYCMS Logo', slug: 'mycms-logo' }, { field_key: 'image' })
      group.add_field({ name: 'Address', slug: 'address' }, { field_key: 'text_area', translate: true })
    end
  end

  def mycms_add_default_pages
    page_post_type = current_site.the_post_type('page')
    if page_post_type.present?
      pages = ['Home','Project 1', 'Project 2']

      pages.each do |page|
        formatted_page = page.downcase.parameterize
        exist_page = current_site.the_post_type('page').the_posts.where("slug like '%#{formatted_page}%'")
        unless exist_page.present?
          page_post_type.add_post(title: page, content: 'lorem_ipsum')
        end
      end
    end
  end

  def mycms_add_contact_post_type
    if current_site.the_post_type('contact').blank?
      contacts = current_site.post_types.create(name: 'Contact', slug: 'contact')
      options = {
        has_category: false,
        has_content: false,
        has_tags: false,
        has_summary: false,
        has_comments: false,
        has_picture: false,
        has_template: false,
        has_keywords: false,
        contents_route_format: 'post_of_posttype'
      }
      contacts.set_meta('_default', options)
      if contacts.get_field_groups.where(slug: 'contact').blank?
        contacts_field_group = contacts.add_field_group({ name: 'Our Partners', slug: 'our-partners' } )

        contacts_field_group.add_field({ name: 'Name', slug: 'name' }          , { field_key: 'text_box', required: true, translate: true } )
        contacts_field_group.add_field({ name: 'Position', slug: 'position' }  , { field_key: 'text_box', required: true, translate: true } )
        contacts_field_group.add_field({ name: 'E-mail', slug: 'e-mail' }      , { field_key: 'text_box', required: true } )
        contacts_field_group.add_field({ name: 'Image', slug: 'image' }        , { field_key: 'image', required: true } )
      end
    end
  end
end
