import java.util.concurrent.*;

/**
 * Created by yanyuan on 2017/6/7.
 */
public class ConcurrentTest {

    public static void main(String[] args) throws InterruptedException, ExecutionException {
        long currTime = System.currentTimeMillis();
        ExecutorService executorService = Executors.newFixedThreadPool(2);
        ConcurrentHashMap<Integer, Integer> concurrentHashMap = new ConcurrentHashMap<>();

        Future<Boolean> future1 = executorService.submit(() -> test(1));
        Future<Boolean> future2 = executorService.submit(() -> test(2));
        Future<Boolean> future3 = executorService.submit(() -> test(3));
        Future<Boolean> future4 = executorService.submit(() -> test(4));
        Future<Boolean> future5 = executorService.submit(() -> test(5));



        System.out.println(System.currentTimeMillis() - currTime);
//        Thread.sleep(2000);
    }

    public static boolean test(int index){
        System.out.print("index -- > " + index);
        int x = 0;
        for (int i =0 ; i < 1000000000; i++){
            x += i;
        }
        System.out.println("  x -- > " + x);

        return true;
    }
}
