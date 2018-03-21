package service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.UUID;
import java.util.concurrent.*;

/**
 * Created by yanyuan on 16/2/1.
 */
public class BlockingQueueTest {

    static Logger logger = LoggerFactory.getLogger(BlockingQueueTest.class);

    public static class Basket{
        //篮子,能够容纳3个苹果
        BlockingQueue<String> basket = new ArrayBlockingQueue<String>(10);

        public void produce(String apple) throws InterruptedException {
            //put方法放入一个苹果,若basket满了,等到basket有位置
            basket.put(apple);
            logger.info("生产者生产苹果: " + apple);

        }

        public String consume() throws InterruptedException {
            //take方法取出一个苹果,若basket为空,等到basket有苹果为止
            String uid = basket.take();
            logger.info("消费者消费苹果: " + uid);
            return uid;
        }
    }

    public static void testBasket() {
        Basket basket = new Basket();
        //定义生产者
        class Producer implements Runnable {

            @Override
            public void run() {
                //休眠300ms
                try {
                    //生产苹果
                    for (int i = 0; i < 100; i++) {
                        basket.produce("第" + (i + 1) + "个苹果");
                    }
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }

        class Consumer implements Runnable {

            @Override
            public void run() {
                //休眠300ms
                try {
                    //消费苹果
                    for (int i = 0; i < 100; i++) {
                        basket.consume();
                    }
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }

        ExecutorService executorService = Executors.newFixedThreadPool(10);
        Producer producer = new Producer();
        Consumer consumer = new Consumer();
        executorService.submit(producer);
        executorService.submit(consumer);
        //程序运行5s后,所有任务停止
        try{
            TimeUnit.SECONDS.sleep(5000);
        }catch(InterruptedException ex){
        }
        executorService.shutdownNow();
    }

    public static void main(String[] args){
        BlockingQueueTest.testBasket();
    }
}
