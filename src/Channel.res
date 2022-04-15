type t = Discord.channel

@get external getChannelId: t => string = "id"
@get external getChannelName: t => string = "name"
