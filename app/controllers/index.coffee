async      = require 'async'
_          = require 'underscore'

request = require 'request'
cheerio = require 'cheerio'
nodemailer = require 'nodemailer'
transporter = nodemailer.createTransport 'smtps://registration%40alicesmarchforequality.com:Kinnock2016@smtp.zoho.com'

GoogleSpreadsheet = require 'google-spreadsheet'

emailMessages = require "./emailMessages"

module.exports = (app) ->
  
  app.get '/', (req, res) ->
    res.render 'home'
    
  app.get '/register', (req, res) ->
    res.render 'register', 
          display: 'none'
  
  app.get '/contact', (req, res) ->
    res.render 'contact',
      display: "none"
      
  app.get '/action', (req, res) ->
    res.render 'callToAction',
      display: "none"
    
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
        res.render 'contact',
          display: "block"

  app.get '/action', (req, res) ->
    res.render 'callToAction',
      display: "none"
      
  app.get '/congress/:zipcode', (req, res) ->
    zipcode = req.params.zipcode
    url = 'http://whoismyrepresentative.com/search/zip/' + zipcode
    request url, (error, response, html) ->
      if !error and response.statusCode == 200
        $ = cheerio.load(html)
        memlinks = []
        $('.mem_link a').each (i, element) ->
          memlinks.push {'number':i, 'link':$(this).attr('href'), 'name':$(this).text()}
        
        contactLinks = []
        
        async.map memlinks, ((member, callback)->
          request (member.link), (error, response, html) ->
                    if !error and response.statusCode == 200
                      $ = cheerio.load(html)
                      photoUrl = $('.photo img').attr('src')
                      contactUrl = $('#webform a').attr('href')
                      name = member.name.replace('MenÃ©ndez', 'Menendez').replace('  ',' ').replace(') ',')')
                      callback null, {'name':name,'contactUrl':contactUrl,'photoUrl':photoUrl}
                    
        ),
        (err, results)->
          res.send results
    
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
          name: name.toString().replace(",","")
          volunteer: volunteer
          email: email.toString().replace(",","")
          number_of_people: number_of_people
          
        doc.addRow 1, row, (err) ->
          cb()

      , (err, results) ->
        res.render 'home', 
          display: 'block'
    if volunteer == "no"    
      mailOptions =
        from: "Alice's March for Equality <registration@alicesmarchforequality.com>"
        to: email
        subject: 'Thanks for registering ' + name.toString().replace(",","").split(" ")[0] + '! 🎉'
        text: emailMessages.registration.regular.text(name)
        html: emailMessages.registration.regular.html(name)
    else
      mailOptions =
        from: "Alice's March for Equality <registration@alicesmarchforequality.com>"
        to: email
        subject: 'Thanks for registering ' + name.toString().replace(",","").split(" ")[0] + '! 🎉'
        text: emailMessages.registration.volunteer.text(name)
        html: emailMessages.registration.volunteer.html(name)
      
    transporter.sendMail mailOptions, (error, info) ->
      if error
        return console.log(error)
      console.log 'Message Sent: ' + info.response
      return
    