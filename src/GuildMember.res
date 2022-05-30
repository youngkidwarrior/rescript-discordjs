open Discord
type t = guildMember

@get external getGuildMemberId: t => string = "id"
@get external getGuildMemberRoleManager: t => guildMemberRoleManager = "roles"
@get external getGuild: t => guild = "guild"
@get external getPermissions: t => permissions = "permissions"

// @TODO:options is optional
@send
external send: (t, 'content, 'options) => Js.Promise.t<message> = "send"
