From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 07/14] platform/x86: wmi: destroy on cleanup rather than unregister
Date: Tue, 26 Sep 2017 13:50:05 -0500
Message-ID: <06ac47a865e3c030b7ff4eb09f90c55f5e0de4bc.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

device_create documentation says to cleanup using device_destroy

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index acbc2b02db3d..7a05843aff19 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1145,7 +1145,7 @@ static int acpi_wmi_remove(struct platform_device *device)
 	acpi_remove_address_space_handler(acpi_device->handle,
 				ACPI_ADR_SPACE_EC, &acpi_wmi_ec_space_handler);
 	wmi_free_devices(acpi_device);
-	device_unregister((struct device *)dev_get_drvdata(&device->dev));
+	device_destroy(&wmi_bus_class, MKDEV(0, 0));
 
 	return 0;
 }
@@ -1199,7 +1199,7 @@ static int acpi_wmi_probe(struct platform_device *device)
 	return 0;
 
 err_remove_busdev:
-	device_unregister(wmi_bus_dev);
+	device_destroy(&wmi_bus_class, MKDEV(0, 0));
 
 err_remove_notify_handler:
 	acpi_remove_notify_handler(acpi_device->handle, ACPI_DEVICE_NOTIFY,
-- 
2.14.1
