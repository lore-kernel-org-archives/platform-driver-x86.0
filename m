From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: [PATCH v4] dell-rbtn: Ignore ACPI notifications if device is suspended
Date: Tue, 24 May 2016 22:53:08 +0200
Message-ID: <1464123188-9589-1-git-send-email-gabriele.mzt@gmail.com>
References: <20160524195726.GM2735@f23x64.localdomain>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33010 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148AbcEXUx3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 May 2016 16:53:29 -0400
In-Reply-To: <20160524195726.GM2735@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: arvidjaar@gmail.com, gabriele.mzt@gmail.com, rjw@rjwysocki.net, Jared_Dominguez@dell.com, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-kernel@vger.kernel.org

Some BIOSes unconditionally send an ACPI notification to RBTN when the
system is resuming from suspend. This makes dell-rbtn send an input
event to userspace as if a function key was pressed. Prevent this by
ignoring all the notifications received while the device is suspended.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=106031
Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
---
 drivers/platform/x86/dell-rbtn.c | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
index 331d63c..dd22fb9 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -28,6 +28,7 @@ struct rbtn_data {
 	enum rbtn_type type;
 	struct rfkill *rfkill;
 	struct input_dev *input_dev;
+	bool suspended;
 };
 
 
@@ -235,9 +236,55 @@ static const struct acpi_device_id rbtn_ids[] = {
 	{ "", 0 },
 };
 
+#ifdef CONFIG_PM_SLEEP
+static void ACPI_SYSTEM_XFACE rbtn_clear_suspended_flag(void *context)
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
+	 * Upon resume, some BIOSes send an ACPI notification thet triggers
+	 * an unwanted input event. In order to ignore it, we use a flag
+	 * that we set at suspend and clear once we have received the extra
+	 * ACPI notification. Since ACPI notifications are delivered
+	 * asynchronously to drivers, we clear the flag from the workqueue
+	 * used to deliver the notifications. This should be enough
+	 * to have the flag cleared only after we received the extra
+	 * notification, if any.
+	 */
+	status = acpi_os_execute(OSL_NOTIFY_HANDLER,
+			 rbtn_clear_suspended_flag, rbtn_data);
+	if (ACPI_FAILURE(status))
+		rbtn_clear_suspended_flag(rbtn_data);
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
@@ -399,6 +446,15 @@ static void rbtn_notify(struct acpi_device *device, u32 event)
 {
 	struct rbtn_data *rbtn_data = device->driver_data;
 
+	/*
+	 * Some BIOSes send a notification at resume.
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
2.8.1
