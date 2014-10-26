From: Stephan Mueller <smueller@chronox.de>
Subject: ideapad_laptop: rfkill quirk
Date: Sun, 26 Oct 2014 04:07:42 +0100
Message-ID: <26688268.oFvWOPa3fZ@tachyon.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.eperm.de ([89.247.134.16]:54130 "EHLO mail.eperm.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750935AbaJZDP6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 25 Oct 2014 23:15:58 -0400
Received: from tachyon.chronox.de
	by mail.eperm.de with [XMail 1.27 ESMTP Server]
	id <S314A> for <platform-driver-x86@vger.kernel.org> from <smueller@chronox.de>;
	Sun, 26 Oct 2014 04:07:44 +0100
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi,

I am working on a Lenovo Yoga Pro 3. This device does not have any physical 
rfkill switch. In addition, it has a Broadcomm 4352 wireless device.

I am using the proprietary Broadcomm wireless device driver as there is 
currently no open source driver available.

After booting the Broadcomm wireless driver is not loaded. ifconfig -a does 
not display any wireless device. The status of rfkill is as follows:

rfkill list all
0: ideapad_wlan: Wireless LAN
        Soft blocked: yes
        Hard blocked: yes
1: ideapad_bluetooth: Bluetooth
        Soft blocked: yes
        Hard blocked: yes

You see, that there is a woreless LAN device reported with a hardware rfkill 
switch.

When insmoding the Broadcomm driver, the rfkill status is:

rfkill list all
0: ideapad_wlan: Wireless LAN
        Soft blocked: yes
        Hard blocked: yes
1: ideapad_bluetooth: Bluetooth
        Soft blocked: yes
        Hard blocked: yes
7: phy1: Wireless LAN
        Soft blocked: yes
        Hard blocked: no
8: hci0: Bluetooth
        Soft blocked: yes
        Hard blocked: no

Now, after calling rfkill unblock all, the soft blocked status is no, but the 
hard blocked is still yes for the ideapad_wlan. This implies that the 
NetworkManager keeps the Broadcomm phy1 device disabled. When I rmmod the 
ideapad_laptop device driver, only phy1 and hci0 are left and NetworkManager 
activates them to work normally.

When insmoding the ideapad_laptop again, I see the hard blocked setting for 
both ideapad_* devices is "no", which implies that I still have network 
connection.

I am wondering why is there an ideapad wlan rfkill hardware switch found after 
boot, but after rmmod and insmod it is not found any more. 

Thanks
-- 
Ciao
Stephan
