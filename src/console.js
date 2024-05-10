/* eslint-disable  func-names */
/* eslint-disable  no-console */
"use strict";

/**
 * Console オブジェクトノウハウ
 *
 */

// コンソール文字列装飾
var t_black = "\u001b[30m";
var t_red = "\u001b[31m";
var t_green = "\u001b[32m";
var t_yellow = "\u001b[33m";
var t_blue = "\u001b[34m";
var t_magenta = "\u001b[35m";
var t_cyan = "\u001b[36m";
var t_white = "\u001b[37m";

var b_black = "\u001b[40m";
var b_red = "\u001b[41m";
var b_green = "\u001b[42m";
var b_yellow = "\u001b[43m";
var b_blue = "\u001b[44m";
var b_magenta = "\u001b[45m";
var b_cyan = "\u001b[46m";
var b_white = "\u001b[47m";

var reset = "\u001b[0m";

console.log(t_red + "This text is red. " + t_green + "Greeeeeeen!" + reset);

// 文字色使い分け
console.log(`${b_white}${t_black}%s${reset}`, "黒色文字列");
console.log(`${b_black}${t_red}%s${reset}`, "赤色文字列");
console.log(`${b_black}${t_green}%s${reset}`, "緑色文字列");
console.log(`${b_black}${t_yellow}%s${reset}`, "黃色文字列");
console.log(`${b_black}${t_blue}%s${reset}`, "青色文字列");
console.log(`${b_black}${t_magenta}%s${reset}`, "マゼンタ色文字列");
console.log(`${b_black}${t_cyan}%s${reset}`, "シアン色文字列");
console.log(`${b_black}${t_white}%s${reset}`, "白色文字列");

// タイマー
console.time("PROC TIME"); // ラベル名は揃える
setTimeout(() => {}, 1000);
let waitTill = new Date(new Date().getTime() + 1 * 1000);
while (waitTill > new Date()) {}
console.timeLog("PROC TIME");
console.timeStamp("PROC TIME"); // 細かい時間が出力される
console.timeEnd("PROC TIME"); // ラベル名は揃える

// デバッグ時に確認できるが、非推奨となっているため、今はtimeとtimeEndを使用すること
console.timeline("TIME LINE");
console.timelineEnd("TIME LINE");

// 呼び出し元を探す
console.trace();

// 謎のオブジェクト。保管領域？
console.memory;

// ログのグルーピング
console.group("GROUP");
console.log("GROUP -> log");
console.group("GROUP INNER 1");
console.debug("GROUP INNER 1 -> debug log"); // logの別名なのでlogと書こう
console.group("GROUP INNER 2");
console.assert("GROUP INNER 2 -> assert log");
console.info("GROUP INNER 2 -> info log");
console.groupEnd("GROUP INNER 2");
console.error("GROUP INNER 1 -> error log");
console.groupEnd("GROUP INNER 1");
console.warn("GROUP -> warn log");
console.groupEnd("GROUP");
