From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 04/10] dell-laptop: Only get status from BIOS once when updating
Date: Sat, 28 Sep 2013 21:26:33 +0200
Message-ID: <1380396399-3889-5-git-send-email-hdegoede@redhat.com>
References: <1380396399-3889-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:19922 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754984Ab3I1T0u (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 Sep 2013 15:26:50 -0400
In-Reply-To: <1380396399-3889-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 48fabf6..06f281b 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -425,21 +425,24 @@ out:
 	return ret;
 }
 
+static void dell_rfkill_update(struct rfkill *rfkill, int radio, int status)
+{
+	rfkill_set_sw_state(rfkill, !!(status & BIT(radio + 16)));
+
+	if (hwswitch_state & (BIT(radio - 1)))
+		rfkill_set_hw_state(rfkill, !(status & BIT(16)));
+}
+
 static void dell_rfkill_query(struct rfkill *rfkill, void *data)
 {
 	int status;
-	int bit = (unsigned long)data + 16;
-	int hwswitch_bit = (unsigned long)data - 1;
 
 	get_buffer();
 	dell_send_request(buffer, 17, 11);
 	status = buffer->output[1];
 	release_buffer();
 
-	rfkill_set_sw_state(rfkill, !!(status & BIT(bit)));
-
-	if (hwswitch_state & (BIT(hwswitch_bit)))
-		rfkill_set_hw_state(rfkill, !(status & BIT(16)));
+	dell_rfkill_update(rfkill, (unsigned long)data, status);
 }
 
 static const struct rfkill_ops dell_rfkill_ops = {
@@ -518,12 +521,19 @@ static const struct file_operations dell_debugfs_fops = {
 
 static void dell_update_rfkill(struct work_struct *ignored)
 {
+	int status;
+
+	get_buffer();
+	dell_send_request(buffer, 17, 11);
+	status = buffer->output[1];
+	release_buffer();
+
 	if (wifi_rfkill)
-		dell_rfkill_query(wifi_rfkill, (void *)1);
+		dell_rfkill_update(wifi_rfkill, 1, status);
 	if (bluetooth_rfkill)
-		dell_rfkill_query(bluetooth_rfkill, (void *)2);
+		dell_rfkill_update(bluetooth_rfkill, 2, status);
 	if (wwan_rfkill)
-		dell_rfkill_query(wwan_rfkill, (void *)3);
+		dell_rfkill_update(wwan_rfkill, 3, status);
 }
 static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
 
-- 
1.8.3.1
