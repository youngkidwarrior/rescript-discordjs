open Discord
type t = reaction

@get external getReactionEmoji: t => emoji = "emoji"
@get external getReactionMessage: t => message = "message"
