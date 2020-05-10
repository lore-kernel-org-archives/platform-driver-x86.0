From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/3] platform/x86: asus-wmi: Move asus_wmi_input_init and _exit lower in the file
Date: Sun, 10 May 2020 14:24:30 +0200
Message-ID: <20200510122432.123751-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Move the asus_wmi_input_init() and asus_wmi_input_exit() functions to
below the WMI helpers, so that further patches in this patch-set can use
the WMI helpers inside asus_wmi_input_init() without needing a forward
declaration.

Note this commit makes no functional changes, the moved block of code
is completely unchanged.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 78 ++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index e705ae66c083..25ec821dae21 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -222,45 +222,6 @@ struct asus_wmi {
 	struct asus_wmi_driver *driver;
 };
 
-/* Input **********************************************************************/
-
-static int asus_wmi_input_init(struct asus_wmi *asus)
-{
-	int err;
-
-	asus->inputdev = input_allocate_device();
-	if (!asus->inputdev)
-		return -ENOMEM;
-
-	asus->inputdev->name = asus->driver->input_name;
-	asus->inputdev->phys = asus->driver->input_phys;
-	asus->inputdev->id.bustype = BUS_HOST;
-	asus->inputdev->dev.parent = &asus->platform_device->dev;
-	set_bit(EV_REP, asus->inputdev->evbit);
-
-	err = sparse_keymap_setup(asus->inputdev, asus->driver->keymap, NULL);
-	if (err)
-		goto err_free_dev;
-
-	err = input_register_device(asus->inputdev);
-	if (err)
-		goto err_free_dev;
-
-	return 0;
-
-err_free_dev:
-	input_free_device(asus->inputdev);
-	return err;
-}
-
-static void asus_wmi_input_exit(struct asus_wmi *asus)
-{
-	if (asus->inputdev)
-		input_unregister_device(asus->inputdev);
-
-	asus->inputdev = NULL;
-}
-
 /* WMI ************************************************************************/
 
 static int asus_wmi_evaluate_method3(u32 method_id,
@@ -381,6 +342,45 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
 	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
 }
 
+/* Input **********************************************************************/
+
+static int asus_wmi_input_init(struct asus_wmi *asus)
+{
+	int err;
+
+	asus->inputdev = input_allocate_device();
+	if (!asus->inputdev)
+		return -ENOMEM;
+
+	asus->inputdev->name = asus->driver->input_name;
+	asus->inputdev->phys = asus->driver->input_phys;
+	asus->inputdev->id.bustype = BUS_HOST;
+	asus->inputdev->dev.parent = &asus->platform_device->dev;
+	set_bit(EV_REP, asus->inputdev->evbit);
+
+	err = sparse_keymap_setup(asus->inputdev, asus->driver->keymap, NULL);
+	if (err)
+		goto err_free_dev;
+
+	err = input_register_device(asus->inputdev);
+	if (err)
+		goto err_free_dev;
+
+	return 0;
+
+err_free_dev:
+	input_free_device(asus->inputdev);
+	return err;
+}
+
+static void asus_wmi_input_exit(struct asus_wmi *asus)
+{
+	if (asus->inputdev)
+		input_unregister_device(asus->inputdev);
+
+	asus->inputdev = NULL;
+}
+
 /* Battery ********************************************************************/
 
 /* The battery maximum charging percentage */
-- 
2.26.0
