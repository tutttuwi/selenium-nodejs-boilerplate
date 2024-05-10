/* eslint-disable prettier/prettier */
//@ts-check
/* eslint-disable  func-names */
/* eslint-disable  no-console */
"use strict";

// /**
//  * 定義領域
//  * @typedef {import('../Classname')} Classname
//  */

/**
 * グローバルオブジェクト
 *
 */
//@ts-ignore
let args = process.argv; // 引数が取得可能
//@ts-ignore
let env = process.env; // key-value形式で環境変数が取得できる
//@ts-ignore
let cwd = process.cwd; // ディレクトリ変更
let con = console; // consoleオブジェクト

/**
 * モジュール参照
 *
 */
const webdriver = require("selenium-webdriver");
const { resolve } = require("path");
const { hasUncaughtExceptionCaptureCallback, argv } = require("process");
const { Builder, By, until } = webdriver;
const capabilities = webdriver.Capabilities.chrome();
capabilities.setPageLoadStrategy("normal");
// capabilities.set("chromeOptions", {
//   args: ["--headless", "--no-sandbox", "--disable-gpu", `--window-size=1980,1200`]
// });

const chrome = require("selenium-webdriver/chrome");
const logger = require("./logger");

// DB接続必要な場合
// const { Pgdao } = require("./db/pgdao");
// const dao = new Pgdao();

// HTTP通信が必要な場合
// const axios = require('axios');

// ファイル操作が必要な場合
const fs = require("fs");

/**
 * 定数
 *
 */
const CSV = ",";
const TSV = "\t";
const CRLF = "\r\n";
const LF = "\n";
const OUTPUT_JSON_TMP = {
  basic: {},
  check: {},
  salary: {},
  performance: {},
  // eslint-disable-next-line prettier/prettier
  ir: {}
};
// const constantsName = "";
// // @ts-ignore
// const dirname = __dirname; // 実行ファイルディレクトリ

/**
 * 変数
 *
 */
let HEADER_ARRAY = [];
let CONTENT_ARRAY = [];
let ANCHOR_ARRAY = [];
let OUTPUT_JSON = {};
let OUTPUT_JSON_ARRAY = [];
let options = new chrome.Options();
options.setBrowserVersion("stable");
// options.headless();
options.windowSize({ width: 1980, height: 1200 });
options.setPageLoadStrategy("normal");
options.addArguments("--no-sandbox");
options.addArguments("--disable-gpu");
options.addArguments("--disable-extensions");
options.addArguments("--proxy-server='direct://'");
options.addArguments("--proxy-bypass-list=*");
options.addArguments("--start-maximized");
options.addArguments("--disable-setuid-sandbox");

let retryCnt = 0;
let RETRY_MAX_CNT = 30;

async function buildDriver(url: string) {
  let driver;
  try {
    driver = await new Builder()
      .setChromeOptions(options)
      .withCapabilities(capabilities)
      .build();
    await driver.get(url);
    retryCnt = 0; // ドライバー作成に成功したので初期化
    return driver;
  } catch (e) {
    retryCnt++;
    await sleep(10000);
    logger.error(
      "ドライバー作成時にエラーが発生しました [",
      retryCnt,
      "回目] ",
      "/ [最大回数 ",
      RETRY_MAX_CNT,
      "回]"
    );
    // @ts-ignore
    logger.error(e.stack);
    if (retryCnt > RETRY_MAX_CNT) {
      retryCnt = 0;
      throw new Error("ドライバー作成時にエラー回数が最大値を超えました。");
    }
    return await buildDriver(url);
  }
}

async function procScraping(url: string) {
  logger.info("[START] procScraping()");

  // ブラウザ立ち上げ
  logger.info("ブラウザ立ち上げ");
  const driver = await buildDriver(url);

  logger.info("[END] procScraping()");
}

async function main() {
  logger.log("[START] main()");
  logger.info("引数:", argv);

  // for (let index = 0; index < [].length; index++) {
  //   try {
  await procScraping("https://google.com");
  //   } catch (e) {
  //     logger.error("xxxエラー発生", JSON.stringify(["something infomation.."]));
  //     // @ts-ignore
  //     logger.error(e.stack);
  //     continue;
  //   }
  // }
  // MEMO: 明示的に必要な場合コメント外す 非同期で流れるため、明示的に落とすとログが一部ロストする可能性あり
  // process.exit(0); // nodejsのプロセスを落とす
  logger.log("[END] main()");
}

// process.on("exit", () => {
//   process.exit(0);
// });

/**------------------------------
 *          関数領域
 ------------------------------*/

/**
 * スリープ関数 指定されたミリ秒分スリープする
 * @param ms
 * @returns
 */
async function sleep(ms: number) {
  return new Promise(r => setTimeout(r, ms));
}

/**
 * 不要文字列削除
 */
function deleteStr(value: string) {
  // 処理実施
  let newValue = value
    .replace(/\r?\n/g, "")
    .replace(/,/g, "")
    .replace(/\t/g, "");
  // console.log("deleteStr -> " + value);
  return newValue;
}

/**------------------------------
 *         メイン処理
 ------------------------------*/
// 処理実行
try {
  main();
} catch (e) {
  // @ts-ignore
  console.log(e.stack);
}
// })

/**
 * モジュール化領域
 *
 */
// module.exports = funcName;
