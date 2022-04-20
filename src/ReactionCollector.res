open Discord
type t = reactionCollector

@send
external createReactionCollector: (
  Message.t,
  (reaction, user) => Js.Promise.t<bool>,
  'options,
) => t = "createReactionCollector"

@send
external on: (
  t,
  @string
  [
    | #collect(reaction => unit)
  ],
) => unit = "on"
