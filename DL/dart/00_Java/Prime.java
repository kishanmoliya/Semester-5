package com.kishan.easy;

public class Prime {
    public static void main(String[] args) {
        int n = 23;

        //Normal Method
        boolean flage = true;
        for(int i=2; i<n / 2; i++){
            if(n % i == 0){
                flage = false;
                break;
            }
        }
        if(flage)
            System.out.println(n + " is a Prime Number");
        else
            System.out.println(n + " is Not a Prime Number");

 //       //Recursion Method - 1
//        if(getPrime(n, 2))
//            System.out.println(n + " is a Prime Number");
//        else
//            System.out.println(n + " is Not a Prime Number");

 //       //Recursion Method - 2
//        if(prime(n))
//            System.out.println(n + " is a Prime Number");
//        else
//            System.out.println(n + " is Not a Prime Number");
    }

    //Recursion Method - 1
    static boolean getPrime(int n, int s){
        if(s > n / 2){
            return true;
        }
        if(n % s == 0){
            return false;
        }
        return getPrime(n,s + 1);
    }

    //Recursion Method - 2
    static boolean prime(int n){
        return halper(n, 2);
    }

    private static boolean halper(int n, int s){
        if(s > n / 2){
            return true;
        }
        if(n % s == 0){
            return false;
        }
        return halper(n,s + 1);
    }
}
