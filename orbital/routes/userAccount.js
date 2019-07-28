var express = require('express');
var router = express.Router();
var db=require('./../database');
var uuidv4 = require('uuid/v4');
var path = require('path');
var fs = require('fs');
var passport = require('passport');


/* GET account page (default page is shopping cart) */
router.get('/personal_account', authenticationMiddleware(), function(req, res, next) {
  var sql = "SELECT * FROM cart inner join product on cart.productID = product.productID where userID=?";
  db.query(sql, [req.user.userID], function(err, result) {
    var product=result;
    db.query("select* from profile where userID='"+req.user.userID+"'",function(err,result){
      if(result.length==0){
        res.render('personal_account', {rows: product, username: req.user.userName,profile:null});
      }else{
        res.render('personal_account', {rows: product, username: req.user.userName,profile:result[0]});
      }
      
    })
    
  });
});
/* GET edit_profile page*/
router.get('/edit_profile', authenticationMiddleware(), function(req, res, next) {
  
  res.render('profileinfo', {username: req.user.userName});
});
router.post('/edit_profile',authenticationMiddleware(), function(req, res, next){
  
  var id=req.user.userID;
  var number=req.body.phone;
  var cat=req.body.cat;
  var tag_one=req.body.chk[0];
  var tag_two=req.body.chk[1];
  var tag_three=req.body.chk[2];
  if (req.method == "POST") {
    if (!req.files) {
      return res.status(400).send('No file was uploaded.');
    }
    var file = req.files.pic;
    var fileID = uuidv4();
    console.log("fileID: " + fileID);
    if (file.mimetype == "image/jpeg"||file.mimetype == "image/png"||file.mimetype == "image/gif") {
      file.name = fileID + path.extname(file.name);
      file.mv(path.join('public/images/upload_images/', file.name), function(err) {
        if (err) {
          return res.status(500).send(err);
        }
      });

      var queryUser = "Select * from profile where userID = '"+id+"'";
      if (number) {
        var queryAdd="insert into profile(userID, profilePic, profileNum, profileCat, tagOne, tagTwo, tagThree) values('"
                + id + "', '" + file.name +"', '" + number+ "','" + cat + "','" 
                + tag_one + "', '" + tag_two +"', '" + tag_three +"')";
      } else {
        var queryAdd="insert into profile(userID, profilePic, profileCat, tagOne, tagTwo, tagThree) values('"
                + id + "', '" + file.name + "','" + cat + "','" 
                + tag_one + "', '" + tag_two +"', '" + tag_three +"')";
      }
      var queryUpdate="UPDATE profile SET profilePic='"+file.name+"',profileNum='"+number+"', profileCat='"
                 + cat + "', tagOne='" + tag_one + "', tagTwo='" + tag_two +"', tagThree='" + tag_three +"' WHERE userID='"+id+"'";
      var queryProfile;
      db.query(queryUser,function(err,rows){
        
        if (err) {
          console.log('err');
          res.send(err);
          return;
        }else if(rows.length==0){
          console.log('add');
          queryProfile=queryAdd;           
        }else{
          console.log('update');
          queryProfile=queryUpdate;              
        }
        db.query(queryProfile,function(err,results){
          if (err) {
            return res.send(err);
          }
          res.redirect('/userAccount/personal_account');
        });
      });
 /*     db.query(queryProfile,function(err,results){
        if (err) {
          res.send(err);
        }
        res.redirect('/userAccount/personal_account');
      });*/
//      res.redirect('/userAccount/personal_account');
    }else {
      alert('The file is not valid.');
      return;
    }
  }
});

