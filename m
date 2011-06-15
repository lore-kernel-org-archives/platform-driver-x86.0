From: Florian Heyer <heyho@flanto.de>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Wed, 15 Jun 2011 11:42:58 +0200
Message-ID: <4DF87EA2.3050204@flanto.de>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com> <4DE57CD6.5030609@flanto.de> <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com> <4DE74CEF.3020608@flanto.de> <4DE86E36020000230002D768@novprvlin0050.provo.novell.com> <4DE8D876.7060304@flanto.de> <4DEEB8EB020000230002DF1A@novprvlin0050.provo.novell.com> <4DF08626.3050802@canonical.com> <4DF908DA020000230002E497@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from melmac.flanto.de ([78.46.67.50]:45806 "EHLO melmac.flanto.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754403Ab1FOJnI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Jun 2011 05:43:08 -0400
In-Reply-To: <4DF908DA020000230002E497@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: ike.pan@canonical.com, platform-driver-x86@vger.kernel.org

On 06/15/2011 11:32 AM, Joey Lee wrote:
>   + Does "hardware switch" on IdeaPad S205 not just control wireless? Does it also control bluetooth?

Hello Joey,

just a quick answer (i will go through your whole mail in the evening):

Yes, the hardware switch controls bluetooth and works fine: ubuntu's 
bluetooth icon appears/disappears when i toggle the switch on/off. This 
works even without acer_wmi.

I have the hardware switch usually on "on" and with this setting rfkill 
shows the following state directly after booting (without loading acer_wmi):

0: hci0: Bluetooth
  	Soft blocked: no
  	Hard blocked: no
1: phy0: Wireless LAN
  	Soft blocked: no
  	Hard blocked: yes



regards
-- 
Florian Heyer - heyho@flanto.de
