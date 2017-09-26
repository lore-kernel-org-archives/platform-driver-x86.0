From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 14/14] platform/x86: dell-wmi-smbios: clean up wmi descriptor check
Date: Tue, 26 Sep 2017 13:50:12 -0500
Message-ID: <4178d2bdfc69c94fe4972fee7b97b08202890e66.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:56583 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S967773AbdIZSu1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2017 14:50:27 -0400
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>

Some cases the wrong type was used for errors and checks can be
done more cleanly.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-wmi-smbios.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi-smbios.c b/drivers/platform/x86/dell-wmi-smbios.c
index 232a9dd482b1..290e9853818b 100644
--- a/drivers/platform/x86/dell-wmi-smbios.c
+++ b/drivers/platform/x86/dell-wmi-smbios.c
@@ -340,16 +340,16 @@ int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev, u32 *version)
 	}
 	desc_buffer = (u32 *)obj->buffer.pointer;
 
-	if (desc_buffer[0] != 0x4C4C4544 && desc_buffer[1] != 0x494D5720)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%*ph)\n",
-			8, desc_buffer);
+	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0)
+		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
+			desc_buffer);
 
 	if (desc_buffer[2] != 0 && desc_buffer[2] != 1)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%d)\n",
+		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
 			desc_buffer[2]);
 
 	if (desc_buffer[3] != 4096)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%d)\n",
+		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%u)\n",
 			desc_buffer[3]);
 
 	*version = desc_buffer[2];
-- 
2.14.1
