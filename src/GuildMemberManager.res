open Discord

type t = guildMemberManager

@get external getCache: t => Collection.t<string, guildMember> = "cache"
