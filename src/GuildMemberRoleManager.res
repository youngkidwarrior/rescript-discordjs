open Discord
type t = guildMemberRoleManager

@get external getCache: t => Collection.t<string, role> = "cache"

@send
external add: (t, role, ~reason: string=?, unit) => Js.Promise.t<t> = "add"

@send
external removeRole: (t, role, ~reason: string=?, unit) => Js.Promise.t<guildMember> = "remove"
@send
external removeArray: (t, array<role>, ~reason: string=?, unit) => Js.Promise.t<guildMember> =
  "remove"
@send
external removeCollection: (
  t,
  Collection.t<string, role>,
  ~reason: string=?,
  unit,
) => Js.Promise.t<guildMember> = "remove"
