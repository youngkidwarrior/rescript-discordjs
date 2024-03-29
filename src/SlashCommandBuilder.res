open Discord
type t = slashCommandBuilder

type json = {data: t, execute: interaction => Js.Promise.t<unit>}

@module("@discordjs/builders") @new external make: unit => t = "SlashCommandBuilder"
@send external setName: (t, string) => t = "setName"
@send external setDescription: (t, string) => t = "setDescription"
@send external toJSON: t => json = "toJSON"

@get external getCommandName: t => string = "name"

@send
external addStringOption: (t, slashCommandStringOption => slashCommandStringOption) => t =
  "addStringOption"
