//const path = require("path");
const homepage_model = require("../model/homepage.js")

module.exports = {
    createdatabase: function (req, res) {
        homepage_model.getList(req, res);
    }

}