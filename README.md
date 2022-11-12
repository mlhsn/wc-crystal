# Word counter

`wc` - print newline, word, and byte counts for given file. Clone of *nix [**`wc`**](https://linux.die.net/man/1/wc) command written in [Crystal](https://crystal-lang.org).

- Only Support one file per command invoke.
- DO NOT expect feature parity with `wc` command.
- This project is educational. I will not support with feature/fix request.
- UNSTABLE, pre-alpha status.

### Installation

- [Install **`Crystal`**](https://crystal-lang.org/install/)
- Clone this repository to a directory and go to the directory
- Run following
    ```bash 
    $ shards build
    ```
- You'll find compiled executable on `~/<setup-dir>/bin/wc`


### Usage

```sh
# show char, word, line count
$ wc ~/start-up.sh
1090	82	42

# show only char count
$ wc ~/start-up.sh -c
1090

# show only word count
$ wc ~/start-up.sh -w
82

# show only word count use
$ wc ~/start-up.sh -l
42
```
