/* eslint-disable  func-names */
/* eslint-disable  no-console */
"use strict";

/**
 * @typedef {../node_modules/} db
 */

const mongodb = require("mongodb");
const MongoClient = mongodb.MongoClient;
const CONNECT_STRING = "mongodb://127.0.0.1:27017/myDB";
let con;

async function initialize() {
  // 初期化処理
  await MongoClient.connect(CONNECT_STRING, db => {
    con = db;
  });
}

async function getPokemonData() {
  return null;
}

module.exports = getPokemonData;
