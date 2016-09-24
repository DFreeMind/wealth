package com.weduoo.wealth;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class TestDemo {
	public static void main(String[] args) throws Exception {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
		df.setTimeZone(TimeZone.getTimeZone("UTC"));
		System.out.println(df.parse("2014-08-23T09:20:05Z").toLocaleString());
		
		String str="小米 $305$2016-09-21T03:59:47.000Z$231905$刚刚醒悟的90后，遇到逻辑思维，笑来老师真是太幸运了，财富自由，我一定努力！$2785$http://wx.qlogo.cn/mmopen/ylRhrSjQb8jtJllGUVMF3cDMwVMsPF1bvFOpZcmMeOxbHlWtibuFcVaRRTnQKZ6e7quM3ibZdR7BtiapCYs9N4tmEEnPIbosDwm/0       |||            郑理文$305$2016-09-21T03:15:08.000Z$231717$尽管知道充值的数目是套路，但还是探索上了这条最长的路。$2784$http://piccdn.luojilab.com/avatar/iget/11549320.jpeg|||周亚菲丨读书控$305$2016-09-21T02:54:54.000Z$231607$我是笑来老师的迷妹，他的作品《把时间当作朋友》，我很喜欢。其他在知笔墨上的文章我都读过。今天来这里冒个泡，其实有点晚了，但我相信还不迟～$2783$http://wx.qlogo.cn/mmopen/ajNVdqHZLLBibtnkWGOXhBZdbKQEdIUukibunlvFv9xm0kQS8A3d6q2644D9tFthkeV3a6bPvrWERQQprkvkX70Q/0|||傅婉静????$305$2016-09-21T02:39:55.000Z$231523$无名小卒 花钱洗脑 值得推介 学习学习再学习$2782$http://wx.qlogo.cn/mmopen/Q3auHgzwzM7MsmqgRRaNYNWyERGtpcXAJUbSONibtXbGeZmXuGUjNGf3cRH5kTBfnjB9DMIyzJX44aD8ovlnjQ7wbhHBicJ2qnicNI2CAhHgK8/0";
		String[] one=str.split("\\|\\|\\|",-1);
		System.err.println(one.length);
		String[] two=one[0].split("\\$",-1);
		System.err.println(two.length);
	}
}
