open Discord

type t = guildMemberManager

@get external getCache: t => Collection.t<string, guildMember> = "cache"

@send external fetchAll: t => Js.Promise.t<Collection.t<string, guildMember>> = "fetch"
@send external fetchOne: (t, string) => Js.Promise.t<guildMember> = "fetch"
