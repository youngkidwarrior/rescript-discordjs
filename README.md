<div align="center">
	<br />
	<p>
		<a href="https://discord.js.org"><img src="https://discord.js.org/static/logo.svg" width="546" alt="discord.js" /></a>
	</p>
	<br />
	<p>
    	<a href="https://www.npmjs.com/package/rescript-discordjs"><img src="https://img.shields.io/npm/v/discord.js.svg?maxAge=3600" alt="npm version" /></a>
    	<a href="https://www.npmjs.com/package/rescript-discordjs"><img src="https://img.shields.io/npm/dt/discord.js.svg?maxAge=3600" alt="npm downloads" /></a>
    </p>

</div>

## About

rescript-discordjs are [Rescript](https://rescript-lang.org/) bindings for discord.js

discord.js is a powerful [Node.js](https://nodejs.org) module that allows you to easily interact with the
[Discord API](https://discord.com/developers/docs/intro).

- Object-oriented
- Predictable abstractions
- Performant
- 100% coverage of the Discord API

## Installation

**Node.js 16.9.0 or newer is required.**

```sh-session
npm install rescript-discord
yarn add rescript-discord
pnpm add rescript-discord
```

## Example usage

Install rescript-discordjs and discord.js:

```sh-session
npm install rescript-discord discord.js @discordjs/rest discord-api-types/v9
yarn add rescript-discord discord.js discord.js @discordjs/rest discord-api-types/v9
pnpm add rescript-discord discord.js discord.js @discordjs/rest discord-api-types/v9
```

Add rescript-discord on `bsconfig.json` and open in global scope

```
{
  ...
  "bs-dependencies": [
    "rescript-discordjs",
  ],
  "bsc-flags": ["-open Discord"]
}
```

Register a slash command against the Discord API:

```rescript
module Rest = {
  type t
  @module("@discordjs/rest") @new external make: {"version": int} => t = "REST"
  @send external setToken: (t, string) => t = "setToken"
  @send
  external put: (t, string, {"body": array<SlashCommandBuilder.json>}) => Js.Promise.t<unit> = "put"
  @send
  external delete: (t, string) => Js.Promise.t<unit> = "delete"
}

module Routes = {
  type t
  @module("discord-api-types/v9") @scope("Routes")
  external applicationCommands: (~clientId: string) => string = "applicationCommands"
  @module("discord-api-types/v9") @scope("Routes")
  external applicationCommand: (~clientId: string, ~commandId: string) => string =
    "applicationCommand"
}
module ExampleCommand = {
  let data =
    SlashCommandBuilder.make()
    ->SlashCommandBuilder.setName("example")
    ->SlashCommandBuilder.setDescription("Example Command")

  let execute = async (interaction) => {
    switch await interaction->Interaction.reply(
      ~options={"content": "Ping!"},
      (),
    ) {
    | exception JsError(obj) =>
      JsError(obj)->raise
    | _ => ()
    }
  }
}


let exampleCommand = ExampleCommand.data->SlashCommandBuilder.toJSON

let commands = [exampleCommand]

let token = "{Discord Bot Token}"
let clientId = "{Discord Client Id}"



Rest.make({"version": 9})
->Rest.setToken(token)
->Rest.put(Routes.applicationCommands(~clientId), {"body": commands})
->thenResolve(() => Js.log("Successfully registered application commands."))
->catch(e => {
  switch e {
  | JsError(obj) =>
    switch Js.Exn.message(obj) {
    | Some(msg) => Js.Console.error("Deploy Commands Error: " ++ msg)
    | None => Js.Console.error("Must be some non-error value")
    }
  | _ => Js.Console.error("Some unknown error")
  }
  resolve()
})
->ignore
```

Afterwards we can create a quite simple example bot:

```js

let onInteraction = async (interaction: Interaction.t) => {

  let isCommand = interaction->Interaction.isCommand
  let isButton = interaction->Interaction.isButton
  switch (isCommand, isButton) {
  | (true, false) => {
      let commandName = interaction->Interaction.getCommandName
      let command = commands->Collection.get(commandName)->Js.Nullable.toOption
      switch command {
      | None => Js.Console.error("Bot.res: Command not found")
      | Some(module(Command)) =>
        switch await Command.execute(interaction) {
        | exception e =>
          switch e {
          | JsError(obj) => Js.Console.error(obj)
          | _ => Js.Console.error(e)
          }
        | _ =>
          Js.log(
            `Successfully served the command ${commandName}`,
          )
        }
      }
    }

  | (false, true) => {
      let buttonCustomId = interaction->Interaction.getCustomId
      let button = buttons->Collection.get(buttonCustomId)->Js.Nullable.toOption

      switch button {
      | None => Js.Console.error("Bot.res: Button not found")
      | Some(module(Button)) =>
        switch await Button.execute(interaction) {
        | exception e =>
          switch e {
          | JsError(obj) => Js.Console.error2(obj)
          | _ => Js.Console.error(e)
          }
        | _ =>
          Js.Console.log(
            `Successfully served button press "${buttonCustomId}"`,
          )
        }
      }
    }
  | (_, _) => Js.Console.error("Bot.res: Unknown interaction")
  }
}

client->Client.on(
  #ready(
    () => {
      Js.log("Logged In")
    },
  ),
)

client->Client.on(#interactionCreate(interaction => interaction->onInteraction->ignore))

client->Client.login(token)->ignore

```

## Contributing

Most of these bindings are incomplete. If you need something not provided, write a binding for it!
