const mysql = require('mysql');
const config = require('./config');
//mysql://b8a90e7acb7879:5fc12bb7@us-cdbr-iron-east-02.cleardb.net/heroku_7d2d51de0211c49?reconnect=true
/*connect to database */
const database=mysql.createConnection({
    host:config.host,
    user:config.user,
    port:config.port,
    password:config.password,
    database:config.database
});

database.connect(function(err){
    if(err){
        console.error('error connecting'+err.stack);
        return;
    }
    console.log('connected as id'+database.threadID);
});

module.exports=database;