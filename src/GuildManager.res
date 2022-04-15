open Discord
type t = guildManager

@get external getCache: t => Collection.t<string, guild> = "cache"
