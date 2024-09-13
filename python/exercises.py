from dataclasses import dataclass
from collections.abc import Callable
import re


def change(amount: int) -> dict[int, int]:
    if not isinstance(amount, int):
        raise TypeError("Amount must be an integer")
    if amount < 0:
        raise ValueError("Amount cannot be negative")
    counts, remaining = {}, amount
    for denomination in (25, 10, 5, 1):
        counts[denomination], remaining = divmod(remaining, denomination)
    return counts


# first then lower case
def first_then_lower_case(list, predicate, /):
    return next((value.lower() for value in list if predicate(value)), None)


# powers generator
def powers_generator(*, base, limit):
    value = base**0
    while value <= limit:
        yield value
        value *= base


# say function
def say(string=None, /):
    if string is not None:
        return lambda next_string=None: (
            say(string + " " + next_string) if next_string is not None else string
        )
    return ""


# line count function
def meaningful_line_count(file_name, /):
    with open(file_name) as file:
        count = 0
        for line in file:
            strippedLine = line.strip()
            if not strippedLine.startswith("#") and strippedLine:
                count += 1
        return count


# Quaternion class
@dataclass(frozen=True)
class Quaternion:

    def __init__(self, a: float, b: float, c: float, d: float, /):
        object.__setattr__(self, "a", a)
        object.__setattr__(self, "b", b)
        object.__setattr__(self, "c", c)
        object.__setattr__(self, "d", d)

    def __add__(self, other):
        return Quaternion(
            self.a + other.a, self.b + other.b, self.c + other.c, self.d + other.d
        )

    def __mul__(self, other):
        return Quaternion(
            self.a * other.a - self.b * other.b - self.c * other.c - self.d * other.d,
            self.b * other.a + self.a * other.b + self.c * other.d - self.d * other.c,
            self.a * other.c - self.b * other.d + self.c * other.a + self.d * other.b,
            self.a * other.d + self.b * other.c - self.c * other.b + self.d * other.a,
        )

    @property
    def coefficients(self):
        return (self.a, self.b, self.c, self.d)

    @property
    def conjugate(self):
        return Quaternion(self.a, -self.b, -self.c, -self.d)

    def __equals__(self, other):
        return (
            self.a == other.a
            and self.b == other.b
            and self.c == other.c
            and self.d == other.d
        )

    def __str__(self):
        string = (
            str(self.a)
            + "+"
            + str(self.b)
            + "i"
            + "+"
            + str(self.c)
            + "j"
            + "+"
            + str(self.d)
            + "k"
        )
        string = re.sub("[+][-]", "-", string)
        string = re.sub("[+-]0[ijk]", "", string)
        string = re.sub("[+-]0.0[ijk]", "", string)
        string = re.sub("1i|1.0i", "i", string)
        string = re.sub("1k|1.0k", "k", string)
        string = re.sub("1j|1.0j", "j", string)
        string = re.sub("\A0[+]", "", string)
        string = re.sub("\A0[-]", "-", string)
        string = re.sub("\A0.0[+]", "", string)
        string = re.sub("\A0.0[-]", "-", string)

        return string
