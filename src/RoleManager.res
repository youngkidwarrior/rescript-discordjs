open Discord
type t = roleManager

type createRoleOptions = {
  name: string,
  color: string,
  reason: string,
}

@send
external create: (t, createRoleOptions) => Js.Promise.t<role> = "create"
//@TODO: use the correct return type for a collection
@get external getCache: t => Collection.t<string, role> = "cache"
@get external getGuild: t => guild = "guild"
