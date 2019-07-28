var express = require('express');
var router = express.Router();
var db=require('./../database');

/* GET product info page. */
router.get('/', function(req, res, next) {
 
    console.log(req.query.id);
    var queryProduct = "select * from product where productID = '"+req.query.id+"'";
    db.query(queryProduct, function(err,results){
      if (err) {
        res.send(err);
      }
      var product = results[0];
      var querySeller="select* from user where userID ='"+results[0].sellerID+"'";
      db.query(querySeller,function(err,results){
        var seller = results[0];
        if (req.isAuthenticated()) {
          res.render('product_info', {seller:seller, product:product,username: req.user.userName});
        } else {
          res.render('product_info', {seller:seller, product:product});
        }
      })
      
    });
});
router.get('/cart', function(req, res, next) {
  console.log(req.query.id);
  console.log(req.user);
  if (req.isAuthenticated()) {
    db.query("select * from product where productID=?", [req.query.id], function(err, results){
      var name = results[0].productName;
      var price = results[0].productPrice;
      var pic = results[0].picPath;
      var cat = results[0].category;
      var insertCart = "insert into cart (userID, productID, category, picPath, productName, productPrice) values (?, ?, ?, ?, ?, ?)";
      db.query(insertCart, [req.user.userID, req.query.id, cat, pic, name, price], function(err, results){
        if (err) {
          console.log(err);
        }
        res.redirect('/userAccount/personal_account');
      })
    })
  } else {
    res.redirect('/users/login');
  }
})
module.exports = router;