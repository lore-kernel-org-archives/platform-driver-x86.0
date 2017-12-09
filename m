From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 1/2] platform/x86: wmi: prefix sysfs files in /sys/bus/wmi with the ACPI device
Date: Fri,  8 Dec 2017 20:34:20 -0600
Message-ID: <1512786861-1014-2-git-send-email-mario.limonciello@dell.com>
References: <1512786861-1014-1-git-send-email-mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:57377 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752914AbdLICeq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 21:34:46 -0500
In-Reply-To: <1512786861-1014-1-git-send-email-mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Mario Limonciello <mario.limonciello@dell.com>

It's possible for the same GUID to show up on as system twice.
This means using solely the GUID for identify the file will not
be sufficient.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 791449a2370f..45d9010aafcf 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1081,7 +1081,8 @@ static int wmi_create_device(struct device *wmi_bus_dev,
 	wblock->dev.dev.bus = &wmi_bus_type;
 	wblock->dev.dev.parent = wmi_bus_dev;
 
-	dev_set_name(&wblock->dev.dev, "%pUL", gblock->guid);
+	dev_set_name(&wblock->dev.dev, "%s-%pUL",
+		     dev_name(&wblock->acpi_device->dev), gblock->guid);
 
 	device_initialize(&wblock->dev.dev);
 
-- 
2.14.1
