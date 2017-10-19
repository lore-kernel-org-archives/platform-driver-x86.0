From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v10 03/15] platform/x86: dell-wmi: clean up wmi descriptor check
Date: Thu, 19 Oct 2017 12:50:06 -0500
Message-ID: <4971fd99a4583e92029622ede71276168f0d8e43.1508434513.git.mario.limonciello@dell.com>
References: <cover.1508434513.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90]:50577 "EHLO
        esa1.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752124AbdJSRuX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Oct 2017 13:50:23 -0400
In-Reply-To: <cover.1508434513.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1508434513.git.mario.limonciello@dell.com>
References: <cover.1508434513.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>

Some cases the wrong type was used for errors and checks can be
done more cleanly.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Edward O'Callaghan <quasisec@google.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/platform/x86/dell-wmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 2cfaaa8faf0a..b2bd396acac5 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -663,16 +663,16 @@ static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
 
 	buffer = (u32 *)obj->buffer.pointer;
 
-	if (buffer[0] != 0x4C4C4544 && buffer[1] != 0x494D5720) {
-		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%*ph)\n",
-			8, buffer);
+	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
+		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
+			buffer);
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (buffer[2] != 0 && buffer[2] != 1)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%d)\n",
-			buffer[2]);
+		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)\n",
+			(unsigned long) buffer[2]);
 
 	if (buffer[3] != 4096)
 		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%d)\n",
-- 
2.14.1
