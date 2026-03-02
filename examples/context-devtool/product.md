# Product

## Overview
- **Name**: Pipecheck
- **One-liner**: API testing from your terminal — define, run, and automate HTTP test suites with plain YAML.
- **URL**: https://pipecheck.dev
- **Problem**: Developers bounce between Postman, curl, and custom scripts to test APIs. Test definitions live in GUI tools that can't be version-controlled, shared in code review, or run in CI. When APIs break in production, the test that would have caught it is trapped in someone's local Postman collection.

## Target User
- **Who**: Backend developers and platform engineers at startups and mid-size companies (10-200 engineers). Building REST and GraphQL APIs. Comfortable in the terminal.
- **What they care about**: Reliability, reproducibility, fast feedback loops, keeping everything in code, not paying for seats in GUI tools.
- **Where they are**: GitHub, Hacker News, r/golang, r/devops, dev Twitter, conference talks on testing and API design.
- **Current solution**: curl + bash scripts (fragile, no assertions), Postman (GUI-dependent, expensive per seat, can't code review), Bruno (newer but limited CI support), httpie (good for ad-hoc, no test suites).

## Core Features
- **YAML test definitions**: Define requests, expected status codes, response assertions, and variable extraction in plain YAML files that live in your repo
- **Chained requests**: Extract values from one response and inject into the next — auth flows, CRUD sequences, pagination testing
- **Environment management**: Switch between local, staging, and production with env files. Secrets pulled from env vars, never stored in test files
- **Parallel execution**: Run independent test suites concurrently with configurable parallelism. A 200-test suite finishes in seconds
- **CI integration**: First-class GitHub Actions action, GitLab CI template, and generic Docker image. JUnit XML output for test reporting
- **Snapshot testing**: Capture response shapes and diff against future runs. Catch unintended API contract changes before they ship
- **Plugin system**: Write custom assertion functions in Go. Community plugins for GraphQL introspection, OpenAPI validation, JWT decoding

## Technical Stack
- **Language**: Go 1.22 — single binary, zero dependencies, cross-platform
- **Distribution**: Homebrew, apt, Scoop, npm wrapper, Docker image, GitHub Releases (pre-built binaries for linux/mac/windows)
- **Architecture**: CLI core with plugin interface via Go plugins and WASM (experimental)
- **Test runner**: Custom concurrent executor with dependency graph resolution
- **Config format**: YAML with JSON Schema for editor autocompletion
- **Docs**: Docusaurus site deployed on Vercel
- **CI/CD**: GitHub Actions — lint, test, goreleaser for cross-platform builds on tag push
- **Monitoring**: Sentry for crash reporting (opt-in telemetry), GitHub Issues for bug tracking

## Roadmap
1. **v1.4 — OpenAPI Import**: Auto-generate test stubs from OpenAPI/Swagger specs — ETA 2 weeks
2. **v1.5 — Watch Mode**: Re-run affected tests on file save, like vitest for APIs — ETA 4 weeks
3. **v1.6 — gRPC Support**: Protobuf-native testing with the same YAML ergonomics — ETA 6 weeks
4. **v2.0 — Pipecheck Cloud**: Hosted test scheduling, monitoring dashboards, team sharing. Pro tier revenue driver — ETA Q3

## Key Metrics
- **GitHub stars**: 3,400 — growing ~200/month
- **Weekly downloads**: 8,500 (Homebrew + npm combined)
- **Monthly active users**: ~2,100 (opt-in telemetry)
- **Contributors**: 42 (12 regular, 30 occasional)
- **Open issues**: 67 (23 feature requests, 18 bugs, 26 questions)
- **Pro waitlist**: 340 signups
- **Sponsors**: $620/month via GitHub Sponsors (8 sponsors)

## Repos
- **Core CLI**: github.com/pipecheck/pipecheck (Go, MIT license)
- **GitHub Action**: github.com/pipecheck/action
- **Docs**: github.com/pipecheck/docs (Docusaurus)
- **Example tests**: github.com/pipecheck/examples (community-contributed test suites)
