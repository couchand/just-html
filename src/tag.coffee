# html tag

class Tag
  constructor: (@name, @attributes, @children) ->

  hasAttributes: ->
    @attributes and
      typeof @attributes is 'object' and
      Object.keys(@attributes).length

  hasChildren: ->
    @children and
      Array.isArray(@children) and
      @children.length

  toString: ->
    attrs = unless @hasAttributes()
      ''
    else
      pairs = for k, v of @attributes
        """
        #{k}="#{v}"
        """
      ' ' + pairs.join ' '

    content = unless @hasChildren()
      ''
    else
      (child.toString() for child in @children).join ''

    "<#{@name}#{attrs}>#{content}</#{@name}>"

tag = (name) ->
  name = name.toLowerCase()

  t = (attributes, children...) ->
    new Tag name, attributes, children

  t["is#{name[0].toUpperCase()}#{name[1...]}"] = (thing) ->
    thing instanceof Tag and thing.name is name

  t

tag.isTag = (thing) ->
  thing instanceof Tag

module.exports = tag
