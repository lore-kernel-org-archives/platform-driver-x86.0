From: Florian Heyer <heyho@flanto.de>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Tue, 31 May 2011 15:02:36 +0200
Message-ID: <4DE4E6EC.7080005@flanto.de>
References: <4DAB18C3.7010106@flanto.de> <4DAB9566.7010601@canonical.com> <4DB92866.4000008@flanto.de> <4DE48486.1050702@canonical.com> <4DE51718020000230002D4CF@novprvlin0050.provo.novell.com> <4DE48CD5.1080008@canonical.com> <4DE49815.4010901@flanto.de> <4DE5448A020000230002D51E@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from melmac.flanto.de ([78.46.67.50]:47177 "EHLO melmac.flanto.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750789Ab1EaNCp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 31 May 2011 09:02:45 -0400
In-Reply-To: <4DE5448A020000230002D51E@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: ike.pan@canonical.com, platform-driver-x86@vger.kernel.org

On 05/31/2011 11:42 AM, Joey Lee wrote:
> Just checked your DSDT, it declared the AMW0 methods, I agreed Ike's
> suggestion that will be better you direct test acer-wmi on your machine.
>
> Please modprobe acer-wmi driver, then try to turn on/off bluetooth or
> wireless device by rfkill.

Hello Joey,

here are some findings with acer_wmi. I execute the following steps from 
top to bottom, and only after the last step my wifi works. After each 
step you find the output of "rfkill list":

after booting (no ideapad_laptop, no acer_wmi):
0: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no
1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: yes

after loading acer_wmi (wifi switch is on):
0: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no
1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no
2: acer-wireless: Wireless LAN
	Soft blocked: yes
	Hard blocked: no

after switching off:
1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no
2: acer-wireless: Wireless LAN
	Soft blocked: yes
	Hard blocked: no

switching on again:
1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: yes
2: acer-wireless: Wireless LAN
	Soft blocked: yes
	Hard blocked: no
3: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no

after removing acer_wmi with modprobe -r:
1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no
3: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no

Now wifi networking can be used!
The optimal solution would be to have ideapad_laptop make all 
initialisations so wifi can be used after booting with no manual steps 
necessary.

Regards
-- 
Florian Heyer - heyho@flanto.de
