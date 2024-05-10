/**
 * @see <https://qiita.com/mabasasi/items/f392740e3d193ed93863>
 */

const os = require("os")
// import os from 'os'
// import log4js from 'log4js'
const log4js = require("log4js")
// import dateFormat from 'date-format'
const dateFormat = require("date-format")
// import chalk from 'chalk'
const chalk = require("chalk")

const LOG_LEVEL = 'ALL' // DEBUG: TRACE or DEBUG, PRODUCTION: INFO or OFF

const levelColors = {
  TRACE: { meta: 'grey', body: 'grey', trace: null },
  DEBUG: { meta: 'green', body: 'grey', trace: null },
  INFO: { meta: 'cyan', body: 'white', trace: null },
  WARN: { meta: 'yellow', body: 'yellow', trace: null },
  ERROR: { meta: 'red', body: 'red', trace: 'white' },
  FATAL: { meta: 'magenta', body: 'magenta', trace: 'white' }
}

const coloring = function (color, text) {
  if (color) {
    return chalk[color](text)
  }
  return text
}

log4js.addLayout('origin', function ({ addColor }) {
  return function (e) {
    const date = new Date(e.startTime)
    const level = e.level.levelStr.toUpperCase() // 大文字
    const hasCallStack = e.hasOwnProperty('callStack') // callStack を持っているか

    const dateStr = dateFormat('yyyy-MM-dd hh:mm:ss.SSS', date)
    const message = e.data.join(' ') // データはスペース区切り
    const levelStr = level.padEnd(5).slice(0, 5) // 5文字
    const color = levelColors[level]

    // メタ情報
    const meta = `${levelStr} ${dateStr} [${e.categoryName}]`
    const prefix = addColor ? coloring(color.meta, meta) : meta

    // ログ本体
    const body = addColor ? coloring(color.body, message) : message

    // スタックトレース
    let suffix = ''
    if (hasCallStack && color.trace) {
      const callStack = e.callStack
      suffix += os.EOL
      suffix += addColor ? coloring(color.trace, callStack) : callStack
    }

    return `${prefix} ${body}${suffix}`
  }
})

log4js.configure({
  appenders: {
    out: { type: 'stdout', layout: { type: 'origin', addColor: true } },
    logFile: { type: 'dateFile', filename: '../logs/application.log', pattern: "-yyyy-MM-dd", layout: { type: 'origin', addColor: false } },
    errFile: { type: 'dateFile', filename: '../logs/error.log', pattern: "-yyyy-MM-dd", layout: { type: 'origin', addColor: false } },
    log: { type: 'logLevelFilter', appender: 'logFile', level: 'info' },
    err: { type: 'logLevelFilter', appender: 'errFile', level: 'warn' },
  },
  categories: {
    default: { appenders: ['out', 'log', 'err'], level: LOG_LEVEL, enableCallStack: true }
  }
})

const logger = log4js.getLogger()
// logger.trace('Some trace messages')
// logger.debug('Some debug messages')
// logger.info('Some info messages')
// logger.warn('Some warn messages')
// logger.error('Some error messages')
// logger.fatal('Some fatal messages')

// ログを確実に保存してから終了する場合
// log4js.shutdown(() => {})

module.exports = logger;
