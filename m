Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293833;
	b=LPW9taJU+KK2CKo42/KwtPbpb839EuiHxSeZGzX+1n/53E4VfnMxViaWpZsMevqbcrks
	 ZAZosjbDOB5ilWPoglEyWQsImhcu79yn3Mnel0ycKnjxsy6NAmYIkSdXbioSMYrrdOHm4
	 y+1/IjrwFbPOEgRTqR9Oln2/OYQ0XRs4r9nvz636+P5Cm8Yd9X9oJ4YSThYsNx8wWicER
	 ElNx/nLIzHzJwQbaw5CD19fgnu8fctqtseIjXH6wGeIYVo+952ZpcVGvlxD2fSEbB4AG1
	 hhNJw+0dbo0SPEwh6vTWRIVwwQPUGFFl3VZTeqq+oPF4fvE8PVirLyZH6IX3/Z6Sd3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YXYX478RiHpvgKndAlG8KGwbMMAQfIljwa0nG25Ulms=;
	b=OC2nUf0FseKBMoP0SB5Sz/CCPBzr08LIl0wFdbSEPn7IrtVMc2rz1JK4cNAv1UVi/Rdq
	 XL0icmgJrl9FtIXoPh3U5G6FQyErr4/ABN9u7hmom9nSX3R/isFlfHNQVsZUXH7lZ2x8R
	 eK2svhsiOCecmuwEHqwe9Kr9/M3XXvzpiGQNJGAxaw1DXSkOEsYUS6gmBbjGERc2hh+si
	 mYz2a2vgUhKsH3xxjfdRN673q6noSg/COpjERursYu44JdkGBgEzHbnEqKtgc4DN45QG4
	 +5IxK2gRhsFJGgwbq8BbMWauHID6fA4Wf6A5HqGFpXjh4YDwGbePkAfJ1YACojApDPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUUCqYp+;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B633606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 06:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B633606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUUCqYp+
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9d7791b00so14352075ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 22:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293832; x=1794898632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXYX478RiHpvgKndAlG8KGwbMMAQfIljwa0nG25Ulms=;
        b=oUUCqYp+Fu1UQOqpfxfWtk3FTZ6hDm2sfpCBxVl1LmfmqdKMTAvnzF1LUHm9J2yBB+
         cJY8DOiOJ2qvmcyMRKfM13NP57JeFMKIpZ1c8xnVj/Bzs47JxGlKtE5nE0aP1c4gFuaa
         yJi0He+eym963YPan5kR0wWfvoDcXVT1t8po0bNReYi85ZTrkTdzsiR3K9qgxR/LTt1Y
         +5FdexfrIAULcVS+bHbvjJC7Xb1iue+tE4sjeOhRefsjqL9P0xA0CTDaO7xRr2kG0lDX
         a5kL3R1lj8B8NAj2oJcQ2nE3JxYNPDUjpZywj234idkWAU2tXYWS4m6rwTFHaCV0aYoi
         lPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293832; x=1794898632;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXYX478RiHpvgKndAlG8KGwbMMAQfIljwa0nG25Ulms=;
        b=eN5QGMOfhNXxSicFoqndp2Q7qCf8MfM8xXIfOtQh8Zkq49Ef8fM/h5fOWZTD//sSK5
         u60KVb0Ommi4xiFbiC7r26xSPZFx8OlmwMJzjmeyP1BYWJ4L1ycS02I0bnqg1Y9LkA+j
         EShemJXDCUrIyqETJqnjw6AGKmHum91Q59B7K5h3s7ojpue8gfz9fYmrD39PA1uBcDHd
         KbAGtxPggjnRh/EIlsjG+Qll/7TLvP3kjaHMSAXM3+7aHE4EGRbm5hBEbfHoI+ABdmLR
         4gWHSA4sU26BmHKqurieFZCOyZ9IBlV7Lm3kggbtnH6k1mmwMS6IIoJRKmEvrVT3k3ZO
         sJkw==
