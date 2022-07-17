open Discord
type t = role

@get external getRoleId: t => string = "id"
@get external getName: t => string = "name"
@get external getGuild: t => guild = "guild"

//Use @optional flag
@send
external edit: (t, ~data: {"name": string}, ~reason: string=?) => Js.Promise.t<t> = "edit"
