open Discord

type t = slashCommandStringOption

@send external setName: (t, string) => t = "setName"
@send external setDescription: (t, string) => t = "setDescription"
@send external setRequired: (t, bool) => t = "setRequired"
