open Discord
type t = reactionManager

@send external removeAll: t => Js.Promise.t<message> = "removeAll"
