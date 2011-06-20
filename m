From: Florian Heyer <heyho@flanto.de>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Mon, 20 Jun 2011 12:58:52 +0200
Message-ID: <4DFF27EC.9080804@flanto.de>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com> <4DE57CD6.5030609@flanto.de> <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com> <4DE74CEF.3020608@flanto.de> <4DE86E36020000230002D768@novprvlin0050.provo.novell.com> <4DE8D876.7060304@flanto.de> <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com> <4DF08626.3050802@canonical.com> <4DF908DA020000230002E497@novprvlin0050.provo.novell.com> <4DF87EA2.3050204@flanto.de> <4DFBDE91020000230002E620@novprvlin0050.provo.novell.com> <4DFB6CDE.4020003@flanto.de> <4DFC8014020000230002E662@novprvlin0050.provo.novell.com> <4DFE145B.4060405@flanto.de> <4DFFA92F020000230002E786@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from melmac.flanto.de ([78.46.67.50]:57197 "EHLO melmac.flanto.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752196Ab1FTK7B (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Jun 2011 06:59:01 -0400
In-Reply-To: <4DFFA92F020000230002E786@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: ike.pan@canonical.com, platform-driver-x86@vger.kernel.org

On 06/20/2011 12:10 PM, Joey Lee wrote:
> But,
> here have a question:
>
> The phy0 killswitch didn't set to hard blocked, did wireless LAN still
> can be used at this moment? even hardware switch is off?

Hello Joey,

i tested again:

First with acer-wmi inserted (as always boot-state of wifi button is on):

switching to off "rfkill list" is:

1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: yes
6: acer-wireless: Wireless LAN
	Soft blocked: no
	Hard blocked: yes

(phy0-hard blocked goes to "yes" after 1 or 2 seconds, maybe yesterday i 
didn't wait long enough). Wifi doesn't work in this state, i checked.

Switching to on "rfkill list" is:

1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no
6: acer-wireless: Wireless LAN
	Soft blocked: no
	Hard blocked: no
7: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no

Wifi now works!

After removing acer-wmi (so i loaded it only for initialisation), 
switching to off "rfkill list" is:

1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: yes

Back to on:

1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no
5: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no


wifi works in state "on"- so acer-wmi is really needed only for 
initialisation.
ideapad-laptop is _not_ loaded, the wifi switch works correctly nonetheless.

> I thought the real situation back to BT on, Wireless on, right?

yes, after switching to on everything is back to state after 
initialisation (wifi works).


regards
-- 
Florian Heyer - heyho@flanto.de
