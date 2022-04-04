open Discord
type t = guild

@get external getGuildRoleManager: t => roleManager = "roles"
@get external getGuildId: t => string = "id"
@get external getGuildName: t => string = "name"

@send external hasPermission: (guildMember, string) => bool = "hasPermission"
