module.exports =
  registration:
    regular:
      text: (name) ->
        return "Hi " + name.toString().replace(",","").split(" ")[0] + ". Thank you for registering for Alices March for Equality! We will be in contact soon with details about the march along with driving directions and parking options. Please contact us with any questions on our website at alicesmarchforequality.com/contact or email us at info@alicesmarchforequality.com. Thanks, the AMFE Team."
      html: (name) ->
        return "<p style='color:black'>Hi " + name.toString().replace(",","").split(" ")[0] + ",<br><br>Thank you for registering for Alices March for Equality! We will be in contact soon with details about the march along with driving directions and parking options. Please contact us with any questions on our website at alicesmarchforequality.com/contact or email us at info@alicesmarchforequality.com.<br><br>Thanks, the AMFE Team.</p>"
    volunteer:
      text: (name) ->
        return "Hi " + name.toString().replace(",","").split(" ")[0] + ". Thank you for registering to volunteer for Alices March for Equality! We will be in contact soon to assign you a job for the march. Please contact us with any questions on our website at alicesmarchforequality.com/contact or email us at info@alicesmarchforequality.com. Thanks, the AMFE Team."
      html: (name) ->
        return "<p style='color:black'>Hi " + name.toString().replace(",","").split(" ")[0] + ",<br><br>Thank you for registering to volunteer for Alices March for Equality! We will be in contact soon to assign you a job for the march. Please contact us with any questions on our website at alicesmarchforequality.com/contact or email us at info@alicesmarchforequality.com.<br><br>Thanks, the AMFE Team.</p>"