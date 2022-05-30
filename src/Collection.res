type t<'key, 'value>

@module("discord.js") @new external make: unit => t<'key, 'value> = "Collection"

@send external find: (t<'key, 'value>, 'value => bool) => Js.Nullable.t<'value> = "find"
@send external mapValues: (t<'key, 'value>, 'value => 'result) => t<'key, 'result> = "mapValues"
@send external keyArray: t<'key, 'value> => array<'key> = "keyArray"
@send external array: t<'key, 'value> => array<'value> = "array"
@send external sort: (t<'key, 'value>, ('value, 'value) => int) => t<'key, 'value> = "sort"
@send external get: (t<'key, 'value>, 'key) => Js.Nullable.t<'value> = "get"
@send external set: (t<'key, 'value>, 'key, 'value) => t<'key, 'value> = "set"
@send external toJSON: t<'key, 'value> => array<'value> = "toJSON"

@get external getSize: t<'key, 'value> => int = "size"
@get external values: t<'key, 'value> => array<'value> = "values"
