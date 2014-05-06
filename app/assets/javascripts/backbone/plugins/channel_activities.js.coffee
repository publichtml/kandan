class Kandan.Plugins.ChannelActivities
  @widget_title: "Activities"
  @widget_icon_url: "/assets/activities_icon.png"
  @pluginNamespace: "Kandan.Plugins.ChannelActivities"

  @channel_template: _.template '''
    <li><a href="#channels-<%= channel_id %>"><%= name %></a></li>
  '''
  @render: ($el)->
    $channels = $("<ul class='activity_channel_list'></ul>")
    $el.html($channels)
    @initChannelList($channels)
    $el.next().hide()

  @init: ->
    Kandan.Widgets.register @pluginNamespace

  @initChannelList: ($container)->
    channels = Kandan.Helpers.Channels.getCollection()
    for channel in channels.models
      $container.append(@channel_template(channel_id: channel.id, name: channel.get('name')))
