require 'should'
request = require 'request'

describe 'requesting a resource via the pagekite hostname', ->
  {kitename} = require '../pagekite.json'

  it 'returns the locally hosted resource', (done) ->
    request "http://#{kitename}/kite.png", (err, response) ->
      response.statusCode.should.equal 200
      done err






