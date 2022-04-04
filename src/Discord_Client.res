open Discord
type t = client

@module("discord.js") @new external createDiscordClient: 'a => t = "Client"
@send external login: (t, string) => unit = "login"
@get external getGuildManager: t => guildManager = "guilds"
@send
external on: (
  t,
  @string
  [
    | #ready(unit => unit)
    | #guildCreate(guild => unit)
    | #message(message => unit)
  ],
) => unit = "on"
