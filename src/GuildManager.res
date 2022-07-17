open Discord
type t = guildManager

module CreateFetchGuildOptions = {
  type t
  @obj external make: (~before: Snowflake.t, ~after: Snowflake.t, ~limit: int) => t = ""
}

@get external getCache: t => Collection.t<string, guild> = "cache"

@send
external fetch: (
  t,
  ~options: CreateFetchGuildOptions.t=?,
  unit,
) => Js.Promise.t<Collection.t<string, guild>> = "fetch"
