From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2 3/3] dell-laptop: Do not cache hwswitch state
Date: Mon,  6 Jul 2015 12:08:57 +0200
Message-ID: <1436177337-13654-3-git-send-email-pali.rohar@gmail.com>
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

It can be changed at runtime so make sure that dell-laptop knows always
current state. It can be modified by userspace utility smbios-wireless-=
ctl.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-laptop.c |   85 ++++++++++++++++++++++++++--=
--------
 1 file changed, 61 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index d9710c1..89d6004 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -308,8 +308,6 @@ static const struct dmi_system_id dell_quirks[] __i=
nitconst =3D {
 static struct calling_interface_buffer *buffer;
 static DEFINE_MUTEX(buffer_mutex);
=20
-static int hwswitch_state;
-
 static void clear_buffer(void)
 {
 	memset(buffer, 0, sizeof(struct calling_interface_buffer));
@@ -552,20 +550,30 @@ static int dell_rfkill_set(void *data, bool block=
ed)
 	int disable =3D blocked ? 1 : 0;
 	unsigned long radio =3D (unsigned long)data;
 	int hwswitch_bit =3D (unsigned long)data - 1;
+	int hwswitch;
+	int status;
 	int ret;
=20
 	get_buffer();
=20
 	dell_send_request(buffer, 17, 11);
 	ret =3D buffer->output[0];
+	status =3D buffer->output[1];
=20
 	if (ret !=3D 0)
 		goto out;
=20
+	clear_buffer();
+
+	buffer->input[0] =3D 0x2;
+	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
+	hwswitch =3D buffer->output[1];
+
 	/* If the hardware switch controls this radio, and the hardware
 	   switch is disabled, always disable the radio */
-	if ((hwswitch_state & BIT(hwswitch_bit)) &&
-	    !(buffer->output[1] & BIT(16)))
+	if (ret =3D=3D 0 && (hwswitch & BIT(hwswitch_bit)) &&
+	    (status & BIT(0)) && !(status & BIT(16)))
 		disable =3D 1;
=20
 	clear_buffer();
@@ -596,27 +604,43 @@ static void dell_rfkill_update_sw_state(struct rf=
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
 	int ret;
=20
 	get_buffer();
+
 	dell_send_request(buffer, 17, 11);
 	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
+
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
+
 	release_buffer();
=20
 	if (ret !=3D 0)
 		return;
=20
-	dell_rfkill_update_hw_state(rfkill, (unsigned long)data, status);
+	dell_rfkill_update_hw_state(rfkill, radio, status, hwswitch);
 }
=20
 static const struct rfkill_ops dell_rfkill_ops =3D {
@@ -628,13 +652,24 @@ static struct dentry *dell_laptop_dir;
=20
 static int dell_debugfs_show(struct seq_file *s, void *data)
 {
+	int hwswitch_state;
+	int hwswitch_ret;
 	int status;
 	int ret;
=20
 	get_buffer();
+
 	dell_send_request(buffer, 17, 11);
 	ret =3D buffer->output[0];
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
 	seq_printf(s, "return:\t%d\n", ret);
@@ -679,7 +714,8 @@ static int dell_debugfs_show(struct seq_file *s, vo=
id *data)
 	seq_printf(s, "Bit 21: WiGig is blocked:            %lu\n",
 		  (status & BIT(21)) >> 21);
=20
-	seq_printf(s, "\nhwswitch_state:\t0x%X\n", hwswitch_state);
+	seq_printf(s, "\nhwswitch_return:\t%d\n", hwswitch_ret);
+	seq_printf(s, "hwswitch_state:\t0x%X\n", hwswitch_state);
 	seq_printf(s, "Bit 0 : Wifi controlled by switch:      %lu\n",
 		   hwswitch_state & BIT(0));
 	seq_printf(s, "Bit 1 : Bluetooth controlled by switch: %lu\n",
@@ -715,6 +751,7 @@ static const struct file_operations dell_debugfs_fo=
ps =3D {
=20
 static void dell_update_rfkill(struct work_struct *ignored)
 {
+	int hwswitch =3D 0;
 	int status;
 	int ret;
=20
@@ -727,16 +764,26 @@ static void dell_update_rfkill(struct work_struct=
 *ignored)
 	if (ret !=3D 0)
 		goto out;
=20
+	clear_buffer();
+
+	buffer->input[0] =3D 0x2;
+	dell_send_request(buffer, 17, 11);
+	ret =3D buffer->output[0];
+
+	if (ret =3D=3D 0 && (status & BIT(0)))
+		hwswitch =3D buffer->output[1];
+
 	if (wifi_rfkill) {
-		dell_rfkill_update_hw_state(wifi_rfkill, 1, status);
+		dell_rfkill_update_hw_state(wifi_rfkill, 1, status, hwswitch);
 		dell_rfkill_update_sw_state(wifi_rfkill, 1, status);
 	}
 	if (bluetooth_rfkill) {
-		dell_rfkill_update_hw_state(bluetooth_rfkill, 2, status);
+		dell_rfkill_update_hw_state(bluetooth_rfkill, 2, status,
+					    hwswitch);
 		dell_rfkill_update_sw_state(bluetooth_rfkill, 2, status);
 	}
 	if (wwan_rfkill) {
-		dell_rfkill_update_hw_state(wwan_rfkill, 3, status);
+		dell_rfkill_update_hw_state(wwan_rfkill, 3, status, hwswitch);
 		dell_rfkill_update_sw_state(wwan_rfkill, 3, status);
 	}
=20
@@ -804,25 +851,15 @@ static int __init dell_setup_rfkill(void)
 	dell_send_request(buffer, 17, 11);
 	ret =3D buffer->output[0];
 	status =3D buffer->output[1];
-	clear_buffer();
-	buffer->input[0] =3D 0x2;
-	dell_send_request(buffer, 17, 11);
-	hwswitch_state =3D buffer->output[1];
 	release_buffer();
=20
 	/* dell wireless info smbios call is not supported */
 	if (ret !=3D 0)
 		return 0;
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
+	/* rfkill is only tested on laptops with a hwswitch */
+	if (!(status & BIT(0)) && !force_rfkill)
+		return 0;
=20
 	if ((status & (1<<2|1<<8)) =3D=3D (1<<2|1<<8)) {
 		wifi_rfkill =3D rfkill_alloc("dell-wifi", &platform_device->dev,
--=20
1.7.9.5
