From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Wed, 22 Jun 2011 17:28:33 +0800
Message-ID: <4E01B5C1.1010500@canonical.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com> <4DE57CD6.5030609@flanto.de> <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com> <4DE74CEF.3020608@flanto.de> <4DE86E36020000230002D768@novprvlin0050.provo.novell.com> <4DE8D876.7060304@flanto.de> <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com> <4DF08626.3050802@canonical.com> <4DF908DA020000230002E497@novprvlin0050.provo.novell.com> <4DF87EA2.3050204@flanto.de> <4DFBDE91020000230002E620@novprvlin0050.provo.novell.com> <4DFB6CDE.4020003@flanto.de> <4DFC8014020000230002E662@novprvlin0050.provo.novell.com> <4DFE145B.4060405@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:35441 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755200Ab1FVJ2n (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2011 05:28:43 -0400
In-Reply-To: <4DFE145B.4060405@flanto.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Florian Heyer <heyho@flanto.de>
Cc: Joey Lee <jlee@novell.com>, platform-driver-x86@vger.kernel.org

Hi Florian,

Could you have the same test with ideapad-laptop loaded? I need to make
sure ideapad-laptop have the correct rfkill information.

Thanks a lot.

On 06/19/2011 11:23 PM, Florian Heyer wrote:
> On 06/18/2011 02:38 AM, Joey Lee wrote:
>>
>> Could you please help to test this patch? This is just a test patch, and
>> I didn't evaluation AWM0 in update rfkill state polling because I didn't
>> think evaluate AWM0 per second is a good idea.
>>
>> Please probe acer-wmi driver then report rfkill state. That's see what
>> the situation, then we add AWM0 part in next patch.
> 
> Hello Joey,
> 
> just tested your patch. It works, after inserting the patched module i can use wifi!
> 
> After booting with hardware switch = on i inserted patched acer-wmi. This is "rfkill list" state after inserting:
> 
> 0: hci0: Bluetooth
>     Soft blocked: no
>     Hard blocked: no
> 1: phy0: Wireless LAN
>     Soft blocked: no
>     Hard blocked: no
> 2: acer-wireless: Wireless LAN
>     Soft blocked: no
>     Hard blocked: no
> 
> After switching to off:
> 1: phy0: Wireless LAN
>     Soft blocked: no
>     Hard blocked: no
> 2: acer-wireless: Wireless LAN
>     Soft blocked: no
>     Hard blocked: yes
> 
> Switching back to on:
> 1: phy0: Wireless LAN
>     Soft blocked: no
>     Hard blocked: no
> 2: acer-wireless: Wireless LAN
>     Soft blocked: no
>     Hard blocked: no
> 3: hci0: Bluetooth
>     Soft blocked: no
>     Hard blocked: no
> 
> 
> regards
