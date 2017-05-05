MYCMS.Project1 = do ->
  _init = ->
    _coachImageReveal()

  _coachImageReveal = ->
    console.log 'hi'
    scrollRevealConfig =
      delay: 500
      distance: '80px'
      easing: 'ease'
      rotate:
        z: 10
      scale: 0.5

    window.sr = ScrollReveal(scrollRevealConfig)
    sr.reveal '.contact-image'

  { init: _init }
