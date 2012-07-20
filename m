From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 2/2] asus-wmi: update wireless LED explicitly
Date: Fri, 20 Jul 2012 11:26:27 +0800
Message-ID: <1342754788-22880-2-git-send-email-acelan.kao@canonical.com>
References: <1342754788-22880-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:38734 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789Ab2GTD0g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 Jul 2012 23:26:36 -0400
Received: by pbbrp8 with SMTP id rp8so5420767pbb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jul 2012 20:26:35 -0700 (PDT)
In-Reply-To: <1342754788-22880-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

For those machines with wapf=4, BIOS won't update the wireless LED,
since wapf=4 means user application will take in chage of the wifi and bt.
So, we have to turn on/off the wireless LED explicitly.

But I found there is another wireless LED bug in launchpad and which is
not in the wapf=4 quirk.
So, I think maybe we should set wireless LED status explicitly for all
machines.

BugLink: https://launchpad.net/bugs/901105

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 638facf..75699b3 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -719,6 +719,12 @@ error_workqueue:
 	return ret;
 }
 
+static void wlan_led_update(struct asus_wmi *asus)
+{
+	int status = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_WLAN);
+	asus_wmi_set_devstate(ASUS_WMI_DEVID_WIRELESS_LED, status, NULL);
+}
+
 /*
  * Rfkill devices
  */
@@ -750,6 +756,7 @@ static int asus_rfkill_set(void *data, bool blocked)
 	}
 
 	result = asus_wmi_set_devstate(dev_id, ctrl_param, NULL);
+	wlan_led_update(priv->asus);
 
 	return result;
 }
-- 
1.7.9.5
