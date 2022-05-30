open Discord

type t = permissions

module Flags = {
  type t = int
  @module("discord.js") @scope(("Permissions", "FLAGS")) external administrator: t = "ADMINISTRATOR"
}

@send external has: (t, Flags.t) => bool = "has"
