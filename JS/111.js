#!/usr/bin/env bun
import { $ } from "bun";
console.log('Hello World!');

await $`ls -la `;
// await $`cd ../ `;
await $.cwd("..");