type t<'key, 'value>

@module("discord.js") @new external make: unit => t<'key, 'value> = "Collection"

@send external find: (t<'key, 'value>, 'value => bool) => Js.Nullable.t<'value> = "find"
@send external mapValues: (t<'key, 'value>, 'value => 'result) => t<'key, 'result> = "mapValues"
@send external keys: t<'key, 'value> => 'a = "keys"
@send external sort: (t<'key, 'value>, ('value, 'value) => int) => t<'key, 'value> = "sort"
@send external get: (t<'key, 'value>, 'key) => Js.Nullable.t<'value> = "get"
@send external set: (t<'key, 'value>, 'key, 'value) => t<'key, 'value> = "set"
@send external toJSON: t<'key, 'value> => array<'value> = "toJSON"
@send external has: (t<'key, 'value>, 'key) => bool = "has"
@send external filter: (t<'key, 'value>, 'value => bool) => t<'key, 'value> = "filter"

@get external getSize: t<'key, 'value> => int = "size"
@get external values: t<'key, 'value> => array<'value> = "values"
