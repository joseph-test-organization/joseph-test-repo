'use strict';

let ogThing = {
    func1: (num) => `Yay here is num: ${num}`,
    func2: (word) => `Yay here is word: ${word}`
};

// console.log('First call to func1: ', ogThing.func1(22));
// console.log('First call to func2: ', ogThing.func2('pizza'));

const proxyThing = new Proxy(ogThing, {
    get(target, funcName) {
        if (funcName === 'func3') {
            return () => 'no yay';
        }
        return target[funcName];
    }
});
ogThing = proxyThing;

// console.log('Second call to func1: ', ogThing.func1(22));
// console.log('Second call to func2: ', ogThing.func2('pizza'));
// console.log('func3: ', ogThing.func3(22));
