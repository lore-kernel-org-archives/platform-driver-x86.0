From: Keng-Yu Lin <kengyu@canonical.com>
Subject: [PATCH] Revert: "dell-laptop: Toggle the unsupported hardware killswitch"
Date: Mon, 27 Jun 2011 11:19:03 +0100
Message-ID: <1309169943-3786-1-git-send-email-kengyu@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: gmane@colin.guthr.ie
List-Id: platform-driver-x86.vger.kernel.org

This reverts commit a3d77411e8b2ad661958c1fbee65beb476ec6d70,

as it causes a mess in the wireless rfkill status on some models.
It is probably a bad idea to toggle the rfkill for all dell models
without the respect to the claim that it is hardware-controlled.

Signed-off-by: Keng-Yu Lin <kengyu@canonical.com>
---
 drivers/platform/x86/dell-laptop.c |   24 ++----------------------
 1 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index d3841de..04c34f1 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -292,12 +292,9 @@ static int dell_rfkill_set(void *data, bool blocked)
 	dell_send_request(buffer, 17, 11);
 
 	/* If the hardware switch controls this radio, and the hardware
-	   switch is disabled, don't allow changing the software state.
-	   If the hardware switch is reported as not supported, always
-	   fire the SMI to toggle the killswitch. */
+	   switch is disabled, don't allow changing the software state */
 	if ((hwswitch_state & BIT(hwswitch_bit)) &&
-	    !(buffer->output[1] & BIT(16)) &&
-	    (buffer->output[1] & BIT(0))) {
+	    !(buffer->output[1] & BIT(16))) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -403,23 +400,6 @@ static const struct file_operations dell_debugfs_fops = {
 
 static void dell_update_rfkill(struct work_struct *ignored)
 {
-	int status;
-
-	get_buffer();
-	dell_send_request(buffer, 17, 11);
-	status = buffer->output[1];
-	release_buffer();
-
-	/* if hardware rfkill is not supported, set it explicitly */
-	if (!(status & BIT(0))) {
-		if (wifi_rfkill)
-			dell_rfkill_set((void *)1, !((status & BIT(17)) >> 17));
-		if (bluetooth_rfkill)
-			dell_rfkill_set((void *)2, !((status & BIT(18)) >> 18));
-		if (wwan_rfkill)
-			dell_rfkill_set((void *)3, !((status & BIT(19)) >> 19));
-	}
-
 	if (wifi_rfkill)
 		dell_rfkill_query(wifi_rfkill, (void *)1);
 	if (bluetooth_rfkill)
-- 
1.7.4.1
