open Discord
type t = interaction

@send external isCommand: t => bool = "isCommand"
@send external reply: (t, string, 'options) => Js.Promise.t<message> = "reply"

@get external getCommandName: t => string = "commandName"