X-Forwarded-Encrypted: i=1; AL+hErE1Jlhzm2wL+oIher2ZTZlqUxhk80lz9oWF7ZcYFP9sYiqGcfh5mOeg5i2ksiaJPDyheLKzqv7bpghoPFR25hcXe6Xg@vger.kernel.org
X-Gm-Message-State: APuU4Z/8vGsIxDVdhNIP70yv+CmMdQ+IgWzS75xtQlExhDVX+6YkOx54
	Bim1y5brfeQ4AyfxsMQmDv5qhB7ljTIAw/2SVq51xAshmM63aJADm0t6
X-Gm-Gg: AYBFou3bK3VU6Xowx2KthrDJU0AYbpiMvq9/m3Ju7mwV+BR3cIsKDtuOx3u8fBfrE1D
	ws+tOf6kR3++oqMftd/ZHIv+lTz/qWwRZpSLAaMBcwl5+YecSn+uAzinzxxBJnXS70yCuKpv1/z
	02Mi5B2rsvVfV+jmrNyFDcX0X6TOGp1GvwdPmvQaGjDUnRd4N7bZWHi22HL7LIis5VUixZYgmu0
	xhUobFWNNUD5wycvbdM1/F25LUrqL9kSp1IjD21eBglrKkRIDwIX+j0HFThW3cW5k2OeDPUwxc9
	d1QOZj1fSp+V/4mBD08y846Ks95wXX7Y7hzBCSJdeGFd4gYGvvcgo43H1DrQ5yTgIa086Dy57LM
	oRhtRURt9nCvcrekitUXKibZAedjjFSDcnV1Vu6c16cU+HqryPWnfjkuz1MlduoBwElATdkH/xv
	zZEhuIL7Uw504PQQ65v+aj7bSK7kTaCnzeuAMiCfr/Z5bEvCz5VXWNni1lfIJDIK6wpcVfj4jYK
	Pe66Zzyo1LvF3ptDglCwZn5jsOhxJtt0evjReFODT2D9GRn6D9soYNHtleC/GUnSoI1+xPEaJ49
	nQzmoDkN2fFAl0LNt0HShvj30I9Z/n8xQG0zPqMeYaHzPCrwIK5jvVGUZYu7pRSFRQ==
X-Received: by 2002:a17:903:3846:b0:2e9:6972:54d7 with SMTP id d9443c01a7336-2edb924c8f7mr15374415ad.52.1794293831371;
        Mon, 09 Nov 2026 22:57:11 -0800 (PST)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6dd43bbsm5259915ad.57.2026.11.09.22.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:57:10 -0800 (PST)
From: Chipang Kao <prozac2734@gmail.com>
X-Google-Original-From: Chipang Kao <chipang_kao@asus.com>
To: ilpo.jarvinen@linux.intel.com
Cc: W_Armin@gmx.de,
	chipang_kao@asus.com,
	corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	prozac2734@gmail.com,
	scardracs@disroot.org
Subject: [PATCH v6] platform/asus: Move ASUS platform drivers out of drivers/platform/x86
Date: Tue, 10 Nov 2026 14:56:28 +0800
Message-ID: <20261110065630.270276-1-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <23828a34-3d65-c123-f7c3-7c24ac636dfb@linux.intel.com>
References: <23828a34-3d65-c123-f7c3-7c24ac636dfb@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chipang Kao <chipang_kao@asus.com>

ASUS WMI and related platform drivers currently reside under
drivers/platform/x86/. However, with the emergence of ARM64 devices
utilizing ACPI WMI interfaces, maintaining these drivers exclusively
under x86 creates unnecessary architectural restrictions and Kconfig
duplications.

To allow non-x86 architectures (such as ARM64) to select and build
the applicable ASUS platform drivers:
1. Relocate all ASUS platform drivers and headers from
   drivers/platform/x86/ to drivers/platform/asus/.
2. Create dedicated Kconfig and Makefile under drivers/platform/asus/.
3. Update drivers/platform/x86/Kconfig to remove duplicated entries.

