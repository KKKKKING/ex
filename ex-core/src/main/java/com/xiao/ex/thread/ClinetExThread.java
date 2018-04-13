package com.xiao.ex.thread;

import com.google.gson.Gson;
import com.xiao.ex.core.ExceptionService;
import com.xiao.ex.core.vo.req.ExceptionVo;
import com.xiao.ex.core.vo.resp.Result;
import com.xiao.ex.rpc.RegistryService;
import com.xiao.ex.utils.HttpClientUtil;
import com.xiao.ex.utils.RefreshServerFactory;

import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

/**
 * @author 肖亭
 * @since 2017年09月15 16:29
 **/
public class ClinetExThread implements Runnable {
    public static Logger log = Logger.getLogger(ClinetExThread.class.toString());
    private static Queue<ExceptionVo> queue = new LinkedList<ExceptionVo>();
    private static ClinetExThread instance;
    private static ScheduledThreadPoolExecutor executor = new ScheduledThreadPoolExecutor(1);

    private ClinetExThread() {
    }


    public static synchronized ClinetExThread getInstance(Long time) {
        if (instance == null) {
            instance = new ClinetExThread();
            executor.scheduleAtFixedRate(instance, time, time, TimeUnit.MILLISECONDS);
        }
        return instance;
    }

    public void addExceptionVo(ExceptionVo vo) {
        if (vo != null) {
            queue.add(vo);
        }
    }

    @Override
    public void run() {
        if (queue != null && queue.size() > 0) {
            for (int i = 0; i < queue.size(); i++) {
                ExceptionVo poll = queue.poll();
                sendServiceMsg(poll);
            }
        }
    }

    /**
     * 上报到服务端
     *
     * @param vo
     */
    private void sendServiceMsg(ExceptionVo vo) {
        try {
            String resultStr = null;
            if (RefreshServerFactory.isHttp()) {
                Gson gson = new Gson();
                resultStr = HttpClientUtil.postJson(RefreshServerFactory.httpHost, gson.toJson(vo));
            } else {
                ExceptionService server = (ExceptionService) RegistryService.getRegistry();
                Result result = server.sendMsg(vo);
                resultStr = result.toString();
            }
            log.info("____异常上传结果:" + resultStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
