pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template MyCircuit () {  
   // Signal inputs
   signal input a;
   signal input b;

   // Signal from gates
   signal x;

   // final signal output
   signal output y;

   // component gates used to create custom client
   component orGate = OR();
   component notGate = NOT();

   // circuit logic
   orGate.a <== a;
   orGate.b <== b;
   x <== orGate.out;

   notGate.in <== x;
   y <== notGate.out;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = MyCircuit();