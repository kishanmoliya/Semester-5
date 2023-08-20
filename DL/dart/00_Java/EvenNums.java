package com.kishan.easy;

public class EvenNums {
    public static void main(String[] args) {
//        //Normal method
//        for(int i=1; i<=100; i++){
//            if(i % 2 == 0){
//                System.out.println(i);
//            }
//        }
//
       //Recursion
        getEvenNum(1);
    }

    static void getEvenNum(int s){
        if(s == 100){
            System.out.println(s);
            return;
        }

        if(s % 2 == 0){
            System.out.println(s);
        }
        getEvenNum(s + 1);
    }
}
