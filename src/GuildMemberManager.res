open Discord

type t = guildMemberManager

@get external getCache: t => Collection.t<string, guildMember> = "cache"

@send external fetchAll: t => Js.Promise.t<Collection.t<string, guildMember>> = "fetch"
