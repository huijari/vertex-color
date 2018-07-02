#!/usr/bin/env node

const { dim, green, red } = require('chalk')
const { execSync } = require('child_process')
const { mkdirSync } = require('fs')

const { name } = require('./package.json')

const min = 1
const max = 26

mkdirSync('temp')
for (let i = min; i <= max; i++) {
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
    console.error(red(`Test ${i} failed, wrong round`))
    console.error(e.stdout.toString('utf8'))
    exit()
  }

  try {
    execSync(`diff tests/common/alocacao${i}.txt temp/alocacao.txt`)
  } catch (e) {
    console.error(red(`Test ${i} failed, wrong allocation`))
    console.error(e.stdout.toString('utf8'))
    exit()
  }

  console.log(dim(`Test ${i} passed`))
}

console.log(green('All tests passed'))
exit()

function exit() {
  try {
    execSync('rm -rf temp')
  } catch {}
  process.exit()
}
