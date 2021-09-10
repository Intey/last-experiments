let pkgs = import <nixpkgs> {};


# PIN to concrete version for real reproducive builds
/*
    pkgs = import (builtins.fetchTarball {
      name = "nixos-21.20";
      url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/21.05.tar.gz";
      sha256 = "1ckzhh24mgz6jd1xhfgx0i9mijk6xjqxwsshnvq789xsavrmsc36";
    }) {};
*/
in 

with import (builtins.fetchTarball https://github.com/lopsided98/nix-ros-overlay/archive/master.tar.gz) {};

# when we try `with rosPackages` and specify dist in paths, we get error:
# with repl we can find needed packages

# with rosPackages.noetic;

mkShell {
  buildInputs = with pkgs; with rosPackages.noetic; [
    clang_12
    ninja
    gtest
    cmake
    gdb
    # glfw # cannot compile, has no opengl...so...manually create derivations, and so on

    rosbash # roscd, etc
    ros-base # for roscore and etc bash commands
    (buildEnv { 
      name = "ros";
      paths = [
        roscpp # for linking/compiling
      ]; 
    })
  ];
}
