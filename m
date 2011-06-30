From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Thu, 30 Jun 2011 22:26:03 +0800
Message-ID: <4E0C877B.3080706@canonical.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com> <4DE57CD6.5030609@flanto.de> <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com> <4DE74CEF.3020608@flanto.de> <4DE86E36020000230002D768@novprvlin0050.provo.novell.com> <4DE8D876.7060304@flanto.de> <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com> <4DF08626.3050802@canonical.com> <4DF908DA020000230002E497@novprvlin0050.provo.novell.com> <4DF87EA2.3050204@flanto.de> <4DFBDE91020000230002E620@novprvlin0050.provo.novell.com> <4DFB6CDE.4020003@flanto.de> <4DFC8014020000230002E662@novprvlin0050.provo.novell.com> <4DFE145B.4060405@flanto.de> <4E01B5C1.1010500@canonical.com> <4E050172.7050604@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:49456 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751294Ab1F3O0J (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Jun 2011 10:26:09 -0400
In-Reply-To: <4E050172.7050604@flanto.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Florian Heyer <heyho@flanto.de>
Cc: Joey Lee <jlee@novell.com>, platform-driver-x86@vger.kernel.org

Hi Florian,

Thanks for your testing, looks like ideapad-laptop reports correct rfkill
state.

Just two questions to be clarified,

 1. Which wifi driver you are using? wl or others?
 2. When system fails to connect AP, is the wifi scanning result correct?

Just wonder if there are any chance that ideapad-laptop block your wifi
connection even it shows unblocked.

On 06/25/2011 05:28 AM, Florian Heyer wrote:
> On 22.06.2011 11:28, Ike Panhc wrote:
>> Hi Florian,
>>
>> Could you have the same test with ideapad-laptop loaded? I need to make
>> sure ideapad-laptop have the correct rfkill information.
>>
> 
> Hello Ike,
> 
> no problem:
> 
> After booting, wifi switch is on:
> 
> after loading acer-wmi and idepad-laptop "rfkill list" shows
> 0: hci0: Bluetooth
>     Soft blocked: no
>     Hard blocked: no
> 1: phy0: Wireless LAN
>     Soft blocked: no
>     Hard blocked: no
> 2: acer-wireless: Wireless LAN
>     Soft blocked: no
>     Hard blocked: no
> 3: ideapad_bluetooth: Bluetooth
>     Soft blocked: no
>     Hard blocked: no
> 
> wifi doesn't work this time (this seems to vary, sometimes wifi works directly after loading acer-wmi).
> 
> after switching to off:
> 1: phy0: Wireless LAN
>     Soft blocked: no
>     Hard blocked: no
> 2: acer-wireless: Wireless LAN
>     Soft blocked: no
>     Hard blocked: yes
> 3: ideapad_bluetooth: Bluetooth
>     Soft blocked: no
>     Hard blocked: yes
> 
> after switching back to on:
> 1: phy0: Wireless LAN
>     Soft blocked: no
>     Hard blocked: no
> 2: acer-wireless: Wireless LAN
>     Soft blocked: no
>     Hard blocked: no
> 3: ideapad_bluetooth: Bluetooth
>     Soft blocked: no
>     Hard blocked: no
> 4: hci0: Bluetooth
>     Soft blocked: no
>     Hard blocked: no
> 
> wifi runs and is trying to connect...but no connection. I toggled wifi on/off again and it gets enabled/disabled correctly every time but i don't get a stable wifi connection this time. This might be a different issue with the wifi driver as this one is under development too. I've had this behaviour some times (i have used the ideapad about 20 hours this week).
> 
> 
> regards
