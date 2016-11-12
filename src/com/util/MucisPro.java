package com.util;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;

import javax.media.CannotRealizeException;
import javax.media.Controller;
import javax.media.ControllerEvent;
import javax.media.ControllerListener;
import javax.media.EndOfMediaEvent;
import javax.media.Manager;
import javax.media.NoPlayerException;
import javax.media.Player;
import javax.media.Time;

public class MucisPro implements Runnable{
	private Time zeroTime = new Time(0);
    private Player player;
    private boolean turnOff = false;
    private boolean isloop = false;
 
    /***************************************************************************
     * Function: MusicPlay Description: constructor, load the music file and get
     * ready for play Called By: MultiMedia()
     **************************************************************************/
    // 实例化各个参数 filename 为文件名，可为绝对路径
    public MucisPro(String filename) {
        File file = new File(filename);
        try {
            player = Manager.createRealizedPlayer(file.toURI().toURL());
            player.addControllerListener(new ControllListener());
        } catch (NoPlayerException e) {
            e.printStackTrace();
        } catch (CannotRealizeException e) {
            e.printStackTrace();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
 
    /***************************************************************************
     * Function: isRunning Description: test if this music is playing Called By:
     **************************************************************************/
    public boolean isRunning() {
        return player.getState() == Player.Started;
    }
 
    /***************************************************************************
     * Function: play Description: play the music for once Called By:
     * resumeAll()
     **************************************************************************/
    // 只播放一次
    public void play() {
        if (!turnOff)
            player.start();
    }
 
    /***************************************************************************
     * Function: replay Description: replay the music Called By: musics that
     * will be played many times will invoke this methed
     **************************************************************************/
    // 再播放一次
    public void replay() {
        if (turnOff)
            return;
 
        if (player.getState() == Controller.Prefetched)
            player.setMediaTime(zeroTime);
        player.start();
    }
 
    /***************************************************************************
     * Function: stop Description: stop this music Called By: stopAll() of upper
     * class,suspendAll() of upper class,BackroundForMenuPanel,GameOverPanel
     **************************************************************************/
    public void stop() {
        player.stop();
    }
 
    /***************************************************************************
     * Function: close Description: dispose the music Called By: closeAll() of
     * super class
     **************************************************************************/
    public void close() {
        player.stop();
        player.close();
    }
 
    /***************************************************************************
     * Function: loop Description: make the music played repetitiously Called
     * By: music that will repetitious play
     **************************************************************************/
    // 循环播放
    public void loop() {
        if (turnOff)
            return;
 
        isloop = true;
        player.prefetch();
        replay();
    }
 
    /***************************************************************************
     * Function: run Description: trig this music Called By: Override method
     **************************************************************************/
     
    public void run() {
        loop();
    }
 
    /***************************************************************************
     * Subclass: ControllListener Description: listener for playing and
     * implement playing repetitiously
     **************************************************************************/
    // 通过对播放进度的监听，实现循环播放
    private class ControllListener implements ControllerListener {
 
        public void controllerUpdate(ControllerEvent e) {
            if (e instanceof EndOfMediaEvent) {
                if (isloop) {
                    player.setMediaTime(new Time(0));
                    player.start();
                }
            }
        }
    }
    //1446700952862
    public static void main(String[] args) {
    	MucisPro mp = new MucisPro("G:/fukua.wav");
        mp.play();
        long a = System.currentTimeMillis();
        System.out.println(a);
    }
}
