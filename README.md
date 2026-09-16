# Tag Validation

GNU Bash 5.0.17 solution for validating a truck tag in the format `DDXDDD-DD`.

## Approach

The letter must not be one of `A E I O U Y`. Every adjacent pair of digits must have an even sum, which is equivalent to requiring equal parity. The implementation checks the four digit pairs in the tag.

## Complexity

| Resource | Complexity |
|---|---:|
| Time | O(1) |
| Extra space | O(1) |

## Run

```bash
printf '12X345-67\n' | ./solution.sh
```

Expected output: `invalid`.
