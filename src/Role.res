open Discord
type t = role

@get external getName: t => string = "name"

//Use @optional flag
@send
external edit: (t, ~data: {"name": string}, ~reason: string=?) => Js.Promise.t<t> = "edit"
