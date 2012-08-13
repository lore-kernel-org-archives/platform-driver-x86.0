From: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
Subject: [PATCH] apple-gmux: Add support for message box interface (as found
 in MBP10,1/Retina MacBook Pro)
Date: Mon, 13 Aug 2012 11:42:49 +0200
Message-ID: <5028CC19.6070003@vmars.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010506020903040202090003"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from luna.vmars.tuwien.ac.at ([128.130.39.29]:52422 "EHLO
	mail.vmars.tuwien.ac.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379Ab2HMKBP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Aug 2012 06:01:15 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Andreas Heider <andreas@meetr.de>
Cc: Greg KH <gregkh@linuxfoundation.org>

This is a multi-part message in MIME format.
--------------010506020903040202090003
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear all,

Apple changed the interface to the gmux device in recent models (at
least MBP 10,1).
This patch [1] (also attached) against 3.6-rc1 adds support for the
changed interface.
Previously the interface to gmux registers was memory mapped, now there
is a message box
interface (address, status, data I/O ports). The gmux register layout
itself seems to be unchanged.
I chose rather safe delays (1 ms) for access relaxation -- without any
relaxation the
communication is unreliable for me.
If someone with an older MBP could test whether the interface detection
(DPM/classic) works it
would be great. I used a similar detection routine Apple is using in
their driver.


I see that there is a lot going on concerning and related to the
apple-gmux currently:
https://lkml.org/lkml/2012/7/9/715
https://lkml.org/lkml/2012/8/3/300

I could apply all those patches successfully and run a halfway decent
setup with working
X, virtual consoles, backlight control, suspend/resume and even with
(limited) GPU switching
during runtime:
http://ubuntuforums.org/showpost.php?p=12167124&postcount=89

Cheers,
 Bernhard

[1] http://luna.vmars.tuwien.ac.at/~froemel/rmbp/patch-apple-gmux.txt
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlAozBkACgkQ6iVUjPs37JldagCcDKA4BhiUIQXZYA9Wr4N5nPKJ
W8MAmQE5nOe3UMAG67rvVSxpEurB5ohn
=v0fd
-----END PGP SIGNATURE-----


--------------010506020903040202090003
Content-Type: text/plain; charset=UTF-8;
 name="patch-apple-gmux.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="patch-apple-gmux.txt"

Signed-off-by: Bernhard Froemel <froemel@vmars.tuwien.ac.at>

--- a/drivers/platform/x86/apple-gmux.c	2012-08-03 02:38:10.000000000 +0300
+++ b/drivers/platform/x86/apple-gmux.c	2012-08-13 12:04:25.366408899 +0300
@@ -2,6 +2,7 @@
  *  Gmux driver for Apple laptops
  *
  *  Copyright (C) Canonical Ltd. <seth.forshee@canonical.com>
+ *  Copyright (C) 2012 Bernhard Froemel <froemel@vmars.tuwien.ac.at>
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License version 2 as
@@ -18,12 +19,15 @@
 #include <linux/pnp.h>
 #include <linux/apple_bl.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
 struct apple_gmux_data {
 	unsigned long iostart;
 	unsigned long iolen;
+	int is_dpm;
+	struct semaphore dpm_lock;
 
 	struct backlight_device *bdev;
 };
@@ -45,6 +49,22 @@
 #define GMUX_PORT_DISCRETE_POWER	0x50
 #define GMUX_PORT_MAX_BRIGHTNESS	0x70
 #define GMUX_PORT_BRIGHTNESS		0x74
+#define GMUX_PORT_DPM_CHK		0x00
+#define GMUX_PORT_DPM_REG1		0xcc
+#define GMUX_PORT_DPM_REG2		0xcd
+
+#define DPM_REG1			0xaa
+#define DPM_REG2			0x55
+
+#define GMUX_PORT_DPM_RADDR		0xd0
+#define GMUX_PORT_DPM_WADDRSTAT		0xd4
+#define GMUX_PORT_DPM_DAT0		0xc2
+#define GMUX_PORT_DPM_DAT1		0xc3
+#define GMUX_PORT_DPM_DAT2		0xc4
+#define GMUX_PORT_DPM_DAT3		0xc5
+
+#define GMUX_DPM_CMD_TO			20
+#define GMUX_DPM_CMD_DLY		1 /* in ms */
 
 #define GMUX_MIN_IO_LEN			(GMUX_PORT_BRIGHTNESS + 4)
 
