open Discord

type t = messageActionRow
@module("discord.js") @new external make: unit => t = "MessageActionRow"

@send external addComponents: (t, messageButton) => t = "addComponents"