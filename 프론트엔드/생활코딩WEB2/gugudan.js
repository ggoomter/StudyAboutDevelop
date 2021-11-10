function printGugudan(){
    for(let dan=2; dan<10; dan++){
        printDan(dan);
        console.log('\n');
    }
}


function printDan(dan){
    for(let i=1; i<10; i++){
        console.log(`${dan} * ${i} = ${dan*i}`);
    }
}

printGugudan();
