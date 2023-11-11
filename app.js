var express = require('express');
var mysql = require('mysql');
//var url = require('url');
//var fs = require('fs');
//var bodyParser = require('body-parser');
//var helmet = require('helmet');
//var rateLimit = require("express-rate-limit");
//var session = require('express-session');
//var cookieParser = require('cookie-parser');

const HomepageRoute = require('./routes/homepage.js');


/*const limiter = rateLimit({
    windowMs: 15 * 60 * 1000, // 15 minutes
    max: 100 // limit each IP to 100 requests per windowMs
});*/

/*const cspConfig = {
    directives: {
      scriptSrc: ["'self'", "ajax.googleapis.com", "cdn.jsdelivr.net", "www.google.com"],
      frameSrc: ["'self'", "www.google.com"],
    },
};*/



var app = express();
// app.set('view engine', 'ejs');
//app.use(bodyParser.json());
//app.use(bodyParser.urlencoded({ extended: true }));
//app.use(helmet.contentSecurityPolicy(cspConfig));
//app.use(express.static('assets'));
//app.use(limiter);
//app.use(cookieParser());
/*app.use(session({
    secret: "Your secret key",
    resave: false,
    saveUninitialized: true,
}));*/

// Router
app.use("/homepage", HomepageRoute);

// Running Server
app.listen(3011, function () {
    console.log("Server is running on port 3011");
});