open Discord

type t = message

//@TODO: Message Attachment should be its own module
type messageAttachment

@send external reply: (t, 'options) => Js.Promise.t<t> = "reply"
@send external react: (t, string) => Js.Promise.t<Emoji.t> = "react"
@send external edit: (t, 'options) => Js.Promise.t<t> = "edit"
@send external delete: t => Js.Promise.t<t> = "delete"

@get external getMessageContent: t => string = "content"
@get external getMessageId: t => string = "id"
@get external getMessageAuthor: t => user = "author"
@get external getMessageMember: t => guildMember = "member"
@get external getMessageChannel: t => channel = "channel"
// This return should be Js.Nullable
@get external getMessageGuild: t => guild = "guild"
@get external getMessageReactions: t => reactionManager = "reactions"
@get
external getMessageAttachments: t => Collection.t<Snowflake.t, messageAttachment> = "attachments"
@get
external getMessageEmbeds: t => Collection.t<Snowflake.t, messageEmbed> = "embeds"

@module("discord.js") @new
external createMessageAttachment: ('attachment, string, 'data) => messageAttachment =
  "MessageAttachment"
