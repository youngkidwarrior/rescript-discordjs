open Discord

type t = messageActionRow
@module("discord.js") @new external make: unit => t = "MessageActionRow"

// Only supports buttons at the moment
@send external addComponents: (t, array<messageButton>) => t = "addComponents"
