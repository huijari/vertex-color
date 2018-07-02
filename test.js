#!/usr/bin/env node

const { dim, green, red } = require('chalk')
const { execSync } = require('child_process')
const { mkdirSync } = require('fs')

const { name } = require('./package.json')
const all = process.argv.indexOf('all') >= 0
const silent = process.argv.indexOf('silent') >= 0

const min = 1
const max = 26

mkdirSync('temp')
for (let i = min; i <= max; i++) {
  let passed = true
  try {
    process.chdir('temp')
    execSync(`../build/${name} < ../tests/common/entrada${i}.txt`)
    process.chdir('..')
  } catch (e) {
    console.error(red(`Command failed in test ${i}`))
    exit()
  }

  try {
    execSync(`diff tests/common/rodada${i}.txt temp/rodada.txt`)
  } catch (e) {
    passed = false
    console.error(red(`Test ${i} failed, wrong round`))
    if (!silent) console.error(e.stdout.toString('utf8'))
    if (!all) exit()
  }

  try {
    execSync(`diff tests/common/alocacao${i}.txt temp/alocacao.txt`)
  } catch (e) {
    passed = false
    console.error(red(`Test ${i} failed, wrong allocation`))
    if (!silent) console.error(e.stdout.toString('utf8'))
    if (!all) exit()
  }

  if (passed) console.log(dim(`Test ${i} passed`))
}

if (!all) console.log(green('All tests passed'))
exit()

function exit() {
  try {
    execSync('rm -rf temp')
  } catch {}
  process.exit()
}
