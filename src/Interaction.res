// This file assumes the Interaaction is used in a Command a.k.a BaseCommandInteraction
open Discord
type t = interaction

@send external isCommand: t => bool = "isCommand"
@send external isButton: t => bool = "isButton"
@send
external reply: (t, ~options: 'options=?, unit) => Js.Promise.t<message> = "reply"

//should be nullable
@send
external deferReply: (t, ~options: 'options=?, unit) => Js.Promise.t<message> = "deferReply"
@send
external editReply: (t, ~options: 'options, unit) => Js.Promise.t<message> = "editReply"
@send
external followUp: (t, ~options: 'options, unit) => Js.Promise.t<message> = "followUp"

@get external getCommandName: t => string = "commandName"
@get external getClient: t => client = "client"
@get external getGuildMember: t => guildMember = "member"
@get external getGuild: t => guild = "guild"
@get external getCustomId: t => string = "customId"
@get external getUser: t => user = "user"

@get external getOptions: t => commandInteractionOptionResolver = "options"
