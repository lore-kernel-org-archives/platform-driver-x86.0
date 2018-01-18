From: Marco Martin <notmart@gmail.com>
Subject: [PATCH] Support tablet mode switch for Dell laptops
Date: Thu, 18 Jan 2018 14:59:50 +0100
Message-ID: <1516283990-3665-1-git-send-email-notmart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:38483 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756463AbeARN7z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Jan 2018 08:59:55 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, bhush94@gmail.com, platform-driver-x86@vger.kernel.org, Marco Martin <notmart@gmail.com>

Dell laptops send events to intel-vbtn.c
0xCC when the laptop enters in tablet mode and
0xCD when the laptop goes out of it

This has been confirmed working on a Dell Inspiron 13-7352
and an Inspiron 13-7000

I'm not sure intel-vbtn is the right place for it, as it
should be dell-specific, but this is the only device driver
where those events arrive at all
also, it would need a way to query the initial state of the switch

CC:platform-driver-x86@vger.kernel.org
CC:Matthew Garrett <mjg59@srcf.ucam.org>
CC:"Pali Rohár" <pali.rohar@gmail.com>
CC:Darren Hart <dvhart@infradead.org>
CC:Andy Shevchenko <andy@infradead.org>

Signed-off-by: Marco Martin <notmart@gmail.com>
---
 drivers/platform/x86/intel-vbtn.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 146d02f..1fa63e8 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -61,6 +61,10 @@ static int intel_vbtn_input_setup(struct platform_device *device)
 	priv->input_dev->name = "Intel Virtual Button driver";
 	priv->input_dev->id.bustype = BUS_HOST;
 
+	input_set_capability(priv->input_dev, EV_SW, SW_TABLET_MODE);
+	/*TODO: query initial state (and if the switch is present*/
+	input_report_switch(priv->input_dev, SW_TABLET_MODE, 0);
+
 	ret = input_register_device(priv->input_dev);
 	if (ret)
 		goto err_free_device;
@@ -84,7 +88,13 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	struct platform_device *device = context;
 	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
 
-	if (!sparse_keymap_report_event(priv->input_dev, event, 1, true))
+	if (event == 0xCC) {
+		input_report_switch(priv->input_dev, SW_TABLET_MODE, 1);
+		input_sync(priv->input_dev);
+	} else if (event == 0xCD) {
+		input_report_switch(priv->input_dev, SW_TABLET_MODE, 0);
+		input_sync(priv->input_dev);
+	} else if (!sparse_keymap_report_event(priv->input_dev, event, 1, true))
 		dev_info(&device->dev, "unknown event index 0x%x\n",
 			 event);
 }
-- 
2.7.4
