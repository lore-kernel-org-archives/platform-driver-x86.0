From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 7/8] asus-wireless: Export ids list
Date: Thu, 26 Jan 2017 10:30:12 -0500
Message-ID: <20170126153013.12753-8-jprvita@endlessm.com>
References: <20170126153013.12753-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:33680 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753168AbdAZPbR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Jan 2017 10:31:17 -0500
In-Reply-To: <20170126153013.12753-1-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-wireless.c | 15 ++++++---------
 drivers/platform/x86/asus-wireless.h | 10 ++++++++++
 2 files changed, 16 insertions(+), 9 deletions(-)
 create mode 100644 drivers/platform/x86/asus-wireless.h

diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
index 5a238fad35fb..fa28613688b4 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -17,6 +17,8 @@
 #include <linux/pci_ids.h>
 #include <linux/leds.h>
 
+#include "asus-wireless.h"
+
 #define ASUS_WIRELESS_LED_STATUS 0x2
 
 struct hswc_params {
@@ -40,12 +42,7 @@ static const struct hswc_params id_params[] = {
 	{ 0x5, 0x4 },
 };
 
-static const struct acpi_device_id device_ids[] = {
-	{"ATK4001", 0},
-	{"ATK4002", 0},
-	{"", 0},
-};
-MODULE_DEVICE_TABLE(acpi, device_ids);
+MODULE_DEVICE_TABLE(acpi, asus_wireless_ids);
 
 static u64 asus_wireless_method(acpi_handle handle, const char *method,
 				int param)
@@ -130,8 +127,8 @@ static int asus_wireless_add(struct acpi_device *adev)
 	adev->driver_data = data;
 
 	hid = acpi_device_hid(adev);
-	for (i = 0; strcmp(device_ids[i].id, ""); i++) {
-		if (!strcmp(device_ids[i].id, hid)) {
+	for (i = 0; strcmp(asus_wireless_ids[i].id, ""); i++) {
+		if (!strcmp(asus_wireless_ids[i].id, hid)) {
 			data->hswc_params = &id_params[i];
 			break;
 		}
@@ -179,7 +176,7 @@ static int asus_wireless_remove(struct acpi_device *adev)
 static struct acpi_driver asus_wireless_driver = {
 	.name = "Asus Wireless Radio Control Driver",
 	.class = "hotkey",
-	.ids = device_ids,
+	.ids = asus_wireless_ids,
 	.ops = {
 		.add = asus_wireless_add,
 		.remove = asus_wireless_remove,
diff --git a/drivers/platform/x86/asus-wireless.h b/drivers/platform/x86/asus-wireless.h
new file mode 100644
index 000000000000..10a345863da6
--- /dev/null
+++ b/drivers/platform/x86/asus-wireless.h
@@ -0,0 +1,10 @@
+#ifndef _ASUS_WIRELESS_H_
+#define _ASUS_WIRELESS_H_
+
+const struct acpi_device_id asus_wireless_ids[] = {
+	{"ATK4001", 0},
+	{"ATK4002", 0},
+	{"", 0},
+};
+
+#endif /* !_ASUS_WIRELESS_H_ */
-- 
2.11.0
