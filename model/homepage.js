var connect_DB = require('./connect_db.js')

// For manager
function getList(res) {
    connect_DB.query("SELECT id, student_id, student_name, doc_name, request_day FROM ((requestborrow NATURAL JOIN members) NATURAL JOIN documents) WHERE state = 0", function (err, result, fields) {
        if (err) res.json({ code: 500 });
        res.json({loanList: JSON.stringify(result)});
    });
}


module.exports = { getList };