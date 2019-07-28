var express = require('express');
var router = express.Router();
var db=require('./../database');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
//var popupS = require('popups');
/* GET users listing. */
router.get('/login', function(req, res, next) {
  res.render('login',{message:req.flash('error')});
});

router.get('/sign_up'/*, unauthenticationMiddleware()*/, function(req, res, next) {
  res.render('sign_up',{warning:''});
});
router.get('/sign_up/success', function(req, res, next) {
  res.render('sign_up_success');
});
router.get('/logout', function(req, res) {
  req.logout();
  req.session.destroy();
  res.redirect('/');
})
/**注册功能 */
// 用于处理用户通过表单提交的请求
router.post('/sign_up', function(req, res, next) {
  // 判断用户名是否存在
  var queryName = "select * from user where userName='" + req.body.name +"'";
  var queryEmail = "select * from user where userEmail='" + req.body.email +"'";
  var queryString = "insert into user(userName, userEmail, userPassword) values(?, ?, ?)";
  db.query(queryName, function(err, rows){
    if (err) {
      res.send(err);
    }else if (rows.length != 0){
        //res.send("this username is used, try another one!");
        res.render('sign_up',{warning:'this username is used, try another one!'});
    }else{        
      //判断邮箱地址是否存在
      db.query(queryEmail, function(err, rows){
        if (err) {
          res.send(err);
        }else if (rows.length != 0) {
          res.render('sign_up',{warning:'this email address is used, try another one!'});
        }else{           
          db.query(queryString, [req.body.name, req.body.email, req.body.password], function(err, rows){
            if (err) {
              res.send(err);
            }else {
              res.redirect("/users/sign_up/success");
            }
          });
        }
      });
    }
  });
});
  
passport.use(new LocalStrategy(
  function(username, password, done) {
    console.log(username);
    console.log(password);
    db.query('select* from user where userName= ? and userPassword= ? ',[username, password], function (err, results, fields) {
      console.log(results);
      if (err) {done(err)};
      if (results.length === 0) {
        return done(null, false, {message: 'Wrong username or password, try again!'});
      }
      return done(null, results[0]);
    })
  }
));
router.post('/login', passport.authenticate(
            'local', {
            successRedirect: '/',
            failureRedirect: '/users/login',
            failureFlash: true
          }));
/*
//登录功能
router.post('/login', function(req, res, next){
  var userName = req.body.name;
  var password = req.body.password;
  var queryUser="select* from user where userName='"+ userName+"'and userPassword='"+ password+"'";
  db.query(queryUser, function(err, rows){
      if(err){
        res.send(err);
      }else if(rows.length==0){
        res.render('login',{message:'wrong username or password, try again!'});
      }else{
      //  res.redirect('/homepage',{username:req.body.name});
        db.query('SELECT userID from user WHERE userName='+ userName, function(error, results, fields) {
          if (error) throw error;
          const userID = results[0];
          console.log(userID);
          req.login(userID, function(err) {
            res.redirect('/');
          });
          //res.render('homepage_after_login',{username:req.body.name});
        })
      
      }
  });
});
*/
passport.serializeUser(function(userID, done) {
  done(null, userID);
});

passport.deserializeUser(function(userID, done) {
    done(null, userID);
});

/*function unauthenticationMiddleware() {
  return (req, res, next) => {
		console.log(`req.session.passport.user: ${JSON.stringify(req.session.passport)}`);

	    if (!req.isAuthenticated()) return next();
      
      //popupS.alert({content: 'Please log out before sign up for an account!'});
	}
}
*/
module.exports = router;
