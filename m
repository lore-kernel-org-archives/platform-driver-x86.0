From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2 2/3] dell-laptop: Check return value of each SMBIOS call
Date: Mon,  6 Jul 2015 12:08:56 +0200
Message-ID: <1436177337-13654-2-git-send-email-pali.rohar@gmail.com>
References: <1435774101-12329-1-git-send-email-pali.rohar@gmail.com>
 <1436177337-13654-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436177337-13654-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Make sure that return value of each SMBIOS call is properly checked and=
 do
not continue of processing (received) information if call failed.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-laptop.c |   83 +++++++++++++++++++++++++---=
--------
 1 file changed, 58 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 2caefb2..d9710c1 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -552,9 +552,15 @@ static int dell_rfkill_set(void *data, bool blocke=
d)
 	int disable =3D blocked ? 1 : 0;
 	unsigned long radio =3D (unsigned long)data;
 	int hwswitch_bit =3D (unsigned long)data - 1;
+	int ret;
=20
 	get_buffer();
+
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
+
+	if (ret !=3D 0)
+		goto out;
=20
 	/* If the hardware switch controls this radio, and the hardware
 	   switch is disabled, always disable the radio */
@@ -566,9 +572,11 @@ static int dell_rfkill_set(void *data, bool blocke=
d)
=20
 	buffer->input[0] =3D (1 | (radio<<8) | (disable << 16));
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
=20
+ out:
 	release_buffer();
-	return 0;
+	return dell_smi_error(ret);
 }
=20
 /* Must be called with the buffer held */
@@ -597,14 +605,18 @@ static void dell_rfkill_update_hw_state(struct rf=
kill *rfkill, int radio,
 static void dell_rfkill_query(struct rfkill *rfkill, void *data)
 {
 	int status;
+	int ret;
=20
 	get_buffer();
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
+	release_buffer();
=20
-	dell_rfkill_update_hw_state(rfkill, (unsigned long)data, status);
+	if (ret !=3D 0)
+		return;
=20
-	release_buffer();
+	dell_rfkill_update_hw_state(rfkill, (unsigned long)data, status);
 }
=20
 static const struct rfkill_ops dell_rfkill_ops =3D {
@@ -617,12 +629,15 @@ static struct dentry *dell_laptop_dir;
 static int dell_debugfs_show(struct seq_file *s, void *data)
 {
 	int status;
+	int ret;
=20
 	get_buffer();
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
 	release_buffer();
=20
+	seq_printf(s, "return:\t%d\n", ret);
 	seq_printf(s, "status:\t0x%X\n", status);
 	seq_printf(s, "Bit 0 : Hardware switch supported:   %lu\n",
 		   status & BIT(0));
@@ -701,11 +716,17 @@ static const struct file_operations dell_debugfs_=
fops =3D {
 static void dell_update_rfkill(struct work_struct *ignored)
 {
 	int status;
+	int ret;
=20
 	get_buffer();
+
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
=20
+	if (ret !=3D 0)
+		goto out;
+
 	if (wifi_rfkill) {
 		dell_rfkill_update_hw_state(wifi_rfkill, 1, status);
 		dell_rfkill_update_sw_state(wifi_rfkill, 1, status);
@@ -719,6 +740,7 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
 		dell_rfkill_update_sw_state(wwan_rfkill, 3, status);
 	}
=20
+ out:
 	release_buffer();
 }
 static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
@@ -780,6 +802,7 @@ static int __init dell_setup_rfkill(void)
=20
 	get_buffer();
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
 	clear_buffer();
 	buffer->input[0] =3D 0x2;
@@ -787,6 +810,10 @@ static int __init dell_setup_rfkill(void)
 	hwswitch_state =3D buffer->output[1];
 	release_buffer();
=20
+	/* dell wireless info smbios call is not supported */
+	if (ret !=3D 0)
+		return 0;
+
 	if (!(status & BIT(0))) {
 		if (force_rfkill) {
 			/* No hwsitch, clear all hw-controlled bits */
@@ -940,47 +967,50 @@ static void dell_cleanup_rfkill(void)
=20
 static int dell_send_intensity(struct backlight_device *bd)
 {
-	int ret =3D 0;
+	int token;
+	int ret;
+
+	token =3D find_token_location(BRIGHTNESS_TOKEN);
+	if (token =3D=3D -1)
+		return -ENODEV;
=20
 	get_buffer();
-	buffer->input[0] =3D find_token_location(BRIGHTNESS_TOKEN);
+	buffer->input[0] =3D token;
 	buffer->input[1] =3D bd->props.brightness;
=20
-	if (buffer->input[0] =3D=3D -1) {
-		ret =3D -ENODEV;
-		goto out;
-	}
-
 	if (power_supply_is_system_supplied() > 0)
 		dell_send_request(buffer, 1, 2);
 	else
 		dell_send_request(buffer, 1, 1);
=20
- out:
+	ret =3D dell_smi_error(buffer->output[0]);
+
 	release_buffer();
 	return ret;
 }
=20
 static int dell_get_intensity(struct backlight_device *bd)
 {
-	int ret =3D 0;
+	int token;
+	int ret;
=20
-	get_buffer();
-	buffer->input[0] =3D find_token_location(BRIGHTNESS_TOKEN);
+	token =3D find_token_location(BRIGHTNESS_TOKEN);
+	if (token =3D=3D -1)
+		return -ENODEV;
=20
-	if (buffer->input[0] =3D=3D -1) {
-		ret =3D -ENODEV;
-		goto out;
-	}
+	get_buffer();
+	buffer->input[0] =3D token;
=20
 	if (power_supply_is_system_supplied() > 0)
 		dell_send_request(buffer, 0, 2);
 	else
 		dell_send_request(buffer, 0, 1);
=20
-	ret =3D buffer->output[1];
+	if (buffer->output[0])
+		ret =3D dell_smi_error(buffer->output[0]);
+	else
+		ret =3D buffer->output[1];
=20
- out:
 	release_buffer();
 	return ret;
 }
@@ -2044,6 +2074,7 @@ static void kbd_led_exit(void)
 static int __init dell_init(void)
 {
 	int max_intensity =3D 0;
+	int token;
 	int ret;
=20
 	if (!dmi_check_system(dell_device_table))
@@ -2107,13 +2138,15 @@ static int __init dell_init(void)
 		return 0;
 #endif
=20
-	get_buffer();
-	buffer->input[0] =3D find_token_location(BRIGHTNESS_TOKEN);
-	if (buffer->input[0] !=3D -1) {
+	token =3D find_token_location(BRIGHTNESS_TOKEN);
+	if (token !=3D -1) {
+		get_buffer();
+		buffer->input[0] =3D token;
 		dell_send_request(buffer, 0, 2);
-		max_intensity =3D buffer->output[3];
+		if (buffer->output[0] =3D=3D 0)
+			max_intensity =3D buffer->output[3];
+		release_buffer();
 	}
-	release_buffer();
=20
 	if (max_intensity) {
 		struct backlight_properties props;
--=20
1.7.9.5
