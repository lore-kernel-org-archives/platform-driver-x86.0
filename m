From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: does not poll device status when WMI event is available
Date: Mon, 28 Mar 2011 16:21:26 +0800
Message-ID: <1301300486-4458-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:64720 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751269Ab1C1IYR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2011 04:24:17 -0400
Received: by yxs7 with SMTP id 7so1093027yxs.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Mar 2011 01:24:16 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: carlos@strangeworlds.co.uk
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Acer WMI hotkey event's result include current device status, just
need sync the status to killswitch after acer-wmi driver receive
hotkey event but not always poll device status. This is good for
performance.

But, if use EC raw mode, Acer BIOS will not emit wmi event and
leave EC to control device status. So, still startup polling job
when doesn't detect WMI event GUID or user choice to use ec_raw_mode.

Tested on Acer TravelMate 8572 notebook.

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/acer-wmi.c |   20 ++++++++++++++++++--
 1 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1953c70..9764ddc 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1224,14 +1224,17 @@ static int acer_rfkill_init(struct device *dev)
 		}
 	}
 
-	schedule_delayed_work(&acer_rfkill_work, round_jiffies_relative(HZ));
+	if (ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID))
+		schedule_delayed_work(&acer_rfkill_work,
+			round_jiffies_relative(HZ));
 
 	return 0;
 }
 
 static void acer_rfkill_exit(void)
 {
-	cancel_delayed_work_sync(&acer_rfkill_work);
+	if (ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID))
+		cancel_delayed_work_sync(&acer_rfkill_work);
 
 	rfkill_unregister(wireless_rfkill);
 	rfkill_destroy(wireless_rfkill);
@@ -1332,6 +1335,19 @@ static void acer_wmi_notify(u32 value, void *context)
 				return_value.key_num, 1, true))
 			pr_warning("Unknown key number - 0x%x\n",
 				return_value.key_num);
+		if (return_value.device_state) {
+			u16 device_state = return_value.device_state;
+			pr_debug("deivces states: 0x%x\n", device_state);
+			if (has_cap(ACER_CAP_WIRELESS))
+				rfkill_set_sw_state(wireless_rfkill,
+				!(device_state & ACER_WMID3_GDS_WIRELESS));
+			if (has_cap(ACER_CAP_BLUETOOTH))
+				rfkill_set_sw_state(bluetooth_rfkill,
+				!(device_state & ACER_WMID3_GDS_BLUETOOTH));
+			if (has_cap(ACER_CAP_THREEG))
+				rfkill_set_sw_state(threeg_rfkill,
+				!(device_state & ACER_WMID3_GDS_THREEG));
+		}
 		break;
 	default:
 		pr_warning("Unknown function number - %d - %d\n",
-- 
1.6.0.2
