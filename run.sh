#! /usr/bin/env bash

mainClass="org.rbamb.maven-rbamb-archetype.Main"
testClass="org.rbamb.maven-rbamb-archetype.MainTest"

exec_fmt() {
  mvn com.spotify.fmt:fmt-maven-plugin:format
}

exec_run() {
  local mainClass="$1"; shift
  local args="$@"
  mvn clean compile exec:java \
    -Dexec.mainClass="$mainClass" \
    -Dexec.args="$args"
}

exec_test(){
  local testClass="$1"; shift
  if [ -n "$testClass" ]; then
    mvn clean compile test -Dtest="$testClass"
  else
    mvn clean compile test
  fi
}

exec_package() {
  mvn clean package assembly:single
}

