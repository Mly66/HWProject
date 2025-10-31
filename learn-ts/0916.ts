function MaxScore(scores: number[]): number {
    if (scores.length === 0) {
        throw new Error("数组不能为空");
    }
    return Math.max(...scores);
}

function MinScore(scores: number[]): number {
    if (scores.length === 0) {
        throw new Error("数组不能为空");
    }
    return Math.min(...scores);
}

function AvgScore(scores: number[]): number {
    if (scores.length <= 2) {
        throw new Error("计算平均分时，数组元素必须多于两个");
    }
    const max = MaxScore(scores);
    const min = MinScore(scores);
    const sum = scores.reduce((acc, val) => acc + val, 0);
    return (sum - max - min) / (scores.length - 2);
}

function SortScore(scores: number[]): number[] {
    return [...scores].sort((a, b) => b - a);  // 展开运算符复制数组
}

const disScore: number[] = [9.0, 8.5, 9.0, 9.5, 8.0, 8.5, 9.0, 8.3, 9.2];

console.log(`最高分：${MaxScore(disScore).toFixed(1)}`);
console.log(`最低分：${MinScore(disScore).toFixed(1)}`);
console.log(`去掉最高和最低分后的平均分：${AvgScore(disScore).toFixed(2)}`);
console.log(`排序结果：${SortScore(disScore).join(", ")}`);