/* GET order page */
router.get('/My_orders', authenticationMiddleware(), function(req, res, next) {
  db.query('select * from product inner join user on product.sellerID = user.userID where buyerID=?', [req.user.userID], function(err, result) {
    var bought = result;
    db.query('select * from product inner join user on product.buyerID = user.userID where sellerID=? and seen=? and buyerID is not null', [req.user.userID, 1], function(err, result) {
      var sold = result;
      console.log(sold);
      db.query('select * from product inner join user on product.buyerID = user.userID where sellerID=? and seen=? and buyerID is not null', [req.user.userID, 0], function(error, result) {
        var newSold = result;
        console.log(newSold);
        db.query('update product set seen=? where sellerID=? and seen=? and buyerID is not null', [1, req.user.userID, 0], function(err, result){
          db.query("select* from profile where userID='"+req.user.userID+"'",function(err,result){
            if(result.length==0){
              res.render('My_orders', {username: req.user.userName, bought: bought, sold: sold, newSold: newSold, profile:null});
            }else{
              res.render('My_orders', {username: req.user.userName, bought: bought, sold: sold, newSold: newSold, profile:result[0]});
            }            
          })
        })        
      })      
    })
  })
});

/* GET manage shop page */
router.get('/manageShop', authenticationMiddleware(), function(req, res, next) {
  var sql = "SELECT * FROM product where sellerID=?";
  db.query(sql, [req.user.userID], function(err, result) {
    var rows=result;
    db.query("select* from profile where userID='"+req.user.userID+"'",function(err,result){
      if(result.length==0){
        res.render('manageShop', {rows: rows, username: req.user.userName,profile:null});
      }else{
        res.render('manageShop', {rows: rows, username: req.user.userName,profile:result[0]});
      }
      
    })
    
  });
});

router.get('/uploadinfo', authenticationMiddleware(), function(req, res, next) {
  res.render('uploadinfo', {username: req.user.userName});
})

router.get('/delete', authenticationMiddleware(), function(req, res, next) {
  var sql = "SELECT * FROM product where sellerID = ?";
  db.query(sql, [req.user.userID], function(err, result) {
    var rows=result;
    db.query("select* from profile where userID='"+req.user.userID+"'",function(err,result){
      if(result.length==0){
        res.render('delete', {rows: rows, username: req.user.userName, profile:null});
      }else{
        res.render('delete', {rows: rows, username: req.user.userName,profile:result[0]});
      }    
    });
  });
})
router.get('/deleteCart', authenticationMiddleware(), function(req, res, next) {
  var sql = "SELECT * FROM cart inner join product on cart.productID = product.productID where userID=?";
  db.query(sql, [req.user.userID], function(err, result) {
    var rows=result;
    db.query("select* from profile where userID='"+req.user.userID+"'",function(err,result){
      if(result.length==0){
        res.render('deleteCart', {rows: rows, username: req.user.userName, profile:null});
      }else{
        res.render('deleteCart', {rows: rows, username: req.user.userName,profile:result[0]});
      }    
    });
  });
})

router.get("/update", authenticationMiddleware(), function(req, res, next){
  var productID=req.query.id;
  var queryProduct="select* from product where productID='"+productID+"'";
  db.query(queryProduct,function(err,results){
    console.log(results.length);
    if(err) res.send(err);
    var product=results[0];
    var method;
    var price;
    if(product.productPrice==null&&product.exchange!=null){
      method='exchange';
    }else if(product.productPrice!=null&&product.exchange==null){
      method='cash';
    }else{
      method='cash or exchange';
    }
    if(product.productPrice==null&&product.exchange!=null){
      price=product.exchange;
    }else if(product.productPrice!=null&&product.exchange==null){
      price="S$"+product.productPrice;
    }else{
      price="S$"+product.productPrice+"or"+product.exchange;
    }
    res.render("updateproduct",{username: req.user.userName,product:product,method:method,price:price});
  })

})


