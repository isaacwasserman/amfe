async      = require 'async'
_          = require 'underscore'

nodemailer = require 'nodemailer'
#transporter = nodemailer.createTransport 'smtps://user%40gmail.com:pass@smtp.gmail.com'

GoogleSpreadsheet = require 'google-spreadsheet'


module.exports = (app) ->
  
  app.get '/', (req, res) ->
    res.render 'home'
    
  app.get '/register', (req, res) ->
    res.render 'register'
  
  app.get '/contact', (req, res) ->
    res.render 'contact'
    
  app.post '/contact', (req, res) ->
    {email, message} = req.body
    doc   = new GoogleSpreadsheet '1y7PlMMQD34bzFnRoF6Qs28QB2H4ciSDySEv8RJbVJoU'
    sheet = {}

    async.series

      setAuth: (cb) ->
        creds = require '../creds/google-generated-creds.json'
        doc.useServiceAccountAuth creds, cb

      writeARow: (cb) ->
        row =
          timestamp: Date()
          From: email
          Message: message
          
        doc.addRow 1, row, (err) ->
          cb()

      , (err, results) ->
        res.json 'Did It'


  app.post '/register', (req, res) ->
    {alone_or_group, name, volunteer, email, number_of_people} = req.body
    doc   = new GoogleSpreadsheet '1XZSHGD2UKKoPx2J6jPVGr1B1BhExroukAh4RE2qzGRo'
    sheet = {}
    
    async.series

      setAuth: (cb) ->
        creds = require '../creds/google-generated-creds.json'
        doc.useServiceAccountAuth creds, cb

      writeARow: (cb) ->
        row =
          timestamp: Date()
          alone_or_group: alone_or_group
          name: name
          volunteer: volunteer
          email: email
          number_of_people: number_of_people
          
        doc.addRow 1, row, (err) ->
          cb()

      , (err, results) ->
        res.json 'Did It'
    