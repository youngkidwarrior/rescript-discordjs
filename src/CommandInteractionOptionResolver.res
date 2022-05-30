open Discord
type t = commandInteractionOptionResolver

@send external getString: (t, string) => Js.Nullable.t<string> = "getString"
