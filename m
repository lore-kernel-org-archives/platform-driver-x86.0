From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v4 03/14] platform/x86: dell-wmi: allow 32k return size in the descriptor
Date: Wed,  4 Oct 2017 17:48:29 -0500
Message-ID: <bdb7bcb5afee13aa20ee6a0b39bc4a87e2eb28dc.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:47543 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751120AbdJDWsq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2017 18:48:46 -0400
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
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
index 5973aa20f10e..4807ec4a2e8f 100644
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
@@ -673,7 +673,7 @@ static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
 		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
 			buffer[2]);
 
-	if (buffer[3] != 4096)
+	if (desc_buffer[3] != 4096 && desc_buffer[3] != 32768)
 		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%u)\n",
 			buffer[3]);
 
-- 
2.14.1
