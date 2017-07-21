From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] platform/x86: intel-hid: reduce unnecessary messages for normal users
Date: Thu, 20 Jul 2017 20:58:08 -0700
Message-ID: <1500609488-30813-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:44399 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755028AbdGUD6M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Jul 2017 23:58:12 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, rjw@rjwysocki.net

Unsupported events is only useful for developers and does not meaningful
for users. Using dev_dbg makes more sense and reduces noise in kernel
messages.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/intel-hid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index 8519e0f..4f70b82 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -219,7 +219,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	if (event != 0xc0) {
 		if (!priv->array ||
 		    !sparse_keymap_report_event(priv->array, event, 1, true))
-			dev_info(&device->dev, "unknown event 0x%x\n", event);
+			dev_dbg(&device->dev, "unknown event 0x%x\n", event);
 		return;
 	}
 
@@ -230,7 +230,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	}
 
 	if (!sparse_keymap_report_event(priv->input_dev, ev_index, 1, true))
-		dev_info(&device->dev, "unknown event index 0x%llx\n",
+		dev_dbg(&device->dev, "unknown event index 0x%llx\n",
 			 ev_index);
 }
 
-- 
2.7.4
