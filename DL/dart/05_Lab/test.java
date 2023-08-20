class test{
    public static void main(String[] args) {
        int A = 3;
        int[][] B = {{1,2,2}};
        int[] arr;
        if(B[0][0] + B[0][2] <= B[0][1]){
            arr = new int[3];
        }else{
            arr = new int[1];
        }
        
        if(B[0][0] + B[0][2] <= B[0][1]){
            arr[0] = -1;
            arr[1] = B[0][2];
            arr[2] = B[0][2] + 1;
        }else{
            arr[0] = -1;
        }

        for(int i=0; i<arr.length; i++){
            System.out.println(arr[i]);
        }
    }
}