@@ -59,27 +79,151 @@
 #define GMUX_BRIGHTNESS_MASK		0x00ffffff
 #define GMUX_MAX_BRIGHTNESS		GMUX_BRIGHTNESS_MASK
 
+static inline int gmux_dpm_read(struct apple_gmux_data *gmux_data, u8 reg,
+	u8 size, u32 *ret);
+static inline int gmux_dpm_write(struct apple_gmux_data *gmux_data, u8 reg,
+	u8 size, u32 val);
+
 static inline u8 gmux_read8(struct apple_gmux_data *gmux_data, int port)
 {
+	if (gmux_data->is_dpm) {
+		u32 ret;
+		gmux_dpm_read(gmux_data, port, 1, &ret);
+		return ret;
+	}
 	return inb(gmux_data->iostart + port);
 }
 
 static inline void gmux_write8(struct apple_gmux_data *gmux_data, int port,
 			       u8 val)
 {
-	outb(val, gmux_data->iostart + port);
+	if (gmux_data->is_dpm)
+		gmux_dpm_write(gmux_data, port, 1, val);
+	else
+		outb(val, gmux_data->iostart + port);
 }
 
 static inline u32 gmux_read32(struct apple_gmux_data *gmux_data, int port)
 {
+	if (gmux_data->is_dpm) {
+		u32 ret;
+		gmux_dpm_read(gmux_data, port, 4, &ret);
+		return ret;
+	}
 	return inl(gmux_data->iostart + port);
 }
 