Signed-off-by: Chipang Kao <chipang_kao@asus.com>
---
Changes in v6:
- Modify author name

 MAINTAINERS                                   |   8 +-
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/asus/Kconfig                 | 160 ++++++++++++++++++
 drivers/platform/asus/Makefile                |  14 ++
 drivers/platform/{x86 => asus}/asus-armoury.c |   0
 drivers/platform/{x86 => asus}/asus-armoury.h |   0
 drivers/platform/{x86 => asus}/asus-laptop.c  |   0
 drivers/platform/{x86 => asus}/asus-nb-wmi.c  |   0
 .../platform/{x86 => asus}/asus-tf103c-dock.c |   0
 .../platform/{x86 => asus}/asus-wireless.c    |   0
 drivers/platform/{x86 => asus}/asus-wmi.c     |   0
 drivers/platform/{x86 => asus}/asus-wmi.h     |   0
 drivers/platform/{x86 => asus}/eeepc-laptop.c |   0
 drivers/platform/{x86 => asus}/eeepc-wmi.c    |   0
 drivers/platform/x86/Kconfig                  | 152 -----------------
 drivers/platform/x86/Makefile                 |  10 --
 17 files changed, 181 insertions(+), 166 deletions(-)
 create mode 100644 drivers/platform/asus/Kconfig
 create mode 100644 drivers/platform/asus/Makefile
 rename drivers/platform/{x86 => asus}/asus-armoury.c (100%)
 rename drivers/platform/{x86 => asus}/asus-armoury.h (100%)
 rename drivers/platform/{x86 => asus}/asus-laptop.c (100%)
 rename drivers/platform/{x86 => asus}/asus-nb-wmi.c (100%)
 rename drivers/platform/{x86 => asus}/asus-tf103c-dock.c (100%)
 rename drivers/platform/{x86 => asus}/asus-wireless.c (100%)
 rename drivers/platform/{x86 => asus}/asus-wmi.c (100%)
 rename drivers/platform/{x86 => asus}/asus-wmi.h (100%)
 rename drivers/platform/{x86 => asus}/eeepc-laptop.c (100%)
 rename drivers/platform/{x86 => asus}/eeepc-wmi.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..981eb3fdbef4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4226,15 +4226,15 @@ M:	Denis Benato <denis.benato@linux.dev>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 W:	https://asus-linux.org/
-F:	drivers/platform/x86/asus*.c
-F:	drivers/platform/x86/eeepc*.c
+F:	drivers/platform/asus/asus*.c
+F:	drivers/platform/asus/eeepc*.c
 
 ASUS TF103C DOCK DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
-F:	drivers/platform/x86/asus-tf103c-dock.c
+F:	drivers/platform/asus/asus-tf103c-dock.c
 
 ASUS ROG RYUJIN AIO HARDWARE MONITOR DRIVER
 M:	Aleksa Savic <savicaleksa83@gmail.com>
@@ -4246,7 +4246,7 @@ ASUS WIRELESS RADIO CONTROL DRIVER
 M:	João Paulo Rechi Vita <jprvita@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/asus-wireless.c
+F:	drivers/platform/asus/asus-wireless.c
 
 ASUS WMI HARDWARE MONITOR DRIVER
 M:	Ed Brindley <kernel@maidavale.org>
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 312788f249c9..aa004b0e4406 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -22,3 +22,5 @@ source "drivers/platform/arm64/Kconfig"
 source "drivers/platform/raspberrypi/Kconfig"
 
 source "drivers/platform/wmi/Kconfig"
+
+source "drivers/platform/asus/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fa322e7f8716..34e694e6da14 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
 obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= raspberrypi/
 obj-$(CONFIG_ACPI_WMI)		+= wmi/
