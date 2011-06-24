From: Florian Heyer <heyho@flanto.de>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Fri, 24 Jun 2011 23:28:18 +0200
Message-ID: <4E050172.7050604@flanto.de>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com> <4DE57CD6.5030609@flanto.de> <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com> <4DE74CEF.3020608@flanto.de> <4DE86E36020000230002D768@novprvlin0050.provo.novell.com> <4DE8D876.7060304@flanto.de> <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com> <4DF08626.3050802@canonical.com> <4DF908DA020000230002E497@novprvlin0050.provo.novell.com> <4DF87EA2.3050204@flanto.de> <4DFBDE91020000230002E620@novprvlin0050.provo.novell.com> <4DFB6CDE.4020003@flanto.de> <4DFC8014020000230002E662@novprvlin0050.provo.novell.com> <4DFE145B.4060405@flanto.de> <4E01B5C1.1010500@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from melmac.flanto.de ([78.46.67.50]:44540 "EHLO melmac.flanto.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752167Ab1FXV21 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jun 2011 17:28:27 -0400
In-Reply-To: <4E01B5C1.1010500@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Joey Lee <jlee@novell.com>, platform-driver-x86@vger.kernel.org

On 22.06.2011 11:28, Ike Panhc wrote:
> Hi Florian,
>
> Could you have the same test with ideapad-laptop loaded? I need to make
> sure ideapad-laptop have the correct rfkill information.
>

Hello Ike,

no problem:

After booting, wifi switch is on:

after loading acer-wmi and idepad-laptop "rfkill list" shows
0: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no
1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no
2: acer-wireless: Wireless LAN
	Soft blocked: no
	Hard blocked: no
3: ideapad_bluetooth: Bluetooth
	Soft blocked: no
	Hard blocked: no

wifi doesn't work this time (this seems to vary, sometimes wifi works 
directly after loading acer-wmi).

after switching to off:
1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no
2: acer-wireless: Wireless LAN
	Soft blocked: no
	Hard blocked: yes
3: ideapad_bluetooth: Bluetooth
	Soft blocked: no
	Hard blocked: yes

after switching back to on:
1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no
2: acer-wireless: Wireless LAN
	Soft blocked: no
	Hard blocked: no
3: ideapad_bluetooth: Bluetooth
	Soft blocked: no
	Hard blocked: no
4: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no

wifi runs and is trying to connect...but no connection. I toggled wifi 
on/off again and it gets enabled/disabled correctly every time but i 
don't get a stable wifi connection this time. This might be a different 
issue with the wifi driver as this one is under development too. I've 
had this behaviour some times (i have used the ideapad about 20 hours 
this week).


regards
-- 
Florian Heyer - heyho@flanto.de
