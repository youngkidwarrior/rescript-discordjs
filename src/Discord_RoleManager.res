open Discord
type t = roleManager

//@TODO: use @optional flag
@send
external create: (t, ~options: 'options=?) => Js.Promise.t<role> = "create"
//@ODO: use the correct return type for a collection
@get external getCache: t => Discord_Collection.t<string, role> = "cache"
@get external getGuild: t => guild = "guild"