+obj-y				+= asus/
diff --git a/drivers/platform/asus/Kconfig b/drivers/platform/asus/Kconfig
new file mode 100644
index 000000000000..4b79957f045f
--- /dev/null
+++ b/drivers/platform/asus/Kconfig
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Asus Platform Specific Drivers
+#
+
+if X86_PLATFORM_DEVICES
+
+config ASUS_LAPTOP
+	tristate "Asus Laptop Extras"
+	depends on ACPI
+	select LEDS_CLASS
+	select NEW_LEDS
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on INPUT
+	depends on RFKILL || RFKILL = n
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	select INPUT_SPARSEKMAP
+	help
+	  This is a driver for Asus laptops, Lenovo SL and the Pegatron
+	  Lucid tablet. It may also support some MEDION, JVC or VICTOR
+	  laptops. It makes all the extra buttons generate standard
+	  ACPI events and input events, and on the Lucid the built-in
+	  accelerometer appears as an input device.  It also adds
+	  support for video output switching, LCD backlight control,
+	  Bluetooth and Wlan control, and most importantly, allows you
+	  to blink those fancy LEDs.
+
+	  For more information see <http://acpi4asus.sf.net>.
+
+	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
+
+config ASUS_WIRELESS
+	tristate "Asus Wireless Radio Control Driver"
+	depends on ACPI
+	depends on INPUT
+	select NEW_LEDS
+	select LEDS_CLASS
+	help
+	  The Asus Wireless Radio Control handles the airplane mode hotkey
+	  present on some Asus laptops.
+
+	  Say Y or M here if you have an ASUS notebook with an airplane mode
+	  hotkey.
+
+	  If you choose to compile this driver as a module the module will be
+	  called asus-wireless.
+
+config ASUS_TF103C_DOCK
+	tristate "Asus TF103C 2-in-1 keyboard dock"
+	depends on ACPI
+	depends on I2C
+	depends on INPUT
+	depends on HID
+	depends on GPIOLIB
+	help
+	  This is a driver for the keyboard, touchpad and USB port of the
+	  keyboard dock for the Asus TF103C 2-in-1 tablet.
+
+	  This keyboard dock has its own I2C attached embedded controller
+	  and the keyboard and touchpad are also connected over I2C,
+	  instead of using the usual USB connection. This means that the
+	  keyboard dock requires this special driver to function.
+
+	  If you have an Asus TF103C tablet say Y or M here, for a generic x86
+	  distro config say M here.
+
+config EEEPC_WMI
+	tristate "Eee PC WMI Driver"
+	depends on ASUS_WMI
+	help
+	  This is a driver for newer Eee PC laptops. It adds extra features
+	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
+
+	  For more information, see
+	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
+
+	  If you have an ACPI-WMI compatible Eee PC laptop (>= 1000), say Y or M
+	  here.
+
+config EEEPC_LAPTOP
+	tristate "Eee PC Hotkey Driver"
+	depends on ACPI_EC
+	depends on INPUT
+	depends on RFKILL || RFKILL = n
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on HOTPLUG_PCI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select HWMON
+	select LEDS_CLASS
+	select NEW_LEDS
+	select INPUT_SPARSEKMAP
+	help
+	  This driver supports the Fn-Fx keys on Eee PC laptops.
+
+	  It  also gives access to some extra laptop functionalities like
+	  Bluetooth, backlight and allows powering on/off some other
+	  devices.
+
+	  If you have an Eee PC laptop, say Y or M here. If this driver
+	  doesn't work on your Eee PC, try eeepc-wmi instead.
+
+endif # X86_PLATFORM_DEVICES
+
+config ASUS_ARMOURY
+	tristate "ASUS Armoury driver"
+	depends on ASUS_WMI
+	select FW_ATTR_CLASS
+	help
+	  Say Y here if you have a WMI aware Asus machine and would like to use the
+	  firmware_attributes API to control various settings typically exposed in
+	  the ASUS Armoury Crate application available on Windows.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called asus-armoury.
+
+config ASUS_WMI
+	tristate "ASUS WMI Driver"
+	depends on ACPI_WMI
+	depends on ACPI_BATTERY
+	depends on INPUT
+	depends on HWMON
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on RFKILL || RFKILL = n
+	depends on HOTPLUG_PCI
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on SERIO_I8042 || SERIO_I8042 = n
+	select INPUT_SPARSEKMAP
+	select LEDS_CLASS
+	select NEW_LEDS
+	select ACPI_PLATFORM_PROFILE
+	help
+	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
+	  Asus Notebooks).
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called asus-wmi.
+
+config ASUS_WMI_DEPRECATED_ATTRS
+	bool "BIOS option support in WMI platform (DEPRECATED)"
+	depends on ASUS_WMI
+	default y
+	help
+	  Say Y to expose the configurable BIOS options through the asus-wmi
+	  driver.
+
+	  This can be used with or without the asus-armoury driver which
+	  has the same attributes, but more, and better features.
+
+config ASUS_NB_WMI
+	tristate "Asus Notebook WMI Driver"
+	depends on ASUS_WMI
+	help
+	  This is a driver for newer Asus notebooks. It adds extra features
+	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
+
+	  For more information, see
+	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
+
+	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
+	  here.
diff --git a/drivers/platform/asus/Makefile b/drivers/platform/asus/Makefile
new file mode 100644
index 000000000000..7bb25cba4853
--- /dev/null
+++ b/drivers/platform/asus/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/asus
+# Asus Platform-Specific Drivers
+#
+
+obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
+obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
+obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
+obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
+obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
+obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
+obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
+obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/asus/asus-armoury.c
similarity index 100%
rename from drivers/platform/x86/asus-armoury.c
rename to drivers/platform/asus/asus-armoury.c
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/asus/asus-armoury.h
similarity index 100%
rename from drivers/platform/x86/asus-armoury.h
rename to drivers/platform/asus/asus-armoury.h
diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/asus/asus-laptop.c
similarity index 100%
rename from drivers/platform/x86/asus-laptop.c
rename to drivers/platform/asus/asus-laptop.c
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/asus/asus-nb-wmi.c
similarity index 100%
rename from drivers/platform/x86/asus-nb-wmi.c
rename to drivers/platform/asus/asus-nb-wmi.c
diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/asus/asus-tf103c-dock.c
similarity index 100%
rename from drivers/platform/x86/asus-tf103c-dock.c
rename to drivers/platform/asus/asus-tf103c-dock.c
diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/asus/asus-wireless.c
similarity index 100%
rename from drivers/platform/x86/asus-wireless.c
rename to drivers/platform/asus/asus-wireless.c
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
similarity index 100%
rename from drivers/platform/x86/asus-wmi.c
rename to drivers/platform/asus/asus-wmi.c
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/asus/asus-wmi.h
similarity index 100%
rename from drivers/platform/x86/asus-wmi.h
rename to drivers/platform/asus/asus-wmi.h
diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/asus/eeepc-laptop.c
similarity index 100%
rename from drivers/platform/x86/eeepc-laptop.c
rename to drivers/platform/asus/eeepc-laptop.c
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/asus/eeepc-wmi.c
similarity index 100%
rename from drivers/platform/x86/eeepc-wmi.c
rename to drivers/platform/asus/eeepc-wmi.c
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9ce384e0475e..b2c6cc923694 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -213,123 +213,6 @@ config APPLE_GMUX
 	  graphics as well as the backlight. Currently only backlight
 	  control is supported by the driver.
 
