From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 05/12] dell-laptop: Don't set sw_state from the query callback
Date: Sun, 17 Nov 2013 14:00:20 +0100
Message-ID: <1384693227-5859-6-git-send-email-hdegoede@redhat.com>
References: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:24847 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751520Ab3KQNAl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Nov 2013 08:00:41 -0500
In-Reply-To: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

The query callback should only update the hw_state, see the comment in
net/rfkill/core.c in rfkill_set_block, which is its only caller.

rfkill_set_block will modify the sw_state directly after calling query so
calling set_sw_state is an expensive NOP.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 06f281b..7f47396 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -425,10 +425,15 @@ out:
 	return ret;
 }
 
-static void dell_rfkill_update(struct rfkill *rfkill, int radio, int status)
+static void dell_rfkill_update_sw_state(struct rfkill *rfkill, int radio,
+					int status)
 {
 	rfkill_set_sw_state(rfkill, !!(status & BIT(radio + 16)));
+}
 
+static void dell_rfkill_update_hw_state(struct rfkill *rfkill, int radio,
+					int status)
+{
 	if (hwswitch_state & (BIT(radio - 1)))
 		rfkill_set_hw_state(rfkill, !(status & BIT(16)));
 }
@@ -442,7 +447,7 @@ static void dell_rfkill_query(struct rfkill *rfkill, void *data)
 	status = buffer->output[1];
 	release_buffer();
 
-	dell_rfkill_update(rfkill, (unsigned long)data, status);
+	dell_rfkill_update_hw_state(rfkill, (unsigned long)data, status);
 }
 
 static const struct rfkill_ops dell_rfkill_ops = {
@@ -528,12 +533,18 @@ static void dell_update_rfkill(struct work_struct *ignored)
 	status = buffer->output[1];
 	release_buffer();
 
-	if (wifi_rfkill)
-		dell_rfkill_update(wifi_rfkill, 1, status);
-	if (bluetooth_rfkill)
-		dell_rfkill_update(bluetooth_rfkill, 2, status);
-	if (wwan_rfkill)
-		dell_rfkill_update(wwan_rfkill, 3, status);
+	if (wifi_rfkill) {
+		dell_rfkill_update_hw_state(wifi_rfkill, 1, status);
+		dell_rfkill_update_sw_state(wifi_rfkill, 1, status);
+	}
+	if (bluetooth_rfkill) {
+		dell_rfkill_update_hw_state(bluetooth_rfkill, 2, status);
+		dell_rfkill_update_sw_state(bluetooth_rfkill, 2, status);
+	}
+	if (wwan_rfkill) {
+		dell_rfkill_update_hw_state(wwan_rfkill, 3, status);
+		dell_rfkill_update_sw_state(wwan_rfkill, 3, status);
+	}
 }
 static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
 
-- 
1.8.4.2
