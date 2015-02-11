App.messages.index = App.messages.index || {}

class App.messages.index.archiveMessage

  constructor: (@options = {}) ->
    @make()
    @bind()

  make: () ->
    @elementClass = '.js-archive-message'
    @$element = $(@elementClass)
    @$row = @$element.closest('tr')

  bind: () ->
    @$element.on 'click', (e) =>
      e.preventDefault()
      $.ajax({
        url: @$element.attr('href'),
        type: 'put'
      }).always( =>
        @$row.hide()
      )
