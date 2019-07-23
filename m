From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: acer-wmi: Switch to acpi_dev_get_first_match_dev()
Date: Tue, 23 Jul 2019 23:34:11 +0300
Message-ID: <20190723203411.71448-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Chun-Yi Lee <jlee@suse.com>
List-Id: platform-driver-x86.vger.kernel.org

The acpi_dev_get_first_match_dev() helper will find and return
an ACPI device pointer of the first registered device in the system
by its HID.

Use it instead of open coded variant.

Cc: Chun-Yi Lee <jlee@suse.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
- Chun-Yi, please, test it if possible
 drivers/platform/x86/acer-wmi.c | 49 +++++----------------------------
 1 file changed, 7 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 62b54e137231..60c18f21588d 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1881,52 +1881,17 @@ static int __init acer_wmi_enable_rf_button(void)
 	return status;
 }
 
-#define ACER_WMID_ACCEL_HID	"BST0001"
-
-static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
-						void *ctx, void **retval)
-{
-	struct acpi_device *dev;
-
-	if (!strcmp(ctx, "SENR")) {
-		if (acpi_bus_get_device(ah, &dev))
-			return AE_OK;
-		if (strcmp(ACER_WMID_ACCEL_HID, acpi_device_hid(dev)))
-			return AE_OK;
-	} else
-		return AE_OK;
-
-	*(acpi_handle *)retval = ah;
-
-	return AE_CTRL_TERMINATE;
-}
-
-static int __init acer_wmi_get_handle(const char *name, const char *prop,
-					acpi_handle *ah)
-{
-	acpi_status status;
-	acpi_handle handle;
-
-	BUG_ON(!name || !ah);
-
-	handle = NULL;
-	status = acpi_get_devices(prop, acer_wmi_get_handle_cb,
-					(void *)name, &handle);
-	if (ACPI_SUCCESS(status) && handle) {
-		*ah = handle;
-		return 0;
-	} else {
-		return -ENODEV;
-	}
-}
-
 static int __init acer_wmi_accel_setup(void)
 {
+	struct acpi_device *adev;
 	int err;
 
-	err = acer_wmi_get_handle("SENR", ACER_WMID_ACCEL_HID, &gsensor_handle);
-	if (err)
-		return err;
+	adev = acpi_dev_get_first_match_dev("BST0001", NULL, -1);
+	if (!adev)
+		return -ENODEV;
+
+	gsensor_handle = acpi_device_handle(adev);
+	acpi_dev_put(adev);
 
 	interface->capability |= ACER_CAP_ACCEL;
 
-- 
2.20.1