+
+static inline u8 gmux_dpm_cmd_rdy(void)
+{
+	u8 status = inb(GMUX_PORT_DPM_WADDRSTAT);
+	u8 to = GMUX_DPM_CMD_TO;
+	while (status == 0 && to) {
+		inb(GMUX_PORT_DPM_RADDR);
+		msleep(GMUX_DPM_CMD_DLY);
+		status = inb(GMUX_PORT_DPM_WADDRSTAT);
+		to--;
+		msleep(GMUX_DPM_CMD_DLY);
+	}
+	return to != 0;
+}
+
+static inline u8 gmux_dpm_cmd_done(void)
+{
+	uint8_t status = 0;
+	uint8_t to = GMUX_DPM_CMD_TO;
+	do {
+		status = inb(GMUX_PORT_DPM_WADDRSTAT);
+		to--;
+		msleep(GMUX_DPM_CMD_DLY);
+	} while (status == 0 && to);
+	if (status == 0)
+		inb(GMUX_PORT_DPM_RADDR);
+	return to != 0;
+}
+
+
+static inline int gmux_dpm_read(struct apple_gmux_data *gmux_data, u8 reg,
+	u8 size, u32 *ret)
+{
+	*ret = 0x0;
+
+	if (down_interruptible(&gmux_data->dpm_lock))
+		return 0;
+
+	if (!gmux_dpm_cmd_rdy()) {
+		pr_err("gmux_dpm_cmd_rdy failed.");
+		goto gmux_dpm_read_failed;
+	}
+	outb(reg, gmux_data->iostart + GMUX_PORT_DPM_RADDR);
+	if (!gmux_dpm_cmd_done()) {
+		pr_err("gmux_dpm_cmd_done failed.");
+		goto gmux_dpm_read_failed;
+	}
+	if (size == 1) {
+		*ret = inb(gmux_data->iostart + GMUX_PORT_DPM_DAT0);
+	} else if (size == 2) {
+		*ret = inb(gmux_data->iostart + GMUX_PORT_DPM_DAT1) << 8;
+		*ret |= inb(gmux_data->iostart + GMUX_PORT_DPM_DAT0);
+	} else if (size == 4) {
+		*ret = inb(gmux_data->iostart + GMUX_PORT_DPM_DAT3) << 24;
+		*ret |= inb(gmux_data->iostart + GMUX_PORT_DPM_DAT2) << 16;
+		*ret |= inb(gmux_data->iostart + GMUX_PORT_DPM_DAT1) << 8;
+		*ret |= inb(gmux_data->iostart + GMUX_PORT_DPM_DAT0);
+	} else
+		goto gmux_dpm_read_failed;
+
+	up(&gmux_data->dpm_lock);
+	return 1;
+
+gmux_dpm_read_failed:
+	up(&gmux_data->dpm_lock);
+	return 0;
+}
+
+static inline int gmux_dpm_write(struct apple_gmux_data *gmux_data, u8 reg,
+	u8 size, u32 val)
+{
+	if (down_interruptible(&gmux_data->dpm_lock))
+		return 0;
+
+	if (size == 1) {
+		outb(val, gmux_data->iostart + GMUX_PORT_DPM_DAT0);
+	} else if (size == 2) {
+		outb(val>>8, gmux_data->iostart + GMUX_PORT_DPM_DAT1);
+		outb(val, gmux_data->iostart + GMUX_PORT_DPM_DAT0);
+	} else if (size == 4) {
+		outb(val>>24, gmux_data->iostart + GMUX_PORT_DPM_DAT3);
+		outb(val>>16, gmux_data->iostart + GMUX_PORT_DPM_DAT2);
+		outb(val>>8, gmux_data->iostart + GMUX_PORT_DPM_DAT1);
+		outb(val, gmux_data->iostart + GMUX_PORT_DPM_DAT0);
+	} else
+		goto gmux_dpm_write_failed;
+
+	if (!gmux_dpm_cmd_rdy()) {
+		pr_err("gmux_dpm_cmd_rdy failed.");
+		goto gmux_dpm_write_failed;
+
+	}
+	outb(reg, gmux_data->iostart + GMUX_PORT_DPM_WADDRSTAT);
+	if (!gmux_dpm_cmd_done()) {
+		pr_err("gmux_dpm_cmd_done failed.");
+		goto gmux_dpm_write_failed;
+	}
+
+	up(&gmux_data->dpm_lock);
+	return 1;
+
+gmux_dpm_write_failed:
+	up(&gmux_data->dpm_lock);
+	return 0;
+}
+
 static int gmux_get_brightness(struct backlight_device *bd)
 {
 	struct apple_gmux_data *gmux_data = bl_get_data(bd);
 	return gmux_read32(gmux_data, GMUX_PORT_BRIGHTNESS) &
-	       GMUX_BRIGHTNESS_MASK;
+		GMUX_BRIGHTNESS_MASK;
 }
 
 static int gmux_update_status(struct backlight_device *bd)
@@ -90,16 +234,23 @@
 	if (bd->props.state & BL_CORE_SUSPENDED)
 		return 0;
 
-	/*
-	 * Older gmux versions require writing out lower bytes first then
-	 * setting the upper byte to 0 to flush the values. Newer versions
-	 * accept a single u32 write, but the old method also works, so we
-	 * just use the old method for all gmux versions.
-	 */
-	gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS, brightness);
-	gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 1, brightness >> 8);
-	gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 2, brightness >> 16);
-	gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 3, 0);
+	if (gmux_data->is_dpm) {
+		gmux_dpm_write(gmux_data, GMUX_PORT_BRIGHTNESS, 4, brightness);
+	} else {
+		/*
+		 * Older gmux versions require writing out lower bytes first
+		 * then setting the upper byte to 0 to flush the values.
+		 * Newer versions accept a single u32 write, but the old
+		 * method also works, so we just use the old method for all
+		 * classic gmux versions.
+		 */
+		gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS, brightness);
+		gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 1,
+			brightness >> 8);
+		gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 2,
+			brightness >> 16);
+		gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 3, 0);
+	}
 
 	return 0;
 }
@@ -117,12 +268,14 @@
 	struct resource *res;
 	struct backlight_properties props;
 	struct backlight_device *bdev;
