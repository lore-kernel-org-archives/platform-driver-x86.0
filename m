From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 2/3] acer-wmi: check wireless capability flag before register rfkill
Date: Thu, 18 Aug 2011 18:47:33 +0800
Message-ID: <1313664454-2762-2-git-send-email-jlee@suse.com>
References: <1313664454-2762-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:61778 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785Ab1HRKvU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Aug 2011 06:51:20 -0400
Received: by mail-gy0-f174.google.com with SMTP id 6so1368495gya.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Aug 2011 03:51:20 -0700 (PDT)
In-Reply-To: <1313664454-2762-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

There will be better to check the wireless capability flag
(ACER_CAP_WIRELESS) before register wireless rfkill because maybe
the machine doesn't have wifi module or the module removed by user.

Tested on Acer Travelmate 8572
Tested on Acer Aspire 4739Z

Tested-by: AceLan Kao <acelan.kao@canonical.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |   64 +++++++++++++++++++++++++-------------
 1 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 36d2765..b663334 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1290,12 +1290,13 @@ static void acer_rfkill_update(struct work_struct *ignored)
 	u32 state;
 	acpi_status status;
 
-	status = get_u32(&state, ACER_CAP_WIRELESS);
-	if (ACPI_SUCCESS(status)) {
-		if (quirks->wireless == 3) {
-			rfkill_set_hw_state(wireless_rfkill, !state);
-		} else {
-			rfkill_set_sw_state(wireless_rfkill, !state);
+	if (has_cap(ACER_CAP_WIRELESS)) {
+		status = get_u32(&state, ACER_CAP_WIRELESS);
+		if (ACPI_SUCCESS(status)) {
+			if (quirks->wireless == 3)
+				rfkill_set_hw_state(wireless_rfkill, !state);
+			else
+				rfkill_set_sw_state(wireless_rfkill, !state);
 		}
 	}
 
@@ -1363,19 +1364,24 @@ static struct rfkill *acer_rfkill_register(struct device *dev,
 
 static int acer_rfkill_init(struct device *dev)
 {
-	wireless_rfkill = acer_rfkill_register(dev, RFKILL_TYPE_WLAN,
-		"acer-wireless", ACER_CAP_WIRELESS);
-	if (IS_ERR(wireless_rfkill))
-		return PTR_ERR(wireless_rfkill);
+	int err;
+
+	if (has_cap(ACER_CAP_WIRELESS)) {
+		wireless_rfkill = acer_rfkill_register(dev, RFKILL_TYPE_WLAN,
+			"acer-wireless", ACER_CAP_WIRELESS);
+		if (IS_ERR(wireless_rfkill)) {
+			err = PTR_ERR(wireless_rfkill);
+			goto error_wireless;
+		}
+	}
 
 	if (has_cap(ACER_CAP_BLUETOOTH)) {
 		bluetooth_rfkill = acer_rfkill_register(dev,
 			RFKILL_TYPE_BLUETOOTH, "acer-bluetooth",
 			ACER_CAP_BLUETOOTH);
 		if (IS_ERR(bluetooth_rfkill)) {
-			rfkill_unregister(wireless_rfkill);
-			rfkill_destroy(wireless_rfkill);
-			return PTR_ERR(bluetooth_rfkill);
+			err = PTR_ERR(bluetooth_rfkill);
+			goto error_bluetooth;
 		}
 	}
 
@@ -1384,30 +1390,44 @@ static int acer_rfkill_init(struct device *dev)
 			RFKILL_TYPE_WWAN, "acer-threeg",
 			ACER_CAP_THREEG);
 		if (IS_ERR(threeg_rfkill)) {
-			rfkill_unregister(wireless_rfkill);
-			rfkill_destroy(wireless_rfkill);
-			rfkill_unregister(bluetooth_rfkill);
-			rfkill_destroy(bluetooth_rfkill);
-			return PTR_ERR(threeg_rfkill);
+			err = PTR_ERR(threeg_rfkill);
+			goto error_threeg;
 		}
 	}
 
 	rfkill_inited = true;
 
-	if (ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID))
+	if ((ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID)) &&
+	    has_cap(ACER_CAP_WIRELESS | ACER_CAP_BLUETOOTH | ACER_CAP_THREEG))
 		schedule_delayed_work(&acer_rfkill_work,
 			round_jiffies_relative(HZ));
 
 	return 0;
+
+error_threeg:
+	if (has_cap(ACER_CAP_BLUETOOTH)) {
+		rfkill_unregister(bluetooth_rfkill);
+		rfkill_destroy(bluetooth_rfkill);
+	}
+error_bluetooth:
+	if (has_cap(ACER_CAP_WIRELESS)) {
+		rfkill_unregister(wireless_rfkill);
+		rfkill_destroy(wireless_rfkill);
+	}
+error_wireless:
+	return err;
 }
 
 static void acer_rfkill_exit(void)
 {
-	if (ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID))
+	if ((ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID)) &&
+	    has_cap(ACER_CAP_WIRELESS | ACER_CAP_BLUETOOTH | ACER_CAP_THREEG))
 		cancel_delayed_work_sync(&acer_rfkill_work);
 
-	rfkill_unregister(wireless_rfkill);
-	rfkill_destroy(wireless_rfkill);
+	if (has_cap(ACER_CAP_WIRELESS)) {
+		rfkill_unregister(wireless_rfkill);
+		rfkill_destroy(wireless_rfkill);
+	}
 
 	if (has_cap(ACER_CAP_BLUETOOTH)) {
 		rfkill_unregister(bluetooth_rfkill);
-- 
1.6.0.2
