open Discord

type t = message

//@TODO: Message Attachment should be its own module
type messageAttachment

@send external reply: (t, string) => Js.Promise.t<t> = "reply"
@get external getMessageContent: t => string = "content"
@get external getMessageId: t => string = "id"
@get external getMessageAuthor: t => user = "author"
@get external getMessageMember: t => guildMember = "member"
@get external getMessageChannel: t => channel = "channel"
//his return should be Js.Nullable
@get external getMessageGuild: t => guild = "guild"

@module("discord.js") @new
external createMessageAttachment: ('attachment, string, 'data) => messageAttachment =
  "MessageAttachment"
