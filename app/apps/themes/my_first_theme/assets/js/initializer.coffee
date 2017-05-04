MYCMS.Initializer =
  exec: (pageName) ->
    if pageName && MYCMS[pageName]
      MYCMS[pageName]['init']()

  currentPage: ->
    return '' unless $('#content-wrapper > section').attr('id')
    sectionId   = $('#content-wrapper > section').attr('id').split('-')
    sectionIdConcated = ''

    $.each sectionId, (index, value) ->
      sectionIdSplitted = MYCMS.Util.capitalize(value)
      sectionIdConcated = "#{sectionIdConcated}#{sectionIdSplitted}"

    sectionIdConcated

  init: ->
    MYCMS.Initializer.exec('Common')
    if @currentPage()
      MYCMS.Initializer.exec(@currentPage())

$(document).on 'ready page:load', ->
  MYCMS.Initializer.init()
