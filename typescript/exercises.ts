import { open } from "node:fs/promises"

export function change(amount: bigint): Map<bigint, bigint> {
  if (amount < 0) {
    throw new RangeError("Amount cannot be negative")
  }
  let counts: Map<bigint, bigint> = new Map()
  let remaining = amount
  for (const denomination of [25n, 10n, 5n, 1n]) {
    counts.set(denomination, remaining / denomination)
    remaining %= denomination
  }
  return counts
}

export function firstThenApply<T, U>(items: T[], predicate: (item: T) => boolean, consumer: (item: T) => U): U | undefined {
  var first_element: T | undefined = items.find(predicate)

  return first_element !== undefined ? consumer(first_element): undefined
}


export function* powersGenerator(base: bigint): Generator<bigint>{
  for (let exponentiation = 1n; ; exponentiation *= base)
    yield exponentiation
}

export async function meaningfulLineCount(filename: string){
  let count: number = 0
  const file = await open(filename, "r")
  for await (const line of file.readLines()){
    const trimmed: string = line.trim()
    if (trimmed && !trimmed.startsWith("#")) {
      count++
    }
  }
  return count
}

interface Sphere {
  kind: "Sphere"
  radius: number
}

interface Box {
  kind: "Box"
  width: number
  height: number
  depth: number
}

export type Shape = Sphere | Box

export function surfaceArea(shape: Shape): number {return 0}
export function volume(shape: Box): number {return 0}


// Write your binary search tree implementation here
export interface BinarySearchTree<T>{
  size(): number
  insert(value: T): BinarySearchTree<T>
  contains(value: T): boolean
  inorder(): Iterable<T>
}

export class Empty<T> implements BinarySearchTree<T> {

}

export class BinarySearchTree<T> implements BinarySearchTree<T> {
  
}