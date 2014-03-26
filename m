From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/7] toshiba_acpi: Adapt Illumination code to use SCI
Date: Tue, 25 Mar 2014 20:38:30 -0600
Message-ID: <1395801515-2333-3-git-send-email-coproscefalo@gmail.com>
References: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:51557 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314AbaCZCjJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Mar 2014 22:39:09 -0400
Received: by mail-ob0-f180.google.com with SMTP id wn1so1698563obc.39
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2014 19:39:09 -0700 (PDT)
In-Reply-To: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Change the toshiba_illumination_* code to use the
newly introduced SCI functions, making the code
more robust in detecting Illumination capabilities
properly, since it was only opening the SCI and
the return value was never checked for errors or
actual Illumination support.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 94 ++++++++++++++---------------=
--------
 1 file changed, 34 insertions(+), 60 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86=
/toshiba_acpi.c
index c468003..6ed5be0 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -100,6 +100,7 @@ MODULE_LICENSE("GPL");
 #define SCI_OPEN_CLOSE_OK		0x0044
 #define SCI_ALREADY_OPEN		0x8100
 #define SCI_NOT_OPENED			0x8200
+#define SCI_INPUT_DATA_ERROR		0x8300
 #define SCI_NOT_PRESENT			0x8600
=20
 /* registers */
@@ -110,6 +111,7 @@ MODULE_LICENSE("GPL");
 #define HCI_HOTKEY_EVENT		0x001e
 #define HCI_LCD_BRIGHTNESS		0x002a
 #define HCI_WIRELESS			0x0056
+#define SCI_ILLUMINATION		0x014e
=20
 /* field definitions */
 #define HCI_HOTKEY_DISABLE		0x0b
@@ -362,18 +364,23 @@ static acpi_status sci_write(struct toshiba_acpi_=
dev *dev, u32 reg,
 /* Illumination support */
 static int toshiba_illumination_available(struct toshiba_acpi_dev *dev=
)
 {
-	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
+	u32 in[HCI_WORDS] =3D { SCI_GET, SCI_ILLUMINATION, 0, 0, 0, 0 };
 	u32 out[HCI_WORDS];
 	acpi_status status;
=20
-	in[0] =3D 0xf100;
+	if (!sci_open(dev))
+		return 0;
+
 	status =3D hci_raw(dev, in, out);
-	if (ACPI_FAILURE(status)) {
+	sci_close(dev);
+	if (ACPI_FAILURE(status) || out[0] =3D=3D HCI_FAILURE) {
+		pr_err("ACPI call to query Illumination support failed\n");
+		return 0;
+	} else if (out[0] =3D=3D HCI_NOT_SUPPORTED || out[1] !=3D 1) {
 		pr_info("Illumination device not available\n");
 		return 0;
 	}
-	in[0] =3D 0xf400;
-	status =3D hci_raw(dev, in, out);
+
 	return 1;
 }
=20
@@ -382,82 +389,49 @@ static void toshiba_illumination_set(struct led_c=
lassdev *cdev,
 {
 	struct toshiba_acpi_dev *dev =3D container_of(cdev,
 			struct toshiba_acpi_dev, led_dev);
-	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
-	u32 out[HCI_WORDS];
+	u32 state, result;
 	acpi_status status;
=20
 	/* First request : initialize communication. */
-	in[0] =3D 0xf100;
-	status =3D hci_raw(dev, in, out);
-	if (ACPI_FAILURE(status)) {
-		pr_info("Illumination device not available\n");
+	if (!sci_open(dev))
 		return;
-	}
=20
-	if (brightness) {
-		/* Switch the illumination on */
-		in[0] =3D 0xf400;
-		in[1] =3D 0x14e;
-		in[2] =3D 1;
-		status =3D hci_raw(dev, in, out);
-		if (ACPI_FAILURE(status)) {
-			pr_info("ACPI call for illumination failed\n");
-			return;
-		}
-	} else {
-		/* Switch the illumination off */
-		in[0] =3D 0xf400;
-		in[1] =3D 0x14e;
-		in[2] =3D 0;
-		status =3D hci_raw(dev, in, out);
-		if (ACPI_FAILURE(status)) {
-			pr_info("ACPI call for illumination failed.\n");
-			return;
-		}
+	/* Switch the illumination on/off */
+	state =3D brightness ? 1 : 0;
+	status =3D sci_write(dev, SCI_ILLUMINATION, state, &result);
+	sci_close(dev);
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI call for illumination failed\n");
+		return;
+	} else if (result =3D=3D HCI_NOT_SUPPORTED) {
+		pr_info("Illumination not supported\n");
+		return;
 	}
-
-	/* Last request : close communication. */
-	in[0] =3D 0xf200;
-	in[1] =3D 0;
-	in[2] =3D 0;
-	hci_raw(dev, in, out);
 }
=20
 static enum led_brightness toshiba_illumination_get(struct led_classde=
v *cdev)
 {
 	struct toshiba_acpi_dev *dev =3D container_of(cdev,
 			struct toshiba_acpi_dev, led_dev);
-	u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
-	u32 out[HCI_WORDS];
+	u32 state, result;
 	acpi_status status;
-	enum led_brightness result;
=20
 	/*=C2=A0First request : initialize communication. */
-	in[0] =3D 0xf100;
-	status =3D hci_raw(dev, in, out);
-	if (ACPI_FAILURE(status)) {
-		pr_info("Illumination device not available\n");
+	if (!sci_open(dev))
 		return LED_OFF;
-	}
=20
 	/* Check the illumination */
-	in[0] =3D 0xf300;
-	in[1] =3D 0x14e;
-	status =3D hci_raw(dev, in, out);
-	if (ACPI_FAILURE(status)) {
-		pr_info("ACPI call for illumination failed.\n");
+	status =3D sci_read(dev, SCI_ILLUMINATION, &state, &result);
+	sci_close(dev);
+	if (ACPI_FAILURE(status) || result =3D=3D SCI_INPUT_DATA_ERROR) {
+		pr_err("ACPI call for illumination failed\n");
+		return LED_OFF;
+	} else if (result =3D=3D HCI_NOT_SUPPORTED) {
+		pr_info("Illumination not supported\n");
 		return LED_OFF;
 	}
=20
-	result =3D out[2] ? LED_FULL : LED_OFF;
-
-	/* Last request : close communication. */
-	in[0] =3D 0xf200;
-	in[1] =3D 0;
-	in[2] =3D 0;
-	hci_raw(dev, in, out);
-
-	return result;
+	return state ? LED_FULL : LED_OFF;
 }
=20
 /* Bluetooth rfkill handlers */
--=20
1.9.1
