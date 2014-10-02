tc = pimatic.tryCatch
linksAdded = no
$(document).on( "pagebeforecreate", (event) ->
  if linksAdded then return
  # make sure that we are connected and logged in:
  pimatic.socket.on('connect', ->
    if linksAdded then return
    $.ajax({
      url: '/links/get',
      type: 'GET',
      global: false
    }).done( (links) ->
      if linksAdded then return
      ul = $('#nav-panel ul')
      ul.append("""
        <li 
            data-theme="f" 
            data-role="list-divider" 
            role="heading" 
            class="ui-li-divider ui-bar-f">
              Links
        </li>
      """)
      for link in links
        ul.append("""
          <li data-theme="f">
            <a 
              href="#{link.url}" 
              data-transition="slidefade" 
              class="ui-btn ui-btn-f ui-btn-icon-right ui-icon-carat-r links-plugin"
              target="#{link.target or '_blank'}">
                #{link.title}
            </a>
          </li>
        """)
      linksAdded = yes
      pimatic.try => ul.listview('refresh')
    )
  )
)

$(document).on( "click", ".links-plugin", (event) ->
  a = $(this)
  if a.attr('target') is 'iframe'
    iframe = $('#links-iframe')
    iframe.attr('src', a.attr('href'))
    $('#links-page h3').text(a.text())
    jQuery.mobile.changePage '#links-page', transition: 'slide'
    event.preventDefault()
    return false
)