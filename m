From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/7] toshiba_acpi: Add System Configuration Interface
Date: Tue, 25 Mar 2014 20:38:29 -0600
Message-ID: <1395801515-2333-2-git-send-email-coproscefalo@gmail.com>
References: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:58874 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314AbaCZCjH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Mar 2014 22:39:07 -0400
Received: by mail-oa0-f49.google.com with SMTP id h16so1736741oag.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2014 19:39:07 -0700 (PDT)
In-Reply-To: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

SCI stands for System Configuration Interface,
which aim is to conceal differences in hardware
between different models.

This patch introduces four new calls: sci_open,
sci_close, sci_read and sci_write, along with
its definitions and return codes which will be
used by later patches.

More information about the SCI can be found at
Jonathan Buzzard's website [1].

[1] http://www.buzzard.me.uk/toshiba/docs.html

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 79 +++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 90dd764..c468003 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -77,6 +77,9 @@ MODULE_LICENSE("GPL");
  * However the ACPI methods seem to be incomplete in some areas (for
  * example they allow setting, but not reading, the LCD brightness value),
  * so this is still useful.
+ * 
+ * SCI stands for "System Configuration Interface" which aim is to
+ * conceal differences in hardware between different models.
  */
 
 #define HCI_WORDS			6
@@ -84,12 +87,20 @@ MODULE_LICENSE("GPL");
 /* operations */
 #define HCI_SET				0xff00
 #define HCI_GET				0xfe00
+#define SCI_OPEN			0xf100
+#define SCI_CLOSE			0xf200
+#define SCI_GET				0xf300
+#define SCI_SET				0xf400
 
 /* return codes */
 #define HCI_SUCCESS			0x0000
 #define HCI_FAILURE			0x1000
 #define HCI_NOT_SUPPORTED		0x8000
 #define HCI_EMPTY			0x8c00
+#define SCI_OPEN_CLOSE_OK		0x0044
+#define SCI_ALREADY_OPEN		0x8100
+#define SCI_NOT_OPENED			0x8200
+#define SCI_NOT_PRESENT			0x8600
 
 /* registers */
 #define HCI_FAN				0x0004
@@ -280,6 +291,74 @@ static acpi_status hci_read2(struct toshiba_acpi_dev *dev, u32 reg,
 	return status;
 }
 
+/* common sci tasks
+ */
+
+static int sci_open(struct toshiba_acpi_dev *dev)
+{
+	u32 in[HCI_WORDS] = { SCI_OPEN, 0, 0, 0, 0, 0 };
+	u32 out[HCI_WORDS];
+	acpi_status status;
+
+	status = hci_raw(dev, in, out);
+	if  (ACPI_FAILURE(status) || out[0] == HCI_FAILURE) {
+		pr_err("ACPI call to open SCI failed\n");
+		return 0;
+	}
+
+	if (out[0] == SCI_OPEN_CLOSE_OK) {
+		return 1;
+	} else if (out[0] == SCI_ALREADY_OPEN) {
+		pr_info("Toshiba SCI already opened\n");
+		return 1;
+	} else if (out[0] == SCI_NOT_PRESENT) {
+		pr_info("Toshiba SCI is not present\n");
+	}
+
+	return 0;
+}
+
+static void sci_close(struct toshiba_acpi_dev *dev)
+{
+	u32 in[HCI_WORDS] = { SCI_CLOSE, 0, 0, 0, 0, 0 };
+	u32 out[HCI_WORDS];
+	acpi_status status;
+
+	status = hci_raw(dev, in, out);
+	if (ACPI_FAILURE(status) || out[0] == HCI_FAILURE) {
+		pr_err("ACPI call to close SCI failed\n");
+		return;
+	}
+
+	if (out[0] == SCI_OPEN_CLOSE_OK)
+		return;
+	else if (out[0] == SCI_NOT_OPENED)
+		pr_info("Toshiba SCI not opened\n");
+	else if (out[0] == SCI_NOT_PRESENT)
+		pr_info("Toshiba SCI is not present\n");
+}
+
+static acpi_status sci_read(struct toshiba_acpi_dev *dev, u32 reg,
+			    u32 *out1, u32 *result)
+{
+	u32 in[HCI_WORDS] = { SCI_GET, reg, 0, 0, 0, 0 };
+	u32 out[HCI_WORDS];
+	acpi_status status = hci_raw(dev, in, out);
+	*out1 = out[2];
+	*result = (ACPI_SUCCESS(status)) ? out[0] : HCI_FAILURE;
+	return status;
+}
+
+static acpi_status sci_write(struct toshiba_acpi_dev *dev, u32 reg,
+			     u32 in1, u32 *result)
+{
+	u32 in[HCI_WORDS] = { SCI_SET, reg, in1, 0, 0, 0 };
+	u32 out[HCI_WORDS];
+	acpi_status status = hci_raw(dev, in, out);
+	*result = (ACPI_SUCCESS(status)) ? out[0] : HCI_FAILURE;
+	return status;
+}
+
 /* Illumination support */
 static int toshiba_illumination_available(struct toshiba_acpi_dev *dev)
 {
-- 
1.9.1
