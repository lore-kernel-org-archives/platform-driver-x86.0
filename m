From: "Darren Hart (VMware)" <dvhart@infradead.org>
Subject: [PATCH] platform/x86: intel-vbtn: Simplify autorelease logic
Date: Fri, 8 Dec 2017 15:07:08 -0800
Message-ID: <eb2e1de12dad4c11454b009075f916c63de8a2a6.1512774279.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:58898 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752631AbdLHXHK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 18:07:10 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens@rwth-aachen.de>, AceLan Kao <acelan.kao@canonical.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The new notify_handler logic determining if autorelease should be used or
not is a bit awkward, and can result in more than one call to
sparse_keymap_report_event for the same event (scancode). The nesting
and long lines also made it difficult to read.

Simplify the logic by eliminating a level of nesting with a goto and
always calculate autorelease and val so we can make a single call to
sparse_keymap_report_event.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
Cc: Stefan Brüns <stefan.bruens@rwth-aachen.de>
Cc: AceLan Kao <acelan.kao@canonical.com>
---
Note: This is based on top of Stefan's v2 patch series for intel-vbtn, currently
      in my review-dvhart branch.

 drivers/platform/x86/intel-vbtn.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 0861efe..297e1ac 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -80,6 +80,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 {
 	struct platform_device *device = context;
 	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
+	unsigned int val = !(event & 1); /* Even=press, Odd=release */
 	const struct key_entry *ke_rel;
 	bool autorelease;
 
@@ -88,20 +89,20 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 			pm_wakeup_hard_event(&device->dev);
 			return;
 		}
-	} else {
-		/* Use the fact press/release come in even/odd pairs */
-		if ((event & 1) && sparse_keymap_report_event(priv->input_dev,
-							      event, 0, false))
-			return;
+		goto out_unknown;
+	}
 
-		ke_rel = sparse_keymap_entry_from_scancode(priv->input_dev,
-							   event | 1);
-		autorelease = !ke_rel || ke_rel->type == KE_IGNORE;
+	/*
+	 * Event press events are autorelease if there is no corresponding odd
+	 * release event, or if the odd event is KE_IGNORE.
+	 */
+	ke_rel = sparse_keymap_entry_from_scancode(priv->input_dev, event | 1);
+	autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
 
-		if (sparse_keymap_report_event(priv->input_dev, event, 1,
-					       autorelease))
-			return;
-	}
+	if (sparse_keymap_report_event(priv->input_dev, event, val, autorelease))
+		return;
+
+out_unknown:
 	dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
 }
 
-- 
2.9.4


-- 
Darren Hart
VMware Open Source Technology Center
