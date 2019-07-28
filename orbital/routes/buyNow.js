var express = require('express');
var router = express.Router();
var db=require('./../database');
var api_key = 'a8eb7789a9e4f868d047b7959b42a45f-c50f4a19-106efaa7';
var domain = 'sandboxddecf19c096148ccaab5515cc2864699.mailgun.org';
var mailgun = require('mailgun-js')({apiKey: api_key, domain: domain});
 
router.get('/', authenticationMiddleware(), function(req, res, next) {
	//send message
	console.log(req.user.userEmail);
	db.query('select sellerID from product where productID = ?', [req.query.id], function(error, result) {
		if (error) {
			console.log(error);
		} else {
			console.log(result[0].sellerID);
			db.query('select * from user where userID = ?', [result[0].sellerID], function(error, result){
				var from = ''+result[0].userName+' <'+result[0].userEmail+'>';
				var to = ''+req.user.userEmail;
				console.log(from);
				console.log(to);
				var data = {
					from: 'A-mazing <tswuxia@gmail.com>',
					to: to,
					subject: 'A-mazing: Your have a new order',
					text: 'Dear seller,\n Your product has been ordered, please check your orders for details. Thank you.\n Best regards,\n The A-mazing Team'
	  			};
	   
	  			mailgun.messages().send(data, function (error, body) {
					if (error) {
						console.log(error);
					}
					console.log(body);
				  });
				
				//DO NOT DELETE
				db.query("update product set buyerID = ? where productID=?", [req.user.userID, req.query.id], function(error, result) {
					db.query("update product set seen = ? where productID=?", [0, req.query.id], function(error, result){
						res.redirect('/useraccount/My_orders');
					})
				})
			})
		}
	})
    
});

function authenticationMiddleware() {  
    return (req, res, next) => {
		console.log(`req.session.passport.user: ${JSON.stringify(req.session.passport)}`);

	    if (req.isAuthenticated()) return next();
	    res.redirect('/users/login')
	}
}

module.exports = router;