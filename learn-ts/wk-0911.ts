// 计算半圆形田径场的周长和面积
function calculateSemiCircularTrack(radius: number, length: number) {
  const pi = Math.PI;

  const semiCirclePerimeter = pi * radius;
  const totalPerimeter = semiCirclePerimeter + 2 * length;
  const semiCircleArea = (pi * Math.pow(radius, 2)) / 2;
  const trackArea = length * radius * 2;
  const totalArea = semiCircleArea + trackArea;

  return { totalPerimeter, totalArea };
}

const radius = 50;
const length = 100;

const result = calculateSemiCircularTrack(radius, length);
console.log(`半圆跑道周长: ${result.totalPerimeter.toFixed(2)} 米`);
console.log(`半圆跑道面积: ${result.totalArea.toFixed(2)} 平方米`);


// 计算华氏度转摄氏度
function fToC(f: number): number {
  return (f - 32) * 5 / 9;
}
const f = 1;
const c = fToC(f);

console.log(`${f} 华氏度 = ${c.toFixed(2)} 摄氏度`);
