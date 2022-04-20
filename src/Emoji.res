open Discord
type t = emoji

@get external getEmojiName: t => string = "emoji"
