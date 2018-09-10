From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 1/2] platform/x86: dell-smbios-wmi: Correct a memory leak
Date: Mon, 10 Sep 2018 13:01:52 -0500
Message-ID: <1536602513-13861-1-git-send-email-mario.limonciello@dell.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

ACPI buffers were being allocated but never freed.

Reported-by: Pinzhen Xu <pinzhen.xu@intel.com>
Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/dell-smbios-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index 88afe56..cf2229e 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -78,6 +78,7 @@ static int run_smbios_call(struct wmi_device *wdev)
 	dev_dbg(&wdev->dev, "result: [%08x,%08x,%08x,%08x]\n",
 		priv->buf->std.output[0], priv->buf->std.output[1],
 		priv->buf->std.output[2], priv->buf->std.output[3]);
+	kfree(output.pointer);
 
 	return 0;
 }
-- 
2.7.4
