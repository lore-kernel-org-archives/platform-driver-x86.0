From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] hp-wmi: add more definitions for new event_id's
Date: Fri, 15 Mar 2013 17:18:22 +0800
Message-ID: <1363339102-22999-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:57417 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753528Ab3COJS2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 15 Mar 2013 05:18:28 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org

New HP laptops start generating new events, and hp-wmi prints unknown
event_ids for them. This patch also removes these messages

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/hp-wmi.c |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 45cacf7..b9e8c29 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -71,6 +71,14 @@ enum hp_wmi_event_ids {
 	HPWMI_WIRELESS = 5,
 	HPWMI_CPU_BATTERY_THROTTLE = 6,
 	HPWMI_LOCK_SWITCH = 7,
+	HPWMI_LID_SWITCH = 8,
+	HPWMI_SCREEN_ROTATION = 9,
+	HPWMI_COOLSENSE_SYSTEM_MOBILE = 0x0A,
+	HPWMI_COOLSENSE_SYSTEM_HOT = 0x0B,
+	HPWMI_PROXIMITY_SENSOR = 0x0C,
+	HPWMI_BACKLIT_KB_BRIGHTNESS = 0x0D,
+	HPWMI_PEAKSHIFT_PERIOD = 0x0F,
+	HPWMI_BATTERY_CHARGE_PERIOD = 0x10,
 };
 
 struct bios_args {
@@ -537,6 +545,22 @@ static void hp_wmi_notify(u32 value, void *context)
 		break;
 	case HPWMI_LOCK_SWITCH:
 		break;
+	case HPWMI_LID_SWITCH:
+		break;
+	case HPWMI_SCREEN_ROTATION:
+		break;
+	case HPWMI_COOLSENSE_SYSTEM_MOBILE:
+		break;
+	case HPWMI_COOLSENSE_SYSTEM_HOT:
+		break;
+	case HPWMI_PROXIMITY_SENSOR:
+		break;
+	case HPWMI_BACKLIT_KB_BRIGHTNESS:
+		break;
+	case HPWMI_PEAKSHIFT_PERIOD:
+		break;
+	case HPWMI_BATTERY_CHARGE_PERIOD:
+		break;
 	default:
 		pr_info("Unknown event_id - %d - 0x%x\n", event_id, event_data);
 		break;
-- 
1.7.9.5
