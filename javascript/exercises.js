import { open } from "node:fs/promises"

export function change(amount) {
  if (!Number.isInteger(amount)) {
    throw new TypeError("Amount must be an integer")
  }
  if (amount < 0) {
    throw new RangeError("Amount cannot be negative")
  }
  let [counts, remaining] = [{}, amount]
  for (const denomination of [25, 10, 5, 1]) {
    counts[denomination] = Math.floor(remaining / denomination)
    remaining %= denomination
  }
  return counts
}

// Write your first then lower case function here
export function firstThenLowerCase(array, predicate) {
  const first = array.find(predicate)
  return first?.toLowerCase()
}
// Write your powers generator here
export function* powersGenerator({ ofBase: b, upTo: limit }) {
  var value = b ** 0
  while (value <= limit) {
    yield value
    value = value * b
  }
}
// Write your say function here
export function say(string) {
  if (string != undefined) {
    return (newString) => {
      if (newString != undefined) {
        return say(string + " " + newString)
      } else return string
    }
  } else return ""
}
// Write your line count function here
export async function meaningfulLineCount(fileName) {
  const file = await open(fileName)
  var count = 0

  for await (const line of file.readLines()) {
    if (!line.trim().startsWith("#") && line.trim().length != 0) {
      count += 1
    }
  }
  await file.close()
  return count
}

// Write your Quaternion class here
export class Quaternion {
  constructor(a, b, c, d) {
    Object.assign(this, { a, b, c, d })
    Object.freeze(this)
  }

  plus(q) {
    return new Quaternion(
      this.a + q.a,
      this.b + q.b,
      this.c + q.c,
      this.d + q.d
    )
  }

  times(q) {
    return new Quaternion(
      this.a * q.a - this.b * q.b - this.c * q.c - this.d * q.d,
      this.b * q.a + this.a * q.b + this.c * q.d - this.d * q.c,
      this.a * q.c - this.b * q.d + this.c * q.a + this.d * q.b,
      this.a * q.d + this.b * q.c - this.c * q.b + this.d * q.a
    )
  }

  get coefficients() {
    return [this.a, this.b, this.c, this.d]
  }

  get conjugate() {
    return new Quaternion(this.a, -this.b, -this.c, -this.d)
  }

  equals(q) {
    return this.a === q.a && this.b === q.b && this.c === q.c && this.d === q.d
  }

  toString() {
    var string =
      this.a + "+" + this.b + "i" + "+" + this.c + "j" + "+" + this.d + "k"
    string = string.replaceAll(/\+\-/g, "-")
    string = string.replace(/[\+\-]0[ijk]/g, "")
    string = string.replace(/1i/, "i")
    string = string.replace(/1j/, "j")
    string = string.replace(/1k/, "k")
    string = string.replace(/\b0\+/, "")
    string = string.replace(/\b0\-/, "-")
    return string
  }
}
