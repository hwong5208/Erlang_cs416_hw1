import java.math.BigInteger;

public class hw1 {

    public static void main(String[] args) {
        System.out.println("fib(0): "+fib(0));
        System.out.println("fib(1): "+fib(1));
        System.out.println("fib(2): "+fib(2));
        System.out.println("fib(3): "+fib(3));
        System.out.println("fib(5): "+fib(5));
        System.out.println("fib(10): "+fib(10));
        System.out.println("fib(100): "+fib(100));
    }

    public static String fib(int x){
        if(x <= 1) return  Integer.toString(x);
        BigInteger[] arr = new BigInteger[x+1];
        arr[0]=BigInteger.ZERO;
        arr[1]=BigInteger.ONE;

        for (int i=2; i<=x; i++){
            arr[i]=arr[i-2].add(arr[i-1]);
        }
        return arr[x].toString();
    }

}

