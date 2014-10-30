# a simple page test

require '../helper'

{html, body, h3, p} = require 'just-html'

describe "a simple page", ->
  it "should generate html", ->

    page = html {},
      body {},
        h3
          class: 'header'
          "Now this is nice."

        p
          class: 'content'
          "Foobar"

    page.toString().should.equal '<html><body><h3 class="header">Now this is nice.</h3><p class="content">Foobar</p></body></html>'
