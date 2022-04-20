type t = Discord.user

@get external getBot: t => bool = "bot"
@get external getUserId: t => string = "id"
