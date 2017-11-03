From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 1/2] platform/x86: dell-wmi-descriptor: check if memory was allocated
Date: Fri,  3 Nov 2017 11:27:21 -0500
Message-ID: <cf25805c3f247ca5c710ad9971dbc7a50e4c872c.1509725778.git.mario.limonciello@dell.com>
References: <cover.1509725778.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1509725778.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1509725778.git.mario.limonciello@dell.com>
References: <cover.1509725778.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

devm_kzalloc will return NULL pointer if no memory was allocated.
This should be checked.  This problem also existed when the driver
was dell-wmi.c.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
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
