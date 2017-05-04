MYCMS.Common = do ->
  _init = ->
    _navbarToggle()
    _scrollToTop()
    _addClassyLeave()

  _navbarToggle = ->
    $('ul.dropdown-menu.submenu-dropdown [data-toggle=dropdown]').on 'click', (e) ->
      event.preventDefault()
      event.stopPropagation()
      $('ul.dropdown-menu.submenu-dropdown [data-toggle=dropdown]').parent().removeClass('open')
      $(this).parent().addClass('open')

  _scrollToTop = ->
    $(window).scroll ->
      if $(this).scrollTop() > 50
        $('#back-to-top').fadeIn()
      else
        $('#back-to-top').fadeOut()

    $('#back-to-top').click ->
      $('#back-to-top').tooltip 'hide'
      $('body,html').animate { scrollTop: 0 }, 800

    $('#back-to-top').tooltip 'show'

  _addClassyLeave = ->
    tree = new ClassyLeaves(
      leaves: 30
      maxY: -10
      multiplyOnClick: true
      multiply: 2
      infinite: true
      speed: 4000)
    $('body').on 'click', '.addLeaf', ->
      console.log '8'
      tree.add 8
      false

  { init: _init }