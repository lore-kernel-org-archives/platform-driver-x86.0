From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH 2/5] ideapad: change parameter of ideapad_sync_rfk_state
Date: Tue,  6 Sep 2011 02:32:01 +0800
Message-ID: <1315247521-8975-1-git-send-email-ike.pan@canonical.com>
References: <1315247467-8812-1-git-send-email-ike.pan@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:39943 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753441Ab1IEScD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 5 Sep 2011 14:32:03 -0400
In-Reply-To: <1315247467-8812-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>

This could save us a local variable.

Signed-off-by: Ike Panhc <ike.pan@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 0a1ceaa..ab3add3 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -284,9 +284,8 @@ static struct rfkill_ops ideapad_rfk_ops = {
 	.set_block = ideapad_rfk_set,
 };
 
-static void ideapad_sync_rfk_state(struct acpi_device *adevice)
+static void ideapad_sync_rfk_state(struct ideapad_private *priv)
 {
-	struct ideapad_private *priv = dev_get_drvdata(&adevice->dev);
 	unsigned long hw_blocked;
 	int i;
 
@@ -577,7 +576,7 @@ static int __devinit ideapad_acpi_add(struct acpi_device *adevice)
 		else
 			priv->rfk[i] = NULL;
 	}
-	ideapad_sync_rfk_state(adevice);
+	ideapad_sync_rfk_state(priv);
 
 	if (!acpi_video_backlight_support()) {
 		ret = ideapad_backlight_init(priv);
@@ -630,7 +629,7 @@ static void ideapad_acpi_notify(struct acpi_device *adevice, u32 event)
 		if (test_bit(vpc_bit, &vpc1)) {
 			switch (vpc_bit) {
 			case 9:
-				ideapad_sync_rfk_state(adevice);
+				ideapad_sync_rfk_state(priv);
 				break;
 			case 4:
 				ideapad_backlight_notify_brightness(priv);
-- 
1.7.5.4
