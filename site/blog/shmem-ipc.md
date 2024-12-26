**[Shared Memory IPC in Rust                                             06/23/2024
--------------------------------------------------------------------------------]**

I recently came across ?[an interesting crate for Rust](https://crates.io/crates/shmem-ipc) that enables interprocess
communication via shared memory. At the time I was looking for a faster method
of transferring large amounts of data between different processes, and this
crate proved to be an effective solution.

PSA: this involves the use of unsafe Rust. Yipee!


**[Initial Setup
-------------]**

Besides just this crate, you need a few other things to make this work. There
needs to be a way to transfer file descriptors between the two programs. The
examples provided in the repository use DBUS to achieve this, but this is
honestly overkill. Instead, we use good ol' Unix Sockets along with ?[a nifty](https://crates.io/crates/passfd)
?[crate called passfd](https://crates.io/crates/passfd) to transfer the file descriptors and set up the shared
memory pipeline.

Start by creating a new project the usual way:

--------------------------------------------------------------------------------

  $ cargo new shmem-test
  $ cd shmem-test

--------------------------------------------------------------------------------


You will also need to modify Cargo.toml to include the two crates previously
mentioned and create separate client and server binaries:

--------------------------------------------------------------------------------

  [package]
    name = "shmem-test"
    version = "0.1.0"
    edition = "2021"

    # See more keys and their definitions at https://doc.rust-lang.org/cargo/refere>

    [dependencies]
    anyhow = "1.0"
    shmem-ipc = "0.3.0"
    passfd = "0.1.6"

    [[bin]]
    name = "client"
    path = "src/client.rs"

    [[bin]]
    name = "server"
    path = "src/server.rs"

--------------------------------------------------------------------------------


**[Basic Server-Client Interaction
-------------------------------]**

Let's modify the example from the shmem-ipc repo to use sockets and passfd
instead of dbus.

Starting with server.rs:

--------------------------------------------------------------------------------



--------------------------------------------------------------------------------