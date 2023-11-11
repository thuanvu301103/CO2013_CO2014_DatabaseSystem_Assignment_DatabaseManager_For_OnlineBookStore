const express = require('express');
const homepage_router = express.Router();
const homepage_controller = require('../controllers/homepage.js');
//const path = require("path");

homepage_router.get("/homepage", homepage_controller.createdatabase);

module.exports = homepage_router;