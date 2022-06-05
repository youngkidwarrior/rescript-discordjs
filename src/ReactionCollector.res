open Discord
type t = reactionCollector

@send
external createReactionCollector: (message, 'options) => t = "createReactionCollector"

@send
external on: (
  t,
  @string
  [
    | #collect(reaction => unit)
  ],
) => unit = "on"
