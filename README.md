# Ombre

[![Continuous integration](https://github.com/Michael-F-Bryan/ombre/workflows/Continuous%20Integration/badge.svg?branch=main)](https://github.com/Michael-F-Bryan/ombre/actions)

([API Docs][api-docs])

Use [Radio Mobile][radio-mobile] to generate radio coverage maps for the
Communications Support Unit.

> **Fun trivia:** this type of map is often referred to as a "shadmap" (i.e.
> radio shadow map), and the French word for "shadow" is "ombre".

## Getting Started

### For Developers

This project follows the same workflow as most other Rust projects. After you
have [installed Rust][rust], you can use `cargo` to build the project:

```console
$ cargo build
```

You can also run the UI in debug mode.

```console
$ cargo run --bin=ombre -- --version
ombre-gui 0.1.0
```

You can run the test suite, but a lot of tests will be disabled for non-Windows
builds.

```console
$ cargo test --workspace
# or
$ cargo nextest run --workspace
```

## Releases

We use [Release Please][release-please] and GitHub Actions to automate releases.
This automatically creates a draft release PR which, when merged, will trigger
the actual release. This will:

- Update changelog entries
- Bump version numbers
- Attach the appropriate tags to the merge commit
- Create a GitHub Release, and
- Compile release artifacts and attach them to the GitHub Release

Whenever you create a commit starting with a [Conventional Commit message][msg],
(`feat:`, `fix:`, etc.) the commit message will be added to the corresponding
section of the corresponding crate's `CHANGELOG.md` file. You can indicate a
breaking change by appending a `!` (i.e. `feat!:`). The tool will automatically
figure out whether to do a major, minor, or patch release.

## License

This project is licensed under either of

- Apache License, Version 2.0, ([LICENSE-APACHE](./LICENSE-APACHE.md) or
  <http://www.apache.org/licenses/LICENSE-2.0>)
- MIT license ([LICENSE-MIT](./LICENSE-MIT.md) or
   <http://opensource.org/licenses/MIT>)

at your option.

It is recommended to always use [`cargo crev`][crev] to verify the
trustworthiness of each of your dependencies, including this one.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally
submitted for inclusion in the work by you, as defined in the Apache-2.0
license, shall be dual licensed as above, without any additional terms or
conditions.

The intent of this crate is to be free of soundness bugs. The developers will
do their best to avoid them, and welcome help in analysing and fixing them.

[api-docs]: https://michael-f-bryan.github.io/ombre
[crev]: https://github.com/crev-dev/cargo-crev
[radio-mobile]: https://www.ve2dbe.com/english1.html
[rust]: https://rustup.rs/
[release-please]: https://github.com/googleapis/release-please/
[msg]: https://www.conventionalcommits.org/
