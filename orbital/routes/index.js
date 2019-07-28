var express = require('express');
var router = express.Router();
var db=require('./../database');
var passport = require('passport')

/* GET home page. */
router.get('/', function(req, res, next) {
  var queryall="select * from product";
  var querysearch= "select* from product where productName like '%"+req.query.searchcontent+"%'";
  if(req.query.searchcontent!=null){
    var query = querysearch;
  }else{
    var query = queryall;
  }
  var search = req.query.searchcontent;
  
  db.query(query,function(err,results){
    if(err){res.send(err);}
    
    if (req.isAuthenticated()) {      
      var queryProf="select* from profile where userID = '"+req.user.userID+"'";
      var product=results;  
      var recarray = new Array();
      db.query(queryProf,function(err,results){
        if(err){res.send(err);}
        if(results.length==0){
          res.render('index', {product:product, search:search, username: req.user.userName,notice:"Fill in your profile information to get customized recommendation"});
        }else{
          console.log(results[0].profileCat);
        console.log(results[0].tagOne);
        console.log(results[0].tagTwo);
        console.log(results[0].tagThree);
        var cat = results[0].profileCat;
        var tagone=results[0].tagOne;
        var tagtwo=results[0].tagTwo;
        var tagthree=results[0].tagThree;
        db.query("select* from (select* from product where category='"+cat+"') product where productName like '%"+tagone+"%'",function(err,results){
          if(err){res.send(err);}
          for(i = 0; i < results.length; i++){
            recarray[i]=results[i];
            
          }
          console.log(results.length);
          console.log(recarray.length);
          db.query("select* from (select* from product where category='"+cat+"') product where productName like '%"+tagtwo+"%'",function(err,results){
            if(err){res.send(err);}
            originallen=recarray.length;
            for(i = 0; i < results.length; i++){
              recarray[originallen+i]=results[i];
            }
            console.log(results.length);
            console.log(recarray.length);
            db.query("select* from (select* from product where category='"+cat+"') product where productName like '%"+tagthree+"%'",function(err,results){
              if(err){res.send(err);}
              originallen=recarray.length;
              for(i = 0; i < results.length; i++){
                recarray[originallen+i]=results[i];
              }
              console.log(results.length);
              console.log(recarray.length);
              res.render('index', {product:product, search:search, username: req.user.userName,rec:recarray,notice:null});
            });
          });
        });
        }
        
      });
      console.log(recarray.length);
        
    } else {
      res.render('index',{product:results, search:search});
    }
  });
});

router.get('/results',function(req,res,next){
  if(req.query.searchcontent==null){
    var filter=req.query.key;
    console.log(req.query.key);
    var queryFilter="select* from product where category = '"+filter+"'";
    db.query(queryFilter,function(err,results){
      if(err){
        res.send(err);
      }else{
        if (req.isAuthenticated()) {
        res.render('searchresult',{key: req.query.key,product:results, username: req.user.userName});
        }else{
          res.render('searchresult',{key: req.query.key,product:results});
        }
      }
    })
  }else{
    res.redirect('/?searchcontent='+req.query.searchcontent);
  }
  
  
  
})
module.exports = router;
