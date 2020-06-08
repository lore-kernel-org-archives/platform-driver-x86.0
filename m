From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 108/175] platform/x86: intel-vbtn: Use acpi_evaluate_integer()
Date: Mon,  8 Jun 2020 19:17:41 -0400
Message-ID: <20200608231848.3366970-108-sashal@kernel.org>
References: <20200608231848.3366970-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200608231848.3366970-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 18937875a231d831c309716d6d8fc358f8381881 ]

Use acpi_evaluate_integer() instead of open-coding it.

This is a preparation patch for adding a intel_vbtn_has_switches()
helper function.

Fixes: de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode switch on 2-in-1's")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel-vbtn.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index b74932307d69..3b3789bb8ec5 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -118,28 +118,21 @@ static void detect_tablet_mode(struct platform_device *device)
 	const char *chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
 	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
 	acpi_handle handle = ACPI_HANDLE(&device->dev);
-	struct acpi_buffer vgbs_output = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *obj;
+	unsigned long long vgbs;
 	acpi_status status;
 	int m;
 
 	if (!(chassis_type && strcmp(chassis_type, "31") == 0))
-		goto out;
+		return;
 
-	status = acpi_evaluate_object(handle, "VGBS", NULL, &vgbs_output);
+	status = acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
 	if (ACPI_FAILURE(status))
-		goto out;
-
-	obj = vgbs_output.pointer;
-	if (!(obj && obj->type == ACPI_TYPE_INTEGER))
-		goto out;
+		return;
 
-	m = !(obj->integer.value & TABLET_MODE_FLAG);
+	m = !(vgbs & TABLET_MODE_FLAG);
 	input_report_switch(priv->input_dev, SW_TABLET_MODE, m);
-	m = (obj->integer.value & DOCK_MODE_FLAG) ? 1 : 0;
+	m = (vgbs & DOCK_MODE_FLAG) ? 1 : 0;
 	input_report_switch(priv->input_dev, SW_DOCK, m);
-out:
-	kfree(vgbs_output.pointer);
 }
 
 static int intel_vbtn_probe(struct platform_device *device)
-- 
2.25.1
