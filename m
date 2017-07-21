From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] platform/x86: intel-vbtn: reduce unnecessary messages for normal users
Date: Thu, 20 Jul 2017 20:56:48 -0700
Message-ID: <1500609408-30745-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:44333 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750860AbdGUD46 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Jul 2017 23:56:58 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, rjw@rjwysocki.net

Unsupported events is only useful for developers and does not meaningful
for users. Using dev_dbg makes more sense and reduces noise in kernel
messages.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/intel-vbtn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 61f1063..10f92ac 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -83,7 +83,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	} else if (sparse_keymap_report_event(priv->input_dev, event, 1, true)) {
 		return;
 	}
-	dev_info(&device->dev, "unknown event index 0x%x\n", event);
+	dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
 }
 
 static int intel_vbtn_probe(struct platform_device *device)
-- 
2.7.4
