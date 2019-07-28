var express = require('express');
var router = express.Router();
var db=require('./../database');

router.get('/', function(req, res, next) {
  if (req.isAuthenticated()) {
    res.render('contactUs', {username: req.user.userName});
  } else {
    res.render('contactUs');
  }
});

  module.exports = router;