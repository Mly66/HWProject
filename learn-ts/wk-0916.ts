// 判断回文数
function isPalindrome(num: number): boolean {
  const str = num.toString();
  return str === str.split('').reverse().join('');
}

// 判断水仙花数
function isArmstrong(num: number): boolean {
  const digits = num.toString().split('').map(Number);
  const n = digits.length;
  const sum = digits.reduce((acc, digit) => acc + Math.pow(digit, n), 0);
  return sum === num;
}

// 九九乘法表
function multiplicationTable(): void {
  for (let i = 1; i <= 9; i++) {
    let row = '';
    for (let j = 1; j <= i; j++) {
      row += `${j} * ${i} = ${i * j}\t`;
    }
    console.log(row);
  }
}

// 判断闰年
function isLeapYear(year: number): boolean {
  return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
}

// 字符串反转
function reverseString(str: string): string {
  return str.split('').reverse().join('');
}

// 骰子点数判断
function judgeDice(point: number): string {
  switch (point) {
    case 1:
    case 2:
    case 3:
      return "小";
    case 4:
    case 5:
    case 6:
      return "大";
    default:
      throw new Error("点数必须在 1~6 之间");
  }
}

// 打印指定范围内的回文数、水仙花数和闰年
function printNum(start: number, end: number): void {
  for (let i = start; i <= end; i++) {
    if (isPalindrome(i)) console.log(`回文数: ${i}`);
    if (isArmstrong(i)) console.log(`水仙花数: ${i}`);
    if (isLeapYear(i)) console.log(`闰年: ${i}`);
  }
}


printNum(0, 1000);
multiplicationTable();
console.log(`反转结果: ${reverseString('hello')}`);
for (let i = 1; i <= 6; i++) {
  console.log(`${i} 点 -> ${judgeDice(i)}`);
}
