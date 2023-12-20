var mysql = require("mysql2");
var exp = require("express");
var app = exp();
var bp = require("body-parser");
var cors = require("cors");

app.use(bp.json());
app.use(cors());
app.listen(9000, function () {
  console.log("Listening on 9000");
});

var conn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "mini_project",
});

conn.connect(function (err) {
  if (!err) {
    console.log("database connected");
  }
});

app.get("/check", function (req, res) {
  var query = "select * from customers";
  conn.query(query, function (err, data) {
    if (!err) {
      res.json(data);
    }
  });
});

app.post("/insertcust", function (req, res) {
    var name=req.body.name;
    var email=req.body.email;
    var phone=req.body.phone;
    var user = req.body.username;
    var pass = req.body.password;
    
    
   var query = "call CreateCustomer(?,?,?,?,?)";
    conn.query(query, [user,pass,name,email,phone], function (err) {
      if (!err) {
        res.send("success");
      } else res.send("failure");
    });
  });
  