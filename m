From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-wmi: preserve the bt rfkill status if wapf=4
Date: Thu,  8 Nov 2012 11:39:07 +0800
Message-ID: <1352345948-13924-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:48337 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753836Ab2KHDjN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Nov 2012 22:39:13 -0500
Received: by mail-pa0-f46.google.com with SMTP id hz1so1652436pad.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Nov 2012 19:39:12 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

When wapf=4, BIOS won't resotre the wlan/bt rfkill status after resume or
reboot. And when wapf=4, the bt rfkill status will be stored in the same
place as wlan in the BIOS.
Without this patch, bt status will be always on after reboot or resume.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 18f5169..a317f44 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -334,6 +334,9 @@ static int asus_wmi_get_devstate_bits(struct asus_wmi *asus,
 
 static int asus_wmi_get_devstate_simple(struct asus_wmi *asus, u32 dev_id)
 {
+	/* BT status will be stored in WLAN if wapf is 4. */
+	if (dev_id == ASUS_WMI_DEVID_BLUETOOTH && asus->driver->quirks->wapf == 4)
+		dev_id = ASUS_WMI_DEVID_WLAN;
 	return asus_wmi_get_devstate_bits(asus, dev_id,
 					  ASUS_WMI_DSTS_STATUS_BIT);
 }
@@ -1875,6 +1878,12 @@ static int asus_hotk_restore(struct device *device)
 	if (asus->bluetooth.rfkill) {
 		bl = !asus_wmi_get_devstate_simple(asus,
 						   ASUS_WMI_DEVID_BLUETOOTH);
+		if (asus->driver->quirks->wapf == 4)
+		{
+			mutex_lock(&asus->wmi_lock);
+			asus_rfkill_set(&asus->bluetooth, bl);
+			mutex_unlock(&asus->wmi_lock);
+		}
 		rfkill_set_sw_state(asus->bluetooth.rfkill, bl);
 	}
 	if (asus->wimax.rfkill) {
@@ -1900,6 +1909,7 @@ static int asus_hotk_restore(struct device *device)
 static const struct dev_pm_ops asus_pm_ops = {
 	.thaw = asus_hotk_thaw,
 	.restore = asus_hotk_restore,
+	.resume = asus_hotk_restore,
 };
 
 static int asus_wmi_probe(struct platform_device *pdev)
-- 
1.7.10.4
