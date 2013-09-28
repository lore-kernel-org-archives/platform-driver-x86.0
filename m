From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 08/10] dell-laptop: Sync current block state to BIOS on hw switch change
Date: Sat, 28 Sep 2013 21:26:37 +0200
Message-ID: <1380396399-3889-9-git-send-email-hdegoede@redhat.com>
References: <1380396399-3889-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59906 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755005Ab3I1T0z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 Sep 2013 15:26:55 -0400
In-Reply-To: <1380396399-3889-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>

This is necessary for 3 reasons:
1) To apply sw_state changes made while hw-blocked
2) To set all the blocked bits for hw-switch controlled radios to 1 when the
   switch gets changed to off, this is necessary on some models to actually
   turn the radio status LEDs off.
3) On some models non hw-switch controlled radios will have their block bit
   cleared (potentially undoing a soft-block) on hw-switch toggle, this
   restores the sw-block in this case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 834f499..7f59624 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -422,10 +422,16 @@ out:
 	return 0;
 }
 
+/* Must be called with the buffer held */
 static void dell_rfkill_update_sw_state(struct rfkill *rfkill, int radio,
 					int status)
 {
-	if (!(status & BIT(0))) {
+	if (status & BIT(0)) {
+		/* Has hw-switch, sync sw_state to BIOS */
+		int block = rfkill_blocked(rfkill);
+		buffer->input[0] = (1 | (radio << 8) | (block << 16));
+		dell_send_request(buffer, 17, 11);
+	} else {
 		/* No hw-switch, sync BIOS state to sw_state */
 		rfkill_set_sw_state(rfkill, !!(status & BIT(radio + 16)));
 	}
@@ -445,9 +451,10 @@ static void dell_rfkill_query(struct rfkill *rfkill, void *data)
 	get_buffer();
 	dell_send_request(buffer, 17, 11);
 	status = buffer->output[1];
-	release_buffer();
 
 	dell_rfkill_update_hw_state(rfkill, (unsigned long)data, status);
+
+	release_buffer();
 }
 
 static const struct rfkill_ops dell_rfkill_ops = {
@@ -531,7 +538,6 @@ static void dell_update_rfkill(struct work_struct *ignored)
 	get_buffer();
 	dell_send_request(buffer, 17, 11);
 	status = buffer->output[1];
-	release_buffer();
 
 	if (wifi_rfkill) {
 		dell_rfkill_update_hw_state(wifi_rfkill, 1, status);
@@ -545,6 +551,8 @@ static void dell_update_rfkill(struct work_struct *ignored)
 		dell_rfkill_update_hw_state(wwan_rfkill, 3, status);
 		dell_rfkill_update_sw_state(wwan_rfkill, 3, status);
 	}
+
+	release_buffer();
 }
 static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
 
-- 
1.8.3.1
