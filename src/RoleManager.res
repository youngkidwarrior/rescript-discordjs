open Discord
type t = roleManager

type createRoleOptions
@obj
external makeCreateRoleOptions: (
  ~data: {"name": string, "color": string},
  ~reason: string=?,
) => createRoleOptions = ""

@send
external create: (t, ~createRoleOptions: createRoleOptions) => Js.Promise.t<role> = "create"
//@ODO: use the correct return type for a collection
@get external getCache: t => Collection.t<string, role> = "cache"
@get external getGuild: t => guild = "guild"
