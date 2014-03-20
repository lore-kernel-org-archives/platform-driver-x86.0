From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 11/11] sony-laptop: remove useless sony-laptop versioning
Date: Fri, 21 Mar 2014 08:01:22 +0900
Message-ID: <1395356482-7446-12-git-send-email-malattia@linux.it>
References: <1395356482-7446-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:42148 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759643AbaCTXJN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Mar 2014 19:09:13 -0400
In-Reply-To: <1395356482-7446-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index b0a311f..6612c4a 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -79,8 +79,6 @@ do {						\
 		pr_warn(fmt, ##__VA_ARGS__);	\
 } while (0)
 
-#define SONY_LAPTOP_DRIVER_VERSION	"0.6"
-
 #define SONY_NC_CLASS		"sony-nc"
 #define SONY_NC_HID		"SNY5001"
 #define SONY_NC_DRIVER_NAME	"Sony Notebook Control Driver"
@@ -92,7 +90,6 @@ do {						\
 MODULE_AUTHOR("Stelian Pop, Mattia Dongili");
 MODULE_DESCRIPTION("Sony laptop extras driver (SPIC and SNC ACPI device)");
 MODULE_LICENSE("GPL");
-MODULE_VERSION(SONY_LAPTOP_DRIVER_VERSION);
 
 static int debug;
 module_param(debug, int, 0);
@@ -4240,8 +4237,6 @@ static int sony_nc_add(struct acpi_device *device)
 	int result = 0;
 	struct sony_nc_value *item;
 
-	pr_info("%s v%s\n", SONY_NC_DRIVER_NAME, SONY_LAPTOP_DRIVER_VERSION);
-
 	sony_nc_acpi_device = device;
 	strcpy(acpi_device_class(device), "sony/hotkey");
 
@@ -4330,6 +4325,7 @@ static int sony_nc_add(struct acpi_device *device)
 		}
 	}
 
+	pr_info("SNC setup done.\n");
 	return 0;
 
 out_sysfs:
@@ -5768,8 +5764,6 @@ static int sony_pic_add(struct acpi_device *device)
 	struct sony_pic_ioport *io, *tmp_io;
 	struct sony_pic_irq *irq, *tmp_irq;
 
-	pr_info("%s v%s\n", SONY_PIC_DRIVER_NAME, SONY_LAPTOP_DRIVER_VERSION);
-
 	spic_dev.acpi_dev = device;
 	strcpy(acpi_device_class(device), "sony/hotkey");
 	sony_pic_detect_device_type(&spic_dev);
@@ -5869,6 +5863,7 @@ static int sony_pic_add(struct acpi_device *device)
 	if (result)
 		goto err_remove_pf;
 
+	pr_info("SPIC setup done.\n");
 	return 0;
 
 err_remove_pf:
-- 
1.9.0
