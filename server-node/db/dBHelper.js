var mysql = require('mysql');
var util = require('util');


var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'node'
});

connection.connect();

let mysqli = (sql, callback) => {
  connection.query(sql, function (error, results, fields) {
    if (error) throw error;
    callback(error, results);
  })
}



module.exports = {
  mysqli: mysqli
};
