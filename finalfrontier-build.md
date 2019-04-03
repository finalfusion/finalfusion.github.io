## Building finalfrontier

Compilation of finalfrontier requires a working
[Rust](https://www.rust-lang.org/) toolchain. We recommend you to use
[rustup](https://rustup.rs/) to install a Rust toolchain:

~~~shell
$ curl https://sh.rustup.rs -sSf | sh
$ rustup default stable
~~~

With Rust installed, you can compile finalfrontier using `cargo`:

~~~shell
$ cargo install --path finalfrontier-utils
~~~

Afterwards, the binaries are available in the `~/.cargo/bin` directory.
