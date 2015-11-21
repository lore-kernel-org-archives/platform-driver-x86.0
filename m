From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: [PATCH] dell-rbtn: Ignore ACPI notifications if device is suspended
Date: Sat, 21 Nov 2015 15:16:15 +0100
Message-ID: <1448115375-7315-1-git-send-email-gabriele.mzt@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37723 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760260AbbKUOQc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 Nov 2015 09:16:32 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, pali.rohar@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

Some BIOSes unconditionally send an ACPI notification to RBTN when the
system is resuming from suspend. This makes dell-rbtn send an input
event to userspace as if a function key was pressed. Prevent this by
ignoring all the notifications received while the device is suspended.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=106031
Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
---
 drivers/platform/x86/dell-rbtn.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
index cd410e3..1d64b72 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -28,6 +28,7 @@ struct rbtn_data {
 	enum rbtn_type type;
 	struct rfkill *rfkill;
 	struct input_dev *input_dev;
+	bool suspended;
 };
 
 
@@ -220,9 +221,33 @@ static const struct acpi_device_id rbtn_ids[] = {
 	{ "", 0 },
 };
 
+#ifdef CONFIG_PM_SLEEP
+static int rbtn_suspend(struct device *dev)
+{
+	struct acpi_device *device = to_acpi_device(dev);
+	struct rbtn_data *rbtn_data = acpi_driver_data(device);
+
+	rbtn_data->suspended = true;
+
+	return 0;
+}
+
+static int rbtn_resume(struct device *dev)
+{
+	struct acpi_device *device = to_acpi_device(dev);
+	struct rbtn_data *rbtn_data = acpi_driver_data(device);
+
+	rbtn_data->suspended = false;
+
+	return 0;
+}
+#endif
+static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resume);
+
 static struct acpi_driver rbtn_driver = {
 	.name = "dell-rbtn",
 	.ids = rbtn_ids,
+	.drv.pm = &rbtn_pm_ops,
 	.ops = {
 		.add = rbtn_add,
 		.remove = rbtn_remove,
@@ -384,6 +409,9 @@ static void rbtn_notify(struct acpi_device *device, u32 event)
 {
 	struct rbtn_data *rbtn_data = device->driver_data;
 
+	if (rbtn_data->suspended)
+		return;
+
 	if (event != 0x80) {
 		dev_info(&device->dev, "Received unknown event (0x%x)\n",
 			 event);
-- 
2.6.2
