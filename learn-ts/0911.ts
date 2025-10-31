const anExampleVariable = "Hello World"
console.log(anExampleVariable)

let flag: boolean = true
console.log(flag)

let num: number = 125.3
console.log(num)

let s: string = 'Hello'
let s2: string = "TypeScript"
console.log(s + ' ' + s2)

let a: number[] = [1, 2, 3]
console.log(a)
a = [3.5]
console.log(a)

let arr: Array<number> = [1, 2, 3]
console.log(arr)

let tuple2: readonly [string, number, boolean] = ['a', 1, true]

enum Direction {
    Left,
    Right
}
console.log(Direction.Left)
console.log(Direction.Right)