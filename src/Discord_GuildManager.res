open Discord
type t = guildManager

@get external getCache: t => Discord_Collection.t<string, guild> = "cache"
