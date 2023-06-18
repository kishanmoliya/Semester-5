package com.kishan.easy;

public class factorial {
    public static void main(String[] args) {
        int n = 5;

//        //Normal Method
//        int fact = 1;
//        for(int i=1; i<=n; i++){
//            fact *= i;
//        }
//        System.out.println(fact);

        //Recursion
        System.out.println(factorial(n));
    }

    static int factorial(int n){
        if(n == 1){
            return n;
        }

        return n * factorial(n-1);
    }
}
