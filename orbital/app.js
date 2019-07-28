var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var fileUpload = require('express-fileupload');
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);
var passport = require('passport');
const config = require('./config');
var flash = require('connect-flash');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var infoRouter = require('./routes/product_info');
var accountRouter = require('./routes/userAccount');
var contactRouter = require('./routes/contactUs');
var buyRouter = require('./routes/buyNow');
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(fileUpload());
const options = {
  host:config.host,
  user:config.user,
  port:config.port,
  password:config.password,
  database:config.database
};
var sessionStore = new MySQLStore(options);
app.use(session({
  secret: 'keyboard cat',
  resave: false,
  store: sessionStore,
  saveUninitialized: false,
  //cookie: { secure: true }
}));
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

app.use(function(req, res, next) {
  res.locals.isAuthenticated = req.isAuthenticated();
  next();
})

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/product_info', infoRouter);
app.use('/userAccount', accountRouter);
app.use('/contactUs', contactRouter);
app.use('/buyNow', buyRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;

//const PORT = process.env.PORT || 5000;
//app.listen(PORT, console.log('Server started on port ${PORT}'));
app.listen(3000,function(){
 console.log('listening port 3000');
});