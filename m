From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 1/2] platform/x86: dell-wmi-descriptor: check if memory was allocated
Date: Thu,  9 Nov 2017 11:49:09 -0600
Message-ID: <f881e6211efa9cec49c29d324cb1c8e54f184bb4.1510246939.git.mario.limonciello@dell.com>
References: <cover.1510246939.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa5.dell-outbound.iphmx.com ([68.232.153.95]:52654 "EHLO
        esa5.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751132AbdKIRtT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2017 12:49:19 -0500
In-Reply-To: <cover.1510246939.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1510246939.git.mario.limonciello@dell.com>
References: <cover.1510246939.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>

devm_kzalloc will return NULL pointer if no memory was allocated.
This should be checked.  This problem also existed when the driver
was dell-wmi.c.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-wmi-descriptor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi-descriptor.c b/drivers/platform/x86/dell-wmi-descriptor.c
index 3204c408e261..28ef5f37cfbf 100644
--- a/drivers/platform/x86/dell-wmi-descriptor.c
+++ b/drivers/platform/x86/dell-wmi-descriptor.c
@@ -121,6 +121,11 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
 	priv = devm_kzalloc(&wdev->dev, sizeof(struct descriptor_priv),
 	GFP_KERNEL);
 
+	if (!priv) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
 	priv->interface_version = buffer[2];
 	priv->size = buffer[3];
 	ret = 0;
-- 
2.14.1
