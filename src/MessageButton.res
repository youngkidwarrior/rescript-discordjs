open Discord

type t = messageButton
@module("discord.js") @new external make: unit => t = "MessageButton"

@send external setCustomId: (t, string) => t = "setCustomId"
@send external setLabel: (t, string) => t = "setLabel"
@send external setStyle: (t, string) => t = "setStyle"
@send external setURL: (t, string) => t = "setURL"
