From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Fri, 01 Jul 2011 16:24:54 +0800
Message-ID: <4E0D8456.2020007@canonical.com>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com> <4DE57CD6.5030609@flanto.de> <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com> <4DE74CEF.3020608@flanto.de> <4DE86E36020000230002D768@novprvlin0050.provo.novell.com> <4DE8D876.7060304@flanto.de> <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com> <4DF08626.3050802@canonical.com> <4DF908DA020000230002E497@novprvlin0050.provo.novell.com> <4DF87EA2.3050204@flanto.de> <4DFBDE91020000230002E620@novprvlin0050.provo.novell.com> <4DFB6CDE.4020003@flanto.de> <4DFC8014020000230002E662@novprvlin0050.provo.novell.com> <4DFE145B.4060405@flanto.de> <4E01B5C1.1010500@canonical.com> <4E050172.7050604@flanto.de> <4E0C877B.3080706@canonical.com> <4E0C902F.1090603@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:43080 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754895Ab1GAIZA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 04:25:00 -0400
In-Reply-To: <4E0C902F.1090603@flanto.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Florian Heyer <heyho@flanto.de>
Cc: Joey Lee <jlee@novell.com>, platform-driver-x86@vger.kernel.org

On 06/30/2011 11:03 PM, Florian Heyer wrote:
> On 30.06.2011 16:26, Ike Panhc wrote:
>> Hi Florian,
>>
>> Thanks for your testing, looks like ideapad-laptop reports correct rfkill
>> state.
>>
>> Just two questions to be clarified,
>>
>>   1. Which wifi driver you are using? wl or others?
> 
> Hello Joey,
> 
> i'm not really sure what you mean. What's "wl"? I'm using the modules rt2800pci and rt2x00pci for wifi support (hardware is Ralink corp. RT3090 Wireless 802.11n 1T/1R PCIe).
> 

Thanks for your answer. I assumed the wifi chips are from Broadcom,

>>   2. When system fails to connect AP, is the wifi scanning result correct?
>>
>> Just wonder if there are any chance that ideapad-laptop block your wifi
>> connection even it shows unblocked.
> 
> I'll have to check again. Wifi runs stable since a few days. I'm running kernel 2.6.39 now.

Thanks a lot, This is what I need to know.

> 
> 
> regards
