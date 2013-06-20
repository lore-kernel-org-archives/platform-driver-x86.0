From: Oleksij Rempel <linux@rempel-privat.de>
Subject: regression after "asus-wmi: update wlan LED through rfkill led trigger"
Date: Thu, 20 Jun 2013 08:44:03 +0200
Message-ID: <51C2A4B3.8090708@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:60586 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753498Ab3FTGoL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Jun 2013 02:44:11 -0400
Received: from mailout-de.gmx.net ([10.1.76.4]) by mrigmx.server.lan
 (mrigmx001) with ESMTP (Nemesis) id 0MFwhE-1V3Hpv2xcc-00ErxJ for
 <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2013 08:44:09 +0200
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, Corentin Chary <corentin.chary@gmail.com>, AceLan Kao <acelan.kao@canonical.com>, Matthew Garrett <mjg@redhat.com>

Hello all,

i have regression on Asus Zenbook UX32A after this patch:

commit 6cae06e603339f99334bc6b276e2ac619cf0d476
Author: AceLan Kao <acelan.kao@canonical.com>
Date:   Fri Jul 27 16:51:59 2012 +0800

     asus-wmi: update wlan LED through rfkill led trigger

     For those machines with wapf=4, BIOS won't update the wireless LED,
     since wapf=4 means user application will take in chage of the wifi 
and bt.
     So, we have to update wlan LED status explicitly.

     But I found there is another wireless LED bug in launchpad and which is
     not in the wapf=4 quirk.
     So, it might be better to set wireless LED status explicitly for all
     machines.

     BugLink: https://launchpad.net/bugs/901105

     Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
     Signed-off-by: Matthew Garrett <mjg@redhat.com>


Symptoms are fallowing:
- hot keys: F3, F4 (keyboard led); F10, F11, F12 (sound) - are not working.
- keyboard back light is off
- brightness keys (F5, F6) are working but with some issues. For example 
if you press it with short intervals, then it works ok. If you hold this 
buttons, thin it accumulate all calls and will fire them all after some 
time.

I also have similar machine "Asus Zenbook UX32E", without this problem.

-- 
Regards,
Oleksij
