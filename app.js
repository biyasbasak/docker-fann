var fann = require('fann');
var net = new fann.standard(2,3,1);

var data = [
    [[0, 0], [0]],
    [[0, 1], [1]],
    [[1, 0], [1]],
    [[1, 1], [0]],
];

net.train(data, {error: 0.00001});

console.log("xor test (0,0) -> ", net.run([0, 0]));
console.log("xor test (1,0) -> ", net.run([1, 0]));
console.log("xor test (0,1) -> ", net.run([0, 1]));
console.log("xor test (1,1) -> ", net.run([1, 1]));
