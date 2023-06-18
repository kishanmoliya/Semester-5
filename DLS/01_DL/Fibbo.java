package com.kishan.easy;

public class Fibbo {
    public static void main(String[] args) {
        int n = 5;

        //Normal Method
//        int a = 0;
//        int b = 1;
//        int ans = 0;
//        for(int i=0; i<n; i++){
//            ans += a;
//            a = b;
//            b = ans;
//        }
//        System.out.println(ans);

        //Full Series
//        int a = 0;
//        int b = 1;
//        for(int i=0; i<n; i++){
//            System.out.print(a + " ");
//            int temp = a + b;
//            a = b;
//            b = temp;
//       }

        System.out.println(fibbo(n - 1));
    }

    static int fibbo(int n){
        if(n <= 1){
            return n;
        }
        return fibbo(n-1) + fibbo(n-2);
    }
}
