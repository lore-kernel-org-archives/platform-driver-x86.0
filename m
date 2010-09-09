From: Ike Panhc <ike.pan@canonical.com>
Subject: asus-laptop kill wifi when initital
Date: Thu, 09 Sep 2010 15:41:27 +0800
Message-ID: <4C888FA7.9090402@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:47659 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751071Ab0IIHlf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Sep 2010 03:41:35 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: acpi4asus-user@lists.sourceforge.net, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>

Hi,

I have a report[1] that user has to blacklist the asus-laptop otherwise wifi
can not work. I copied asus-laptop.c from 2.6.32 kernel and remove two
lines[2] that set WLED/BLED on. The modified driver works fine.

User uses 2.6.32 based kernel and when 2.6.34, a module parameter
"wifi_status" is added[3] to let user choose what he want to do on WLED/BLED
when initial. So I guess there are some reports tells the parameter for
WLED/BLED maybe changed. Since the default action is still on because some
machine need to enable WLED/BLED when booting. Any idea for the future
change? For example telling user add an options on /etc/modprobe.d, or try
to have a list of machine that not to set WLED/BLED to 1 when booting?


[1] http://launchpad.net/bugs/612454

[2] Patch is shown below:

@@ -1273,8 +1273,10 @@ static int asus_hotk_add(struct acpi_dev
 	asus_hotk_found = 1;
 
 	/* WLED and BLED are on by default */
+#if 0 /* Remove by Ike Panhc */
 	write_status(bt_switch_handle, 1, BT_ON);
 	write_status(wl_switch_handle, 1, WL_ON);
+#endif
 
 	/* If the h/w switch is off, we need to check the real status */
 	write_status(NULL, read_status(BT_ON), BT_ON);

[3] https://patchwork.kernel.org/patch/76283/
