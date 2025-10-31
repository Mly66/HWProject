function MaxScore(scores: number[]): number {
    if (scores.length === 0) {
        throw new Error("数组不能为空");
    }
    let max = scores[0]!; 
    for (let i = 1; i < scores.length; i++) {
        if (scores[i]! > max) {  
            max = scores[i]!;
        }
    }
    return max;
}

function MinScore(scores: number[]): number {
    if (scores.length === 0) {
        throw new Error("数组不能为空");
    }
    let min = scores[0]!;
    for (let i = 1; i < scores.length; i++) {
        if (scores[i]! < min) {
            min = scores[i]!;
        }
    }
    return min;
}

function AvgScore(scores: number[]): number {
    if (scores.length <= 2) {
        throw new Error("数组长度必须大于 2");
    }

    let max = MaxScore(scores);
    let min = MinScore(scores);

    let sum = 0;
    let count = 0;
    let skippedMax = false;
    let skippedMin = false;

    for (let i = 0; i < scores.length; i++) {
        let val = scores[i]!;
        if (val === max && !skippedMax) {
            skippedMax = true;
            continue;
        }
        if (val === min && !skippedMin) {
            skippedMin = true;
            continue;
        }
        sum += val;
        count++;
    }

    return sum / count;
}

function SortScore(scores: number[]): number[] {
    if (scores.length === 0) {
        throw new Error("数组不能为空");
    }

    let arr: number[] = [];
    for (let i = 0; i < scores.length; i++) {
        arr[i] = scores[i]!;
    }

    for (let i = 0; i < arr.length - 1; i++) {
        for (let j = 0; j < arr.length - 1 - i; j++) {
            if (arr[j]! < arr[j + 1]!) {
                let temp = arr[j]!;
                arr[j] = arr[j + 1]!;
                arr[j + 1] = temp;
            }
        }
    }
    return arr;
}

// 测试
const disScore = [9.0, 8.5, 9.0, 9.5, 8.0, 8.5, 9.0, 8.3, 9.2];

console.log("最高分:", MaxScore(disScore));
console.log("最低分:", MinScore(disScore));
console.log("平均分:", AvgScore(disScore));
console.log("分数排序:", SortScore(disScore));
