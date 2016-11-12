package com.bky.controller;

public class Test {
	
	public static class demo extends Thread  
    {
        int x;
        public demo(int x)
        {
            this.x=x;
        }
        public void run() {
           System.out.print("线程"+x);
        } 
    }
    public static void main(String[] args) {
 
        demo dem=new demo(1);
        dem.start();
        
       
    }
}
