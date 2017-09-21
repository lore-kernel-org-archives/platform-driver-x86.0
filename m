From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 10/12] platform/x86: wmi: destroy on cleanup rather than unregister
Date: Thu, 21 Sep 2017 08:57:15 -0500
Message-ID: <d85f583fb28e3f871d05155d35659b0c19c0ccd6.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

device_create documentation says to cleanup using device_destroy

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index d1e128864d24..84314c0ef9c2 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1223,7 +1223,7 @@ static int acpi_wmi_remove(struct platform_device *device)
 	acpi_remove_address_space_handler(acpi_device->handle,
 				ACPI_ADR_SPACE_EC, &acpi_wmi_ec_space_handler);
 	wmi_free_devices(acpi_device);
-	device_unregister((struct device *)dev_get_drvdata(&device->dev));
+	device_destroy(&wmi_bus_class, MKDEV(0, 0));
 
 	return 0;
 }
@@ -1277,7 +1277,7 @@ static int acpi_wmi_probe(struct platform_device *device)
 	return 0;
 
 err_remove_busdev:
-	device_unregister(wmi_bus_dev);
+	device_destroy(&wmi_bus_class, MKDEV(0, 0));
 
 err_remove_notify_handler:
 	acpi_remove_notify_handler(acpi_device->handle, ACPI_DEVICE_NOTIFY,
-- 
2.14.1
