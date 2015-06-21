From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 2/4] dell-laptop: Check return value of all SMBIOS calls
Date: Sun, 21 Jun 2015 10:39:27 +0200
Message-ID: <1434875967-13370-3-git-send-email-pali.rohar@gmail.com>
References: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Make sure that return value of all SMBIOS calls are properly checked an=
d
do not continue of processing (received) information if call failed.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-laptop.c |   61 ++++++++++++++++++++++++++++=
+++-----
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index ab89103..aaef335 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -548,21 +548,27 @@ static int dell_rfkill_set(void *data, bool block=
ed)
 	int disable =3D blocked ? 1 : 0;
 	unsigned long radio =3D (unsigned long)data;
 	int hwswitch_bit =3D (unsigned long)data - 1;
+	int status;
+	int ret;
=20
 	get_buffer();
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
+	status =3D buffer->output[1];
=20
 	/* If the hardware switch controls this radio, and the hardware
 	   switch is disabled, always disable the radio */
-	if ((hwswitch_state & BIT(hwswitch_bit)) &&
-	    !(buffer->output[1] & BIT(16)))
+	if (ret =3D=3D 0 &&
+	    (hwswitch_state & BIT(hwswitch_bit)) &&
+	    !(status & BIT(16)))
 		disable =3D 1;
=20
 	buffer->input[0] =3D (1 | (radio<<8) | (disable << 16));
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
=20
 	release_buffer();
-	return 0;
+	return dell_smi_error(ret);
 }
=20
 /* Must be called with the buffer held */
@@ -590,14 +596,18 @@ static void dell_rfkill_update_hw_state(struct rf=
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
@@ -610,12 +620,15 @@ static struct dentry *dell_laptop_dir;
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
@@ -677,11 +690,16 @@ static const struct file_operations dell_debugfs_=
fops =3D {
 static void dell_update_rfkill(struct work_struct *ignored)
 {
 	int status;
+	int ret;
=20
 	get_buffer();
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
@@ -695,6 +713,7 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
 		dell_rfkill_update_sw_state(wwan_rfkill, 3, status);
 	}
=20
+ out:
 	release_buffer();
 }
 static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
@@ -755,13 +774,35 @@ static int __init dell_setup_rfkill(void)
 		return 0;
=20
 	get_buffer();
+
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
+	if (ret !=3D 0) {
+		/* dell wireless info smbios call is not working */
+		/* so there is no support for rfkill */
+		release_buffer();
+		return 0;
+	}
+
 	buffer->input[0] =3D 0x2;
 	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
 	hwswitch_state =3D buffer->output[1];
+
 	release_buffer();
=20
+	if (ret !=3D 0) {
+		/* dell wireless switch smbios call is not working */
+		if (force_rfkill) {
+			/* clear all hw-controlled bits */
+			hwswitch_state &=3D ~7;
+		} else {
+			/* rfkill is only tested on laptops with a hwswitch */
+			return 0;
+		}
+	}
+
 	if (!(status & BIT(0))) {
 		if (force_rfkill) {
 			/* No hwsitch, clear all hw-controlled bits */
@@ -931,6 +972,8 @@ static int dell_send_intensity(struct backlight_dev=
ice *bd)
 	else
 		dell_send_request(buffer, 1, 1);
=20
+	ret =3D dell_smi_error(buffer->output[0]);
+
  out:
 	release_buffer();
 	return ret;
@@ -953,7 +996,10 @@ static int dell_get_intensity(struct backlight_dev=
ice *bd)
 	else
 		dell_send_request(buffer, 0, 1);
=20
-	ret =3D buffer->output[1];
+	if (buffer->output[0])
+		ret =3D dell_smi_error(buffer->output[0]);
+	else
+		ret =3D buffer->output[1];
=20
  out:
 	release_buffer();
@@ -2087,7 +2133,8 @@ static int __init dell_init(void)
 	buffer->input[0] =3D find_token_location(BRIGHTNESS_TOKEN);
 	if (buffer->input[0] !=3D -1) {
 		dell_send_request(buffer, 0, 2);
-		max_intensity =3D buffer->output[3];
+		if (buffer->output[0] =3D=3D 0)
+			max_intensity =3D buffer->output[3];
 	}
 	release_buffer();
=20
--=20
1.7.9.5
