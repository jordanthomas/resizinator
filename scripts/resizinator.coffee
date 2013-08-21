parseSize = (size) ->
  sizes = size.split 'x'
  
  alert "Invalid dimensions." unless sizes.length is 2
  
  sizes = for size in sizes
    unless isNaN size
      parseInt(size)
    else
      size
  
  width: sizes[0], height: sizes[1]

swapDimensions = (size) ->
  width: size.height, height: size.width

onMenuItemClick = (e) ->
  $this = $ this
  size = parseSize $this.data('size')
  changeSize size, $this.data('device')

changeSize = (size, device) ->
  if size.width isnt size.height
    if $iframe.width() is size.width and $iframe.height() is size.height
      size = swapDimensions size
  
  if size.width > size.height
    orientation= 'landscape'
  else
    orientation= 'portrait'
  
  $iframe
    .removeClass('landscape portrait iphone ipad')
    .addClass(orientation)
  
  $iframe.addClass(device) if device?
  
  $iframe.css
    width: size.width
    height: size.height
    
$iframe = $ 'iframe'
$body = $ 'body'

menuTemplate = '<div id="responder-menu">
  <ul>
    <li data-size="320x568" data-device="iphone">Phone</li>
    <li data-size="768x1024" data-device="ipad">Tablet</li>
    <li data-size="100%x100%">Desktop</li>
  </ul>
</div>'

$menu = $ menuTemplate

$body.append $menu

$menu.on 'click', 'li', onMenuItemClick
