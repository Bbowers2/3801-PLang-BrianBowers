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
  return count
}
// Write your Quaternion class here
