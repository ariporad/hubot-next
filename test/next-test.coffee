Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../src/next.coffee')

describe 'next', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'It responds to the default trigger', ->
    delete process.env.HUBOT_NEXT_TRIGGER;
    @room.user.say('alice', 'And you should blow up the moon. Problem Solved. !next').then =>
      expect(@room.messages).to.eql [
        ['alice', 'And you should blow up the moon. Problem Solved. !next']
        ['hubot', 'Another Satisfied Customer! NEXT!']
      ]

  it 'It responds with the custom next message', ->
    process.env.HUBOT_NEXT_MESSAGE = 'AAAAAAAAND, NEXT!';
    @room.user.say('alice', 'And you should blow up the moon. Problem Solved. !next').then =>
      expect(@room.messages).to.eql [
        ['alice', 'And you should blow up the moon. Problem Solved. !next']
        ['hubot', 'AAAAAAAAND, NEXT!']
      ]

