async      = require 'async'
_          = require 'underscore'

nodemailer = require 'nodemailer'
transporter = nodemailer.createTransport 'smtps://registration%40alicesmarchforequality.com:Kinnock2016@smtp.zoho.com'

GoogleSpreadsheet = require 'google-spreadsheet'

module.exports = (app) ->
      
  app.get '/action', (req, res) ->
    res.render 'callToAction',
      display: "none"
      
  app.post '/representatives', (req, res) ->
    res.render 'callToAction',
      display: "none"