-config ASUS_LAPTOP
-	tristate "Asus Laptop Extras"
-	depends on ACPI
-	select LEDS_CLASS
-	select NEW_LEDS
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on INPUT
-	depends on RFKILL || RFKILL = n
-	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	select INPUT_SPARSEKMAP
-	help
-	  This is a driver for Asus laptops, Lenovo SL and the Pegatron
-	  Lucid tablet. It may also support some MEDION, JVC or VICTOR
-	  laptops. It makes all the extra buttons generate standard
-	  ACPI events and input events, and on the Lucid the built-in
-	  accelerometer appears as an input device.  It also adds
-	  support for video output switching, LCD backlight control,
-	  Bluetooth and Wlan control, and most importantly, allows you
-	  to blink those fancy LEDs.
-
-	  For more information see <http://acpi4asus.sf.net>.
-
-	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
-
-config ASUS_WIRELESS
-	tristate "Asus Wireless Radio Control Driver"
-	depends on ACPI
-	depends on INPUT
-	select NEW_LEDS
-	select LEDS_CLASS
-	help
-	  The Asus Wireless Radio Control handles the airplane mode hotkey
-	  present on some Asus laptops.
-
-	  Say Y or M here if you have an ASUS notebook with an airplane mode
-	  hotkey.
-
-	  If you choose to compile this driver as a module the module will be
-	  called asus-wireless.
-
-config ASUS_ARMOURY
-	tristate "ASUS Armoury driver"
-	depends on ASUS_WMI
-	select FW_ATTR_CLASS
-	help
-	  Say Y here if you have a WMI aware Asus machine and would like to use the
-	  firmware_attributes API to control various settings typically exposed in
-	  the ASUS Armoury Crate application available on Windows.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called asus-armoury.
-
-config ASUS_WMI
-	tristate "ASUS WMI Driver"
-	depends on ACPI_WMI
-	depends on ACPI_BATTERY
-	depends on INPUT
-	depends on HWMON
-	depends on BACKLIGHT_CLASS_DEVICE
-	depends on RFKILL || RFKILL = n
-	depends on HOTPLUG_PCI
-	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	depends on SERIO_I8042 || SERIO_I8042 = n
-	select INPUT_SPARSEKMAP
-	select LEDS_CLASS
-	select NEW_LEDS
-	select ACPI_PLATFORM_PROFILE
-	help
-	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
-	  Asus Notebooks).
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called asus-wmi.
-
-config ASUS_WMI_DEPRECATED_ATTRS
-	bool "BIOS option support in WMI platform (DEPRECATED)"
-	depends on ASUS_WMI
-	default y
-	help
-	  Say Y to expose the configurable BIOS options through the asus-wmi
-	  driver.
-
-	  This can be used with or without the asus-armoury driver which
-	  has the same attributes, but more, and better features.
-
-config ASUS_NB_WMI
-	tristate "Asus Notebook WMI Driver"
-	depends on ASUS_WMI
-	help
-	  This is a driver for newer Asus notebooks. It adds extra features
-	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
-
-	  For more information, see
-	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
-
-	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
-	  here.
-
-config ASUS_TF103C_DOCK
-	tristate "Asus TF103C 2-in-1 keyboard dock"
-	depends on ACPI
-	depends on I2C
-	depends on INPUT
-	depends on HID
-	depends on GPIOLIB
-	help
-	  This is a driver for the keyboard, touchpad and USB port of the
-	  keyboard dock for the Asus TF103C 2-in-1 tablet.
-
-	  This keyboard dock has its own I2C attached embedded controller
-	  and the keyboard and touchpad are also connected over I2C,
-	  instead of using the usual USB connection. This means that the
-	  keyboard dock requires this special driver to function.
-
-	  If you have an Asus TF103C tablet say Y or M here, for a generic x86
-	  distro config say M here.
-
 config AYANEO_EC
 	tristate "Ayaneo EC platform control"
 	depends on DMI
