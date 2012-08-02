From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Subject: [PATCH] classmate-laptop: always call input_sync() after input_report_switch()
Date: Thu,  2 Aug 2012 19:50:21 +0200
Message-ID: <1343929821-18054-1-git-send-email-clopez@igalia.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp3.mundo-r.com ([212.51.32.191]:8512 "EHLO smtp4.mundo-r.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753302Ab2HBRuu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Aug 2012 13:50:50 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Daniel Oliveira Nascimento <don@syst.com.br>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Due to commit cdda911c34006f1089f3c87b1a1f31ab3a4722f2 evdev only
becomes readable when the buffer contains an EV_SYN/SYN_REPORT event.

So in order to read the tablet sensor data as it happens we need to
ensure that we always call input_sync() after input_report_switch()

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 drivers/platform/x86/classmate-laptop.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
index 2ca7dd1..0667aa9 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -723,8 +723,10 @@ static void cmpc_tablet_handler(struct acpi_device *dev, u32 event)
 	struct input_dev *inputdev = dev_get_drvdata(&dev->dev);
 
 	if (event == 0x81) {
-		if (ACPI_SUCCESS(cmpc_get_tablet(dev->handle, &val)))
+		if (ACPI_SUCCESS(cmpc_get_tablet(dev->handle, &val))) {
 			input_report_switch(inputdev, SW_TABLET_MODE, !val);
+			input_sync(inputdev);
+		}
 	}
 }
 
@@ -737,8 +739,10 @@ static void cmpc_tablet_idev_init(struct input_dev *inputdev)
 	set_bit(SW_TABLET_MODE, inputdev->swbit);
 
 	acpi = to_acpi_device(inputdev->dev.parent);
-	if (ACPI_SUCCESS(cmpc_get_tablet(acpi->handle, &val)))
+	if (ACPI_SUCCESS(cmpc_get_tablet(acpi->handle, &val))) {
 		input_report_switch(inputdev, SW_TABLET_MODE, !val);
+		input_sync(inputdev);
+	}
 }
 
 static int cmpc_tablet_add(struct acpi_device *acpi)
@@ -757,8 +761,10 @@ static int cmpc_tablet_resume(struct device *dev)
 	struct input_dev *inputdev = dev_get_drvdata(dev);
 
 	unsigned long long val = 0;
-	if (ACPI_SUCCESS(cmpc_get_tablet(to_acpi_device(dev)->handle, &val)))
+	if (ACPI_SUCCESS(cmpc_get_tablet(to_acpi_device(dev)->handle, &val))) {
 		input_report_switch(inputdev, SW_TABLET_MODE, !val);
+		input_sync(inputdev);
+	}
 	return 0;
 }
 
-- 
1.7.10.4
