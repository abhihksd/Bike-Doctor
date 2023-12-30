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

app.post("/check", function (req, res) {
  var username = req.body.username;
  var query = "select Username from customers where Username=?";
  conn.query(query, [username], function (err, data) {
    if (!err) {
      if (data.length > 0 && data[0].Username == username) {
        res.send("Invalid");
      } else res.send("Valid");
    }
  });
});

app.post("/insertcust", function (req, res) {
  var name = req.body.name;
  var email = req.body.email;
  var phone = req.body.phone;
  var user = req.body.username;
  var pass = req.body.password;

  var query = "call CreateCustomer(?,?,?,?,?)";
  conn.query(query, [user, pass, name, email, phone], function (err) {
    if (!err) {
      res.send("success");
    } else res.send("failure");
  });
});
app.post("/login", function (req, res) {
  var username = req.body.username;
  var password = req.body.password;

  var query = "select * from customers where username=? and password=?;";
  conn.query(query, [username, password], function (err, data) {
    if (!err) {
      if (
        data.length > 0 &&
        data[0].Username == username &&
        data[0].Password == password
      ) {
        res.send("success");
      } else res.send("failure");
    }
  });
});

app.put("/update", function (req, res) {
  var username = req.body.username;
  var oldpass = req.body.oldpassword;
  var newpass = req.body.newpassword;

  var query =
    "update customers set Password=? where Username=? and Password=? ";
  conn.query(query, [newpass, username, oldpass], function (err, data) {
    if (!err) {
      res.send("updated");
    } else res.send("failed");
  });
  // }
});
