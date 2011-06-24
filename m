From: Florian Heyer <heyho@flanto.de>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Fri, 24 Jun 2011 23:03:45 +0200
Message-ID: <4E04FBB1.6090304@flanto.de>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com> <4DE57CD6.5030609@flanto.de> <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com> <4DE74CEF.3020608@flanto.de> <4DE86E36020000230002D768@novprvlin0050.provo.novell.com> <4DE8D876.7060304@flanto.de> <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com> <4DF08626.3050802@canonical.com> <4DF908DA020000230002E497@novprvlin0050.provo.novell.com> <4DF87EA2.3050204@flanto.de> <4DFBDE91020000230002E620@novprvlin0050.provo.novell.com> <4DFB6CDE.4020003@flanto.de> <4DFC8014020000230002E662@novprvlin0050.provo.novell.com> <4DFE145B.4060405@flanto.de> <4DFFA92F020000230002E786@novprvlin0050.provo.novell.com> <4DFF27EC.9080804@flanto.de> <4E00FC24020000230002E843@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from melmac.flanto.de ([78.46.67.50]:37443 "EHLO melmac.flanto.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753130Ab1FXVDy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jun 2011 17:03:54 -0400
In-Reply-To: <4E00FC24020000230002E843@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: ike.pan@canonical.com, platform-driver-x86@vger.kernel.org

Hello Joey,

> For a normal user, he will not un-probe acer-wmi driver after system.
> Could you please help to confirm? I mean please switch your hardware
> wifi switch a couple of cycles with acer-wmi loaded.
>
> Just want to 100% make sure acer-wmi will not crash after switch
> wireless state by hardware a lot of times.

Ok, with only acer-wmi loaded (wifi is connected) i toggled the wifi 
switch a couple of times. Trying as fast as possible...no problem, 
system didn't crash. After finally switching to "on" wifi connected again.

> It's the same, if you wan to use ideapad-laptop at the same time. Please
> load ideapad-laptop and acer-wmi then switch wireless button many times,
> make sure there have not thing crash.
>

With acer-wmi AND idepad-laptop loaded i tried the same as above. Again, 
no crash. After switching finally to "on" wifi connected again.

I noticed a message from acer-wmi (has nothing to do with the tests 
above): acer-wmi prints a message to kernel message log about every second:

[28907.045046] acer_wmi: acer_rfkill_update state: 1

Is this debugging output? For the final version it should be disabled.


regards
-- 
Florian Heyer - heyho@flanto.de
