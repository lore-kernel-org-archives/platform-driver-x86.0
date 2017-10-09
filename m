From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v6 01/14] platform/x86: wmi: Add new method wmidev_evaluate_method
Date: Mon,  9 Oct 2017 17:51:39 -0500
Message-ID: <ab2960ef1d0aa5b7e5b6ad5a827a87262d6a06cf.1507589249.git.mario.limonciello@dell.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507589249.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507589249.git.mario.limonciello@dell.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Drivers properly using the wmibus can pass their wmi_device
pointer rather than the GUID back to the WMI bus to evaluate
the proper methods.

Any "new" drivers added that use the WMI bus should use this
rather than the old wmi_evaluate_method that would take the
GUID.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/wmi.c | 28 ++++++++++++++++++++++++----
 include/linux/wmi.h        |  6 ++++++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 7a05843aff19..4d73a87c2ddf 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -200,6 +200,28 @@ static acpi_status wmi_method_enable(struct wmi_block *wblock, int enable)
  */
 acpi_status wmi_evaluate_method(const char *guid_string, u8 instance,
 u32 method_id, const struct acpi_buffer *in, struct acpi_buffer *out)
+{
+	struct wmi_block *wblock = NULL;
+
+	if (!find_guid(guid_string, &wblock))
+		return AE_ERROR;
+	return wmidev_evaluate_method(&wblock->dev, instance, method_id,
+				      in, out);
+}
+EXPORT_SYMBOL_GPL(wmi_evaluate_method);
+
+/**
+ * wmidev_evaluate_method - Evaluate a WMI method
+ * @wdev: A wmi bus device from a driver
+ * @instance: Instance index
+ * @method_id: Method ID to call
+ * &in: Buffer containing input for the method call
+ * &out: Empty buffer to return the method results
+ *
+ * Call an ACPI-WMI method
+ */
+acpi_status wmidev_evaluate_method(struct wmi_device *wdev, u8 instance,
+	u32 method_id, const struct acpi_buffer *in, struct acpi_buffer *out)
 {
 	struct guid_block *block = NULL;
 	struct wmi_block *wblock = NULL;
@@ -209,9 +231,7 @@ u32 method_id, const struct acpi_buffer *in, struct acpi_buffer *out)
 	union acpi_object params[3];
 	char method[5] = "WM";
 
-	if (!find_guid(guid_string, &wblock))
-		return AE_ERROR;
-
+	wblock = container_of(wdev, struct wmi_block, dev);
 	block = &wblock->gblock;
 	handle = wblock->acpi_device->handle;
 
@@ -246,7 +266,7 @@ u32 method_id, const struct acpi_buffer *in, struct acpi_buffer *out)
 
 	return status;
 }
-EXPORT_SYMBOL_GPL(wmi_evaluate_method);
+EXPORT_SYMBOL_GPL(wmidev_evaluate_method);
 
 static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
 				 struct acpi_buffer *out)
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index cd0d7734dc49..2cd10c3b89e9 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -26,6 +26,12 @@ struct wmi_device {
 	bool setable;
 };
 
+/* evaluate the ACPI method associated with this device */
+extern acpi_status wmidev_evaluate_method(struct wmi_device *wdev,
+					  u8 instance, u32 method_id,
+					  const struct acpi_buffer *in,
+					  struct acpi_buffer *out);
+
 /* Caller must kfree the result. */
 extern union acpi_object *wmidev_block_query(struct wmi_device *wdev,
 					     u8 instance);
-- 
2.14.1
