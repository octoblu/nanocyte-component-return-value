{Transform} = require 'stream'

class ReturnValue extends Transform
  constructor: ->
    super objectMode: true

  onEnvelope: (envelope) =>
    throw new Error('onEnvelope is not implemented')

  _transform: (envelope, enc, next) =>
    try
      result = @onEnvelope envelope
    catch error
      next error
      @push null
      return

    @push result if result?
    @push null
    next()

module.exports = ReturnValue
