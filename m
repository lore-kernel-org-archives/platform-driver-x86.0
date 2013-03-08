From: Murray Campbell <murray@sonology.net>
Subject: asus-wmi: wlan rfkill on eee pc 1015PEM possible regression?
Date: Thu, 7 Mar 2013 16:26:49 -0800
Message-ID: <20130308002649.GA4232@wavelet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ye0-f176.google.com ([209.85.213.176]:44197 "EHLO
	mail-ye0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760097Ab3CHA1H (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Mar 2013 19:27:07 -0500
Received: by mail-ye0-f176.google.com with SMTP id m9so181541yen.21
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Mar 2013 16:27:06 -0800 (PST)
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi,

I have an ASUS Eee PC 1015PEM and, on upgrading from kernel 3.5.7 to
3.6.11 noticed that the rfkill behaviour stopped working the way I was
expecting.

I have git-bisect-ed it down to the following commit:

a50bd128f28cf81c1250874fc53728e113f12957

which certainly looks relevant.

I first noticed the problem because the WLAN rfkill toggle button
(Fn+F2) stopped toggling the WLAN LED.  Also, it won't enable the WLAN
if it is disabled in the BIOS.

Prior to the change 'rfkill list' would show two devices: 0: "asus-wlan"
and 1: "phy0".  Using either the button or 'rfkill (un)block all' would
toggle the blocked state from "no,no; no,no" to "yes,no; yes,yes" where
each pair is soft/hard and the first pair is the asus-wlan, the second
the phy0.  Each time the phy0 hard block status would take a second or
two to change.

This worked regardless of the state in the BIOS and would appropriately
toggle the WLAN LED.

After the commit the two devices are switched: phy0 is number 0 and
asus-wlan is number 1.  The hard block status of both devices is
impossible to change with either 'rfkill' or the button.  The asus-wlan
device is always not hard-blocked,  the phy0 hard-block always keeps the
status assigned in the BIOS.  The soft-block state changes
appropriately.  The WLAN LED never changes.

If the WLAN is disabled in the BIOS it is never possible to enable it
without a reboot and I am wondering if the device is ever switched off
properly if it is enabled in the BIOS.

Is this expected behaviour?  If not I am more than willing to
investigate further if anyone can suggest a line of enquiry.

Thank you,

Murray Campbell <murray@sonology.net>