-	u8 ver_major, ver_minor, ver_release;
+	u8 ver_major, ver_minor, ver_release, dpm_chk;
 	int ret = -ENXIO;
 
 	gmux_data = kzalloc(sizeof(*gmux_data), GFP_KERNEL);
 	if (!gmux_data)
 		return -ENOMEM;
+	gmux_data->is_dpm = 0;
+	sema_init(&gmux_data->dpm_lock, 1);
 	pnp_set_drvdata(pnp, gmux_data);
 
 	res = pnp_get_resource(pnp, IORESOURCE_IO, 0);
@@ -146,22 +299,51 @@
 		goto err_free;
 	}
 
-	/*
-	 * On some machines the gmux is in ACPI even thought the machine
-	 * doesn't really have a gmux. Check for invalid version information
-	 * to detect this.
-	 */
+	dpm_chk = gmux_read8(gmux_data, GMUX_PORT_DPM_CHK);
 	ver_major = gmux_read8(gmux_data, GMUX_PORT_VERSION_MAJOR);
-	ver_minor = gmux_read8(gmux_data, GMUX_PORT_VERSION_MINOR);
-	ver_release = gmux_read8(gmux_data, GMUX_PORT_VERSION_RELEASE);
-	if (ver_major == 0xff && ver_minor == 0xff && ver_release == 0xff) {
-		pr_info("gmux device not present\n");
-		ret = -ENODEV;
-		goto err_release;
+	if (dpm_chk != ver_major) {
+		/*
+		 * On some machines the gmux is in ACPI even thought the
+		 * machine doesn't really have a gmux. Check for invalid
+		 * version information to detect this.
+		 */
+		ver_minor = gmux_read8(gmux_data, GMUX_PORT_VERSION_MINOR);
+		ver_release = gmux_read8(gmux_data, GMUX_PORT_VERSION_RELEASE);
+		if (ver_major == 0xff && ver_minor == 0xff
+			&& ver_release == 0xff) {
+			pr_err("gmux device seems to be not present\n");
+			ret = -ENODEV;
+			goto err_release;
+		}
+		gmux_data->is_dpm = 0;
+	} else { /* possibly a dp micro variant, found in MBP 10,1 */
+		/* check presence */
+		gmux_write8(gmux_data, GMUX_PORT_DPM_REG1, DPM_REG1);
+		gmux_write8(gmux_data, GMUX_PORT_DPM_REG2, DPM_REG2);
+		if (gmux_read8(gmux_data, GMUX_PORT_DPM_REG1) == DPM_REG1 &&
+			gmux_read8(gmux_data,
+				GMUX_PORT_DPM_REG2) == DPM_REG2) {
+			u32 version = 0;
+			gmux_data->is_dpm = 1;
+
+			if (!gmux_dpm_read(gmux_data,
+				GMUX_PORT_VERSION_MAJOR, 4, &version)) {
+				pr_err("could not obtain version information from gmux. Bailing out.\n");
+				ret = -ENODEV;
+				goto err_release;
+			}
+			ver_major = (version >> 24) & 0xff;
+			ver_minor = (version >> 16) & 0xff;
+			ver_release = (version >> 8) & 0xff;
+		} else {
+			pr_err("gmux device seems to be not present\n");
+			ret = -ENODEV;
+			goto err_release;
+		}
 	}
 
-	pr_info("Found gmux version %d.%d.%d\n", ver_major, ver_minor,
-		ver_release);
+	pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_minor,
+		ver_release, (gmux_data->is_dpm ? "dpm" : "classic"));
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_PLATFORM;

--------------010506020903040202090003
Content-Type: application/octet-stream;
 name="patch-apple-gmux.txt.sig"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="patch-apple-gmux.txt.sig"

iEYEABECAAYFAlAozBkACgkQ6iVUjPs37Jm1kgCfehodhTDRnBuINhyksjy+EpvQ8UsAn24J
atlIxMfPTrJiJTbKSf1beYzU
--------------010506020903040202090003--
