open Discord
type t = guildMemberRoleManager
@send
external add: (t, role, ~reason: string=?, unit) => Js.Promise.t<t> = "add"
