#!/usr/bin/env bash

# Read the tag, for example: 12X345-67
read -r tag

# The letter is at zero-based index 2.
letter=${tag:2:1}
if [[ "AEIOUY" == *"$letter"* ]]; then
    echo "invalid"
    exit 0
fi

# Zero-based positions of the digits in DDXDDD-DD.
digit_positions=(0 1 3 4 5 7 8)

# Every adjacent pair of digits must have an even sum.
for ((i = 0; i < ${#digit_positions[@]} - 1; i++)); do
    first_position=${digit_positions[i]}
    second_position=${digit_positions[i + 1]}

    first_digit=${tag:first_position:1}
    second_digit=${tag:second_position:1}

    # The input digits are non-zero, so normal Bash arithmetic is safe.
    sum=$((first_digit + second_digit))
    if ((sum % 2 != 0)); then
        echo "invalid"
        exit 0
    fi
done

echo "valid"