@@ -357,41 +240,6 @@ config MERAKI_MX100
 	  To compile this driver as a module, choose M here: the module
 	  will be called meraki-mx100.
 
-config EEEPC_LAPTOP
-	tristate "Eee PC Hotkey Driver"
-	depends on ACPI_EC
-	depends on INPUT
-	depends on RFKILL || RFKILL = n
-	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	depends on HOTPLUG_PCI
-	depends on BACKLIGHT_CLASS_DEVICE
-	select HWMON
-	select LEDS_CLASS
-	select NEW_LEDS
-	select INPUT_SPARSEKMAP
-	help
-	  This driver supports the Fn-Fx keys on Eee PC laptops.
-
-	  It  also gives access to some extra laptop functionalities like
-	  Bluetooth, backlight and allows powering on/off some other
-	  devices.
-
-	  If you have an Eee PC laptop, say Y or M here. If this driver
-	  doesn't work on your Eee PC, try eeepc-wmi instead.
-
-config EEEPC_WMI
-	tristate "Eee PC WMI Driver"
-	depends on ASUS_WMI
-	help
-	  This is a driver for newer Eee PC laptops. It adds extra features
-	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
-
-	  For more information, see
-	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
-
-	  If you have an ACPI-WMI compatible Eee PC laptop (>= 1000), say Y or M
-	  here.
-
 source "drivers/platform/x86/dell/Kconfig"
 
 config AMILO_RFKILL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 229057234d00..88f45e03ee19 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -28,16 +28,6 @@ obj-$(CONFIG_ADV_SWBUTTON)	+= adv_swbutton.o
 # Apple
 obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
 
-# ASUS
-obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
-obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
-obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
-obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
-obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
-obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
-obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
-obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
-
 # Ayaneo
 obj-$(CONFIG_AYANEO_EC)		+= ayaneo-ec.o
 
-- 
2.43.0

