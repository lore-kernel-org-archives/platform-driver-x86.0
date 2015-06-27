From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2] dell-laptop: Check return value of all SMBIOS calls and do not cache hwswitch state
Date: Sat, 27 Jun 2015 09:34:43 +0200
Message-ID: <1435390483-10694-1-git-send-email-pali.rohar@gmail.com>
References: <1434875967-13370-3-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:35548 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751967AbbF0HfD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 27 Jun 2015 03:35:03 -0400
In-Reply-To: <1434875967-13370-3-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

Make sure that return value of all SMBIOS calls are properly checked an=
d
do not continue of processing (received) information if call failed.

Also do not chache hwswitch wireless state as it can be changed at runt=
ime
(e.g from userspace smbios applications).

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
Changes since v1:
 * Call clear_buffer before each sequential SMBIOS call (we expect zero=
-filled buffer)
 * Do not cache hwswitch state as it can be modified at runtime by user=
space
 * simplify some conditions
---
 drivers/platform/x86/dell-laptop.c |  173 ++++++++++++++++++++++++++--=
--------
 1 file changed, 127 insertions(+), 46 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 35758cb..99f28d3 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -308,12 +308,15 @@ static const struct dmi_system_id dell_quirks[] _=
_initconst =3D {
 static struct calling_interface_buffer *buffer;
 static DEFINE_MUTEX(buffer_mutex);
=20
-static int hwswitch_state;
+static void clear_buffer(void)
+{
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+}
=20
 static void get_buffer(void)
 {
 	mutex_lock(&buffer_mutex);
-	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	clear_buffer();
 }
=20
 static void release_buffer(void)
@@ -547,21 +550,41 @@ static int dell_rfkill_set(void *data, bool block=
ed)
 	int disable =3D blocked ? 1 : 0;
 	unsigned long radio =3D (unsigned long)data;
 	int hwswitch_bit =3D (unsigned long)data - 1;
+	int hwswitch;
+	int status;
+	int ret;
=20
 	get_buffer();
+
+	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
+	status =3D buffer->output[1];
+
+	if (ret !=3D 0)
+		goto out;
+
+	clear_buffer();
+
+	buffer->input[0] =3D 0x2;
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
+	hwswitch =3D buffer->output[1];
=20
 	/* If the hardware switch controls this radio, and the hardware
 	   switch is disabled, always disable the radio */
-	if ((hwswitch_state & BIT(hwswitch_bit)) &&
-	    !(buffer->output[1] & BIT(16)))
+	if (ret =3D=3D 0 && (hwswitch & BIT(hwswitch_bit)) &&
+	    (status & BIT(0)) && !(status & BIT(16)))
 		disable =3D 1;
=20
+	clear_buffer();
+
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
@@ -571,6 +594,7 @@ static void dell_rfkill_update_sw_state(struct rfki=
ll *rfkill, int radio,
 	if (status & BIT(0)) {
 		/* Has hw-switch, sync sw_state to BIOS */
 		int block =3D rfkill_blocked(rfkill);
+		clear_buffer();
 		buffer->input[0] =3D (1 | (radio << 8) | (block << 16));
 		dell_send_request(buffer, 17, 11);
 	} else {
@@ -580,23 +604,43 @@ static void dell_rfkill_update_sw_state(struct rf=
kill *rfkill, int radio,
 }
=20
 static void dell_rfkill_update_hw_state(struct rfkill *rfkill, int rad=
io,
-					int status)
+					int status, int hwswitch)
 {
-	if (hwswitch_state & (BIT(radio - 1)))
+	if (hwswitch & (BIT(radio - 1)))
 		rfkill_set_hw_state(rfkill, !(status & BIT(16)));
 }
=20
 static void dell_rfkill_query(struct rfkill *rfkill, void *data)
 {
+	int radio =3D ((unsigned long)data & 0xF);
+	int hwswitch;
 	int status;
+	int ret;
=20
 	get_buffer();
+
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
=20
-	dell_rfkill_update_hw_state(rfkill, (unsigned long)data, status);
+	if (ret !=3D 0 || !(status & BIT(0))) {
+		release_buffer();
+		return;
+	}
+
+	clear_buffer();
+
+	buffer->input[0] =3D 0x2;
+	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
+	hwswitch =3D buffer->output[1];
=20
 	release_buffer();
+
+	if (ret !=3D 0)
+		return;
+
+	dell_rfkill_update_hw_state(rfkill, radio, status, hwswitch);
 }
=20
 static const struct rfkill_ops dell_rfkill_ops =3D {
@@ -608,13 +652,27 @@ static struct dentry *dell_laptop_dir;
=20
 static int dell_debugfs_show(struct seq_file *s, void *data)
 {
+	int hwswitch_state;
+	int hwswitch_ret;
 	int status;
+	int ret;
=20
 	get_buffer();
+
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
+
+	clear_buffer();
+
+	buffer->input[0] =3D 0x2;
+	dell_send_request(buffer, 17, 11);
+	hwswitch_ret =3D buffer->output[0];
+	hwswitch_state =3D buffer->output[1];
+
 	release_buffer();
=20
+	seq_printf(s, "return:\t%d\n", ret);
 	seq_printf(s, "status:\t0x%X\n", status);
 	seq_printf(s, "Bit 0 : Hardware switch supported:   %lu\n",
 		   status & BIT(0));
@@ -656,7 +714,9 @@ static int dell_debugfs_show(struct seq_file *s, vo=
id *data)
 	seq_printf(s, "Bit 21: WiGig is blocked:            %lu\n",
 		  (status & BIT(21)) >> 21);
=20
-	seq_printf(s, "\nhwswitch_state:\t0x%X\n", hwswitch_state);
+	seq_printf(s, "\n");
+	seq_printf(s, "hwswitch_return:\t%d\n", hwswitch_ret);
+	seq_printf(s, "hwswitch_state:\t0x%X\n", hwswitch_state);
 	seq_printf(s, "Bit 0 : Wifi controlled by switch:      %lu\n",
 		   hwswitch_state & BIT(0));
 	seq_printf(s, "Bit 1 : Bluetooth controlled by switch: %lu\n",
@@ -692,25 +752,44 @@ static const struct file_operations dell_debugfs_=
fops =3D {
=20
 static void dell_update_rfkill(struct work_struct *ignored)
 {
+	int hwswitch;
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
+	clear_buffer();
+
+	buffer->input[0] =3D 0x2;
+	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
+
+	if (ret =3D=3D 0 && (status & BIT(0)))
+		hwswitch =3D buffer->output[1];
+	else
+		hwswitch =3D 0;
+
 	if (wifi_rfkill) {
-		dell_rfkill_update_hw_state(wifi_rfkill, 1, status);
+		dell_rfkill_update_hw_state(wifi_rfkill, 1, status, hwswitch);
 		dell_rfkill_update_sw_state(wifi_rfkill, 1, status);
 	}
 	if (bluetooth_rfkill) {
-		dell_rfkill_update_hw_state(bluetooth_rfkill, 2, status);
+		dell_rfkill_update_hw_state(bluetooth_rfkill, 2, status, hwswitch);
 		dell_rfkill_update_sw_state(bluetooth_rfkill, 2, status);
 	}
 	if (wwan_rfkill) {
-		dell_rfkill_update_hw_state(wwan_rfkill, 3, status);
+		dell_rfkill_update_hw_state(wwan_rfkill, 3, status, hwswitch);
 		dell_rfkill_update_sw_state(wwan_rfkill, 3, status);
 	}
=20
+ out:
 	release_buffer();
 }
 static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
@@ -772,21 +851,17 @@ static int __init dell_setup_rfkill(void)
=20
 	get_buffer();
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
-	buffer->input[0] =3D 0x2;
-	dell_send_request(buffer, 17, 11);
-	hwswitch_state =3D buffer->output[1];
 	release_buffer();
=20
-	if (!(status & BIT(0))) {
-		if (force_rfkill) {
-			/* No hwsitch, clear all hw-controlled bits */
-			hwswitch_state &=3D ~7;
-		} else {
-			/* rfkill is only tested on laptops with a hwswitch */
-			return 0;
-		}
-	}
+	/* dell wireless info smbios call is not supported */
+	if (ret !=3D 0)
+		return 0;
+
+	/* rfkill is only tested on laptops with a hwswitch */
+	if (!(status & BIT(0)) && !force_rfkill)
+		return 0;
=20
 	if ((status & (1<<2|1<<8)) =3D=3D (1<<2|1<<8)) {
 		wifi_rfkill =3D rfkill_alloc("dell-wifi", &platform_device->dev,
@@ -931,47 +1006,50 @@ static void dell_cleanup_rfkill(void)
=20
 static int dell_send_intensity(struct backlight_device *bd)
 {
-	int ret =3D 0;
+	int ret;
+	int token;
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
+	int ret;
+	int token;
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
@@ -2035,6 +2113,7 @@ static void kbd_led_exit(void)
 static int __init dell_init(void)
 {
 	int max_intensity =3D 0;
+	int token;
 	int ret;
=20
 	if (!dmi_check_system(dell_device_table))
@@ -2098,13 +2177,15 @@ static int __init dell_init(void)
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