router.post('/delete', function(req, res) {
  var post = req.body;
  console.log(post);
  for (x in post) {
    var sql = 'DELETE FROM product WHERE picPath = "'+ x + '"';
    console.log(sql);
    db.query(sql, function(err, result) {
      if (err) {
        throw err;
      }
    });
    fs.unlinkSync(path.join('public/images/upload_images/', x));
  }
  res.redirect('manageShop');
})
router.post('/deleteCart', function(req, res) {
  var post = req.body;
  console.log(post);
  for (x in post) {
    var sql = 'DELETE FROM cart WHERE picPath = ?';
    console.log(x);
    db.query(sql, [x], function(err, result) {
      if (err) {
        throw err;
      }
    });
    //fs.unlinkSync(path.join('public/images/upload_images/', x));
  }
  res.redirect('/userAccount/personal_account');
})

router.post('/uploadinfo', function(req, res) {
  var post = req.body;
  var name = post.name;
  var cat = post.cat;
  var price = post.inputForcash;
  var desc = post.desc;
  var method = post.method;
  var exchange = post.inputForexchange;
  console.log(method);
  console.log(price);
  console.log(exchange);
  var sellerid = req.user.userID;
  if (req.method == "POST") {
    if (!req.files) {
      return res.status(400).send('No file was uploaded.');
    }
    if (!method) {
      return res.redirect('/userAccount/uploadinfo');
    }
    var file = req.files.uploadfile;
    var fileID = uuidv4();
    console.log("fileID: " + fileID);
    if (file.mimetype == "image/jpeg"||file.mimetype == "image/png"||file.mimetype == "image/gif") {
      file.name = fileID + path.extname(file.name);
      file.mv(path.join('public/images/upload_images/', file.name), function(err) {
        if (err) {
          return res.status(500).send(err);
        }
      });
      
      
      var sql = "INSERT INTO `product`(`productName`, `category`, `productPrice`, `description`, `picPath`, `sellerID`, `exchange`) VALUES (?, ?, ?, ?, ?, ?, ?)";
      //console.log(sql);
      var query = db.query(sql, [name, cat, price, desc, file.name, sellerid, exchange], function(err, result) {
        if (err) {
          throw err;
        }
        //console.log(result);
      });
    } else {
      alert('The file is not valid.');
      return;
    }
  } else {
    //return res.render('uploadinfo');
  }
  res.redirect('manageShop');
});
router.post("/update",function(req,res){
  var title=req.body.name;
  console.log(title);
  var cat=req.body.cat;
  //var method=req.body.method;
  var price = req.body.inputForcash;
  var exchange=req.body.inputForexchange;
  var desc=req.body.desc;
  if (req.method == "POST") {
    if (!req.files) {
      return res.status(400).send('No file was uploaded.');
    }
    var file = req.files.uploadfile;
    var fileID = uuidv4();
    console.log("fileID: " + fileID);
    if (file.mimetype == "image/jpeg"||file.mimetype == "image/png"||file.mimetype == "image/gif") {
      file.name = fileID + path.extname(file.name);
      file.mv(path.join('public/images/upload_images/', file.name), function(err) {
        if (err) {
          return res.status(500).send(err);
        }
      });
 //     var queryUpdate="UPDATE product SET productName='"+title+"',picPath='"+file.name+"', category='"+cat+"', payment='"+method+"', productPrice='"+price+"', description='"+desc+"' WHERE productID=13";
      var queryUpdate="UPDATE product SET productName=?,picPath=?,category=?,exchange=?,productPrice=?,description=? WHERE productID=?";
      console.log(queryUpdate);
      db.query(queryUpdate,[title,file.name,cat,exchange,price,desc,req.query.id],function(err,results){
        if(err) res.send(err);
        console.log('ok3');
      });
      console.log('ok1');
    } else {
      alert('The file is not valid.');
      return;
    }
    console.log('ok2');
  } else {
    //return res.render('uploadinfo');
  }
  res.redirect('/userAccount/manageShop');
});

function authenticationMiddleware() {  
	return (req, res, next) => {
		console.log(`req.session.passport.user: ${JSON.stringify(req.session.passport)}`);

	    if (req.isAuthenticated()) return next();
	    res.redirect('/users/login')
	}
}

module.exports = router;