From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: [PATCH v3] dell-rbtn: Ignore ACPI notifications if device is suspended
Date: Fri, 18 Mar 2016 23:44:23 +0100
Message-ID: <1458341063-8753-1-git-send-email-gabriele.mzt@gmail.com>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33314 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753184AbcCRWod (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Mar 2016 18:44:33 -0400
In-Reply-To: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: pali.rohar@gmail.com, Jared_Dominguez@dell.com, platform-driver-x86@vger.kernel.org, rjw@rjwysocki.net, alex.hung@canonical.com, arvidjaar@gmail.com, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

Some BIOSes unconditionally send an ACPI notification to RBTN when the
system is resuming from suspend. This makes dell-rbtn send an input
event to userspace as if a function key was pressed. Prevent this by
ignoring all the notifications received while the device is suspended.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=106031
Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
---
Same as v2 with some comments

 drivers/platform/x86/dell-rbtn.c | 50 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
index 5155278..b144b8c 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -28,6 +28,7 @@ struct rbtn_data {
 	enum rbtn_type type;
 	struct rfkill *rfkill;
 	struct input_dev *input_dev;
+	bool suspended;
 };
 
 
@@ -220,9 +221,49 @@ static const struct acpi_device_id rbtn_ids[] = {
 	{ "", 0 },
 };
 
+#ifdef CONFIG_PM_SLEEP
+static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(void *context)
+{
+	struct rbtn_data *rbtn_data = context;
+
+	rbtn_data->suspended = false;
+}
+
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
+	acpi_status status;
+
+	/*
+	 * Clear the flag only after we received the extra
+	 * ACPI notification.
+	 */
+	status = acpi_os_execute(OSL_NOTIFY_HANDLER,
+			 rbtn_acpi_clear_flag, rbtn_data);
+	if (ACPI_FAILURE(status))
+		rbtn_data->suspended = false;
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resume);
+
 static struct acpi_driver rbtn_driver = {
 	.name = "dell-rbtn",
 	.ids = rbtn_ids,
+	.drv.pm = &rbtn_pm_ops,
 	.ops = {
 		.add = rbtn_add,
 		.remove = rbtn_remove,
@@ -384,6 +425,15 @@ static void rbtn_notify(struct acpi_device *device, u32 event)
 {
 	struct rbtn_data *rbtn_data = device->driver_data;
 
+	/*
+	 * Some BIOSes send autonomously a notification at resume.
+	 * Ignore it to prevent unwanted input events.
+	 */
+	if (rbtn_data->suspended) {
+		dev_dbg(&device->dev, "ACPI notification ignored\n");
+		return;
+	}
+
 	if (event != 0x80) {
 		dev_info(&device->dev, "Received unknown event (0x%x)\n",
 			 event);
-- 
2.8.0.rc3
