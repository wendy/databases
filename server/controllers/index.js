var models = require('../models');
var bluebird = require('bluebird');
var SQL = require('../db/index.js').SQL;


module.exports = {
  messages: {
    get: function (req, res) {}, // a function which handles a get request for all messages
    post: function (req, res) {
      console.log(req.body);
      SQL.query('SELECT id FROM Users WHERE name =' + req.body.username + ';');
      SQL.query("INSERT INTO Messages VALUES ('hello');");
    } // a function which handles posting a message to the database
  },

  users: {
    // Ditto as above
    get: function (req, res) {},
    post: function (req, res) {}
  }
};

