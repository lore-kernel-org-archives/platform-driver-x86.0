From: Yongxin Liu <yongxin.liu@windriver.com>
Subject: [PATCH] Revert "platform/x86: wmi: Destroy on cleanup rather than unregister"
Date: Fri, 15 Nov 2019 13:27:10 +0800
Message-ID: <20191115052710.46880-1-yongxin.liu@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mario.limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

This reverts commit 7b11e8989618581bc0226ad313264cdc05d48d86.

Consider the following hardware setting.

|-PNP0C14:00
|  |-- device #1
|-PNP0C14:01
|  |-- device #2

When unloading wmi driver module, device #2 will be first unregistered.
But device_destroy() using MKDEV(0, 0) will locate PNP0C14:00 first
and unregister it. This is incorrect. Should use device_unregister() to
unregister the real parent device.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 drivers/platform/x86/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 59e9aa0f9643..e16f660aa117 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1347,7 +1347,7 @@ static int acpi_wmi_remove(struct platform_device *device)
 	acpi_remove_address_space_handler(acpi_device->handle,
 				ACPI_ADR_SPACE_EC, &acpi_wmi_ec_space_handler);
 	wmi_free_devices(acpi_device);
-	device_destroy(&wmi_bus_class, MKDEV(0, 0));
+	device_unregister((struct device *)dev_get_drvdata(&device->dev));
 
 	return 0;
 }
@@ -1401,7 +1401,7 @@ static int acpi_wmi_probe(struct platform_device *device)
 	return 0;
 
 err_remove_busdev:
-	device_destroy(&wmi_bus_class, MKDEV(0, 0));
+	device_unregister(wmi_bus_dev);
 
 err_remove_notify_handler:
 	acpi_remove_notify_handler(acpi_device->handle, ACPI_DEVICE_NOTIFY,
-- 
2.14.4
