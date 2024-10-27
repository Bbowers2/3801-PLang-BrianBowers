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
  length: number
  depth: number
}

export type Shape = Sphere | Box

export function surfaceArea(shape: Shape): number {

  switch(shape.kind){
    case "Sphere":
      return 4 * Math.PI * shape.radius ** 2
    case "Box":
      return 2 * shape.width * shape.length + 2 * shape.length * shape.depth + 2 * shape.width * shape.depth
  }

}

export function volume(shape: Shape): number {
  switch(shape.kind){
    case "Sphere":
      return 4/3 * Math.PI * shape.radius ** 3
    case "Box":
      return shape.width * shape.length * shape.depth
  }
}


export interface BinarySearchTree<T>{
  size(): number
  insert(value: T): BinarySearchTree<T>
  contains(value: T): boolean
  inorder(): Iterable<T>
}

export class Empty<T> implements BinarySearchTree<T> {
  size(): number {
    return 0
  }

  insert(value: T): BinarySearchTree<T> {
    return new Node(this, value, this);
  }

  contains(value: T): boolean {
      return false
  }

  *inorder(): Iterable<T> {
  
  }

  toString(): String {
    return "()"
  }
}

export class Node<T> implements BinarySearchTree<T> {
  left: BinarySearchTree<T> | Empty<T>
  right: BinarySearchTree<T> | Empty<T>
  value: T

  constructor(left: BinarySearchTree<T> | Empty<T>, value: T, right: BinarySearchTree<T> | Empty<T>){
    this.left = left;
    this.right = right;
    this.value = value;
  }

  size(): number {
    return this.left.size() + 1 + this.right.size()
  }

  insert(value: T): BinarySearchTree<T> {
    if (value < this.value){
      return new Node(this.left.insert(value), this.value, this.right)
    }
    else if (value > this.value){
      return new Node(this.left, this.value, this.right.insert(value))
    }
    else {
      return new Node(this.left, this.value, this.right)
    }
  }

  contains(value: T): boolean {
      return this.value === value || this.right.contains(value) || this.left.contains(value)
  }

  *inorder(): Iterable<T> {
    yield* this.left.inorder()
    yield this.value
    yield* this.right.inorder()
  }

  toString(): String {
    return (("(" + this.left.toString() + String(this.value) + this.right.toString() + ")").replace(/\(\)/g, ""))
  }
}