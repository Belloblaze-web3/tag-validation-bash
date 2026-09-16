#!/usr/bin/env bash
set -euo pipefail
root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
run(){ local a; a=$(printf '%s' "$1" | "$root/solution.sh"); [[ "$a" == "$2" ]] || { echo "FAIL: $a != $2"; exit 1; }; }
run '12X345-67' invalid
run '22B224-22' valid
run '12A345-67' invalid
echo 'All tests passed.'
