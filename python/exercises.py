from dataclasses import dataclass
from collections.abc import Callable


def change(amount: int) -> dict[int, int]:
    if not isinstance(amount, int):
        raise TypeError("Amount must be an integer")
    if amount < 0:
        raise ValueError("Amount cannot be negative")
    counts, remaining = {}, amount
    for denomination in (25, 10, 5, 1):
        counts[denomination], remaining = divmod(remaining, denomination)
    return counts


# Write your first then lower case function here
def first_then_lower_case(list, predicate):
    return next((value.lower() for value in list if predicate(value)), None)


# Write your powers generator here
def powers_generator(base, limit):
    value = base**0
    while value <= limit:
        yield value
        value *= base


# Write your say function here
def say(string=None, /):
    if string is not None:
        return lambda next_string=None: (
            say(string + " " + next_string) if next_string is not None else string
        )
    else:
        return ""


# Write your line count function here
def meaningful_line_count(file_name):
    file = open(file=file_name)
    count = 0

    for line in file:
        if not line.strip().startswith("#") and line.strip():
            count += 1
    return count


# Write your Quaternion class here
