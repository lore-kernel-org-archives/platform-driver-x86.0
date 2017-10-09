From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v6 04/14] platform/x86: dell-wmi: allow 32k return size in the descriptor
Date: Mon,  9 Oct 2017 17:51:42 -0500
Message-ID: <099f11c2e1b9675ccb35b2c04e2855a66a455b49.1507589249.git.mario.limonciello@dell.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:32812 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755071AbdJIWv5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2017 18:51:57 -0400
In-Reply-To: <cover.1507589249.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507589249.git.mario.limonciello@dell.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>

Some platforms this year will be adopting 32k WMI buffer, so don't
complain when encountering those.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index ece2fe341f01..c8c7f4f9326c 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -624,7 +624,7 @@ static void dell_wmi_input_destroy(struct wmi_device *wdev)
  * Vendor Signature          0       4    "DELL"
  * Object Signature          4       4    " WMI"
  * WMI Interface Version     8       4    <version>
- * WMI buffer length        12       4    4096
+ * WMI buffer length        12       4    4096 or 32768
  */
 static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
 {
@@ -674,7 +674,7 @@ static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
 		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
 			buffer[2]);
 
-	if (buffer[3] != 4096)
+	if (desc_buffer[3] != 4096 && desc_buffer[3] != 32768)
 		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%u)\n",
 			buffer[3]);
 
-- 
2.14.1
