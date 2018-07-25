var dBHelper = require('../db/dBHelper');

let add = () =>{
  let sql = "INSERT INTO `people` (`name`, `sex`) VALUES ('cc', 'cc')";
  dBHelper.mysqli(sql, callback = (error, results) => {
    console.log(results);
  });
}

let update = () => {
  let sql = "UPDATE `people` SET `sex` = 'dd' WHERE `id` = 1;";
    dBHelper.mysqli(sql, callback = (error, results) => {
      console.log(results);
    });

}

let dele = () => {
  let sql = "DELETE FROM `people` WHERE `id` = 4;";
  dBHelper.mysqli(sql, callback = (error, results) => {
    console.log(results);
  });

}

let query = (sex) => {
  var sql = "SELECT * from people;";
  dBHelper.mysqli(sql, callback = (error, results) => {
    console.log(results);
  });
}

// // exports
module.exports = {
  add: add,
  update: update,
  dele: dele,
  query: query
};
