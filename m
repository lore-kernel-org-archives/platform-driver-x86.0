From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] platform/x86: intel-vbtn: Move detect_tablet_mode() to higher in the file
Date: Sun, 10 May 2020 14:20:46 +0200
Message-ID: <20200510122047.123613-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This is a preparation patch for calling detect_tablet_mode() from
intel_vbtn_input_setup() without needing a forward declaration.

Note this commit makes no functional changes, the moved block of code
is completely unchanged.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 36 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 4efc70b693a7..29984154f8e4 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -60,6 +60,24 @@ struct intel_vbtn_priv {
 	bool wakeup_mode;
 };
 
+static void detect_tablet_mode(struct platform_device *device)
+{
+	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
+	acpi_handle handle = ACPI_HANDLE(&device->dev);
+	unsigned long long vgbs;
+	acpi_status status;
+	int m;
+
+	status = acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
+	if (ACPI_FAILURE(status))
+		return;
+
+	m = !(vgbs & TABLET_MODE_FLAG);
+	input_report_switch(priv->input_dev, SW_TABLET_MODE, m);
+	m = (vgbs & DOCK_MODE_FLAG) ? 1 : 0;
+	input_report_switch(priv->input_dev, SW_DOCK, m);
+}
+
 static int intel_vbtn_input_setup(struct platform_device *device)
 {
 	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
@@ -138,24 +156,6 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
 }
 
-static void detect_tablet_mode(struct platform_device *device)
-{
-	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
-	acpi_handle handle = ACPI_HANDLE(&device->dev);
-	unsigned long long vgbs;
-	acpi_status status;
-	int m;
-
-	status = acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
-	if (ACPI_FAILURE(status))
-		return;
-
-	m = !(vgbs & TABLET_MODE_FLAG);
-	input_report_switch(priv->input_dev, SW_TABLET_MODE, m);
-	m = (vgbs & DOCK_MODE_FLAG) ? 1 : 0;
-	input_report_switch(priv->input_dev, SW_DOCK, m);
-}
-
 static bool intel_vbtn_has_buttons(acpi_handle handle)
 {
 	acpi_status status;
-- 
2.26.0
