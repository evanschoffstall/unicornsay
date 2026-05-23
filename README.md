<div align="center">

<br />

<img src="./logo.png" width="220" alt="logo" />

# unicornsay

_Say something. A unicorn will deliver it._

[![Bash 4.2+](https://img.shields.io/badge/Bash-4.2+-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Tested with bats](https://img.shields.io/badge/Tested%20with-bats-8A2BE2?style=for-the-badge)](https://github.com/bats-core/bats-core)
[![MIT License](https://img.shields.io/badge/License-MIT-22c55e?style=for-the-badge)](LICENSE)

</div>

A single-file Bash script that wraps any message in a styled speech bubble beside a unicorn. Reads from an argument or stdin. Pipe anything through it.

<img src="./unicornsay.png" width="1026" alt="unicornsay banner" />

## Usage

```bash
# Argument
unicornsay "Hello, world!"

# Stdin
echo "Build passed." | unicornsay

# Login greeting with fortune and lolcat
unicornsay "$(date "+%b %e, %Y %I:%M:%S %p"; echo; fortune)" | lolcat
```

## Options

| Flag           | Values          | Default | Description                                       |
| -------------- | --------------- | ------- | ------------------------------------------------- |
| `--above`      | —               | off     | Bubble above the unicorn instead of side-by-side. |
| `--art`        | `big`, `small`  | auto    | Art size. Auto-selected from terminal height.     |
| `--side`       | `left`, `right` | `left`  | Which side the unicorn appears on.                |
| `-h`, `--help` | —               | —       | Print usage and exit.                             |

Side-by-side layout requires at least 60 columns. Set `COLUMNS` and `LINES` to pin layout for scripts and CI.

## Tests

```bash
bats unicornsay.bats
```

Covers all 20 combinations of `--above`, `--art`, and `--side` with exact-output assertions at `COLUMNS=80 LINES=24`. Uses [bats-core](https://github.com/bats-core/bats-core).

> [!IMPORTANT]
> If you change the output layout, re-capture snapshots at `COLUMNS=80 LINES=24` and update the heredocs in `unicornsay.bats`.

#

<div align="center">

Made with ❤️ by [Evan Schoffstall](https://github.com/evanschoffstall)

</div>
