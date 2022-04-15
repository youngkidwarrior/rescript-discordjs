open Discord
type t = guildMemberRoleManager
@send
external add: (t, role, string) => Js.Promise.t<t> = "add"
