# html element unit tests

require '../helper'

{html} = require 'just-html'

describe "a plain element", ->
  it "should generate just <html>", ->

    element = html()

    html.isHtml(element).should.be.true
    element.toString().should.equal "<html></html>"
