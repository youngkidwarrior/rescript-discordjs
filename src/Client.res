open Discord
type t = client

type clientOptions = {intents: array<string>, partials: array<string>}

@module("discord.js") @new
external createDiscordClient: (~options: clientOptions=?) => t = "Client"
@send external login: (t, string) => Js.Promise.t<string> = "login"
@send external isReady: t => bool = "isReady"
@send external destroy: t => unit = "destroy"
@send
external on: (
  t,
  @string
  [
    | #ready(unit => unit)
    | #guildCreate(guild => unit)
    | #messageCreate(message => unit)
    | #interactionCreate(interaction => unit)
    | #guildDelete(guild => unit)
    | #guildMemberAdd(guildMember => unit)
    | #roleUpdate((~oldRole: role, ~newRole: role) => unit)
    | #guildMemberUpdate((~oldMember: guildMember, ~newMember: guildMember) => unit)
  ],
) => unit = "on"

@get external getGuildManager: t => guildManager = "guilds"
@get external getCommands: t => Collection.t<string, SlashCommandBuilder.json> = "commands"
