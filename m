Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBCE45D19E
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984265; cv=none; b=Jk6YnwPpK+QLQ3DbLfikb7VMLlgWNQZNcTJ3X6agk5iADFUCDzDTd6KrTMmpMGEyGaQKNjjAz0bIwv34vEw9iWMXnKhgoWysrTqVn/GUp7zES5mX9VdsbUqnSod5NYCAi66LtxUFzW90P3bqVLOggayrPol2TVHExurNMwoQL5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984265; c=relaxed/simple;
	bh=cZ0O2E+eJdI33nUm8Co5Q6+X3F1m9O6WsXviD5CAOoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZYpV94o80jytODA1NAgApdbINkDJpMY8WW3+XXl8ieXEKmfHvDEHM3ucjwWWZb7r2ap51Cpf6x4DrOV7VuL6ZByFd7FssFbwE9Xfr00smHkK07FUEavt3DPk27d/+F1NVMOiuw+NLoJbP/y2VlYL4uDxRYoARGoOc54bmfHxItA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6DekRhI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6DekRhI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso24279365ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 02:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789984263; x=1790589063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2F4CK2PTrv6qOUar6yzK/p6Y6e6mva4yc9+tBH2wH3A=;
        b=D6DekRhINF1myGt08T3YCWP+VXHuXI95PGMXttixFWgf/VmEqQyLRAlZJVSVbqYON+
         kNYvc+h49JUHJhBaUSHfYzF1Muo3ISqzgp+9jnyGGL0lnVLgNyZAhgJR7nRpz3BkdfMa
         qBzAWXs7x8R44WS7SD6Hg2xArKaQ9Gxw8Dj+DbUsVkYid+ZUyu2QOYD8vQCskNTspWeF
         AGZQJRGft4rtomIxKdTYVIk0A+BSItjkppe3NTkMoF2vZltbXuffyh4rCFJINwyG7AWB
         NKNKmffZ/X+OxbcDPut0/xEcVEF/I9f44V9VYRapVHUb81MZwpH03zMoCdmWCeYulCcv
         DiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984263; x=1790589063;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2F4CK2PTrv6qOUar6yzK/p6Y6e6mva4yc9+tBH2wH3A=;
        b=hy1yliYWnm1C2AohInExGWwc7040igKEZT4OR6aneLLRU9MUSRwoqdR/wQ8QB0LKFa
         OXGKnOGkfMuZ4WxbsDp0tbvBHlYY4V5D9c6B/1nG7vqnZP42Jv0gymQXlvixA1/qL5kQ
         ZdOxdWabQU+C28O4uMqfVZ4ik1S5SuEs6CblJgVBosh3eW7yN0V1VWk6sofSBlzrDwFM
         oGqGSXPgOEWCjen17r49aiaa7QRW+/9wShMDItzQ6cNFsGt7fL87rKf9d/6hOr1KSePP
         LmcfOPwgFEpj0WvCv0j2C7Ym4aZPTTEPgaM4nxOf/MHCTMPKlxZqhU1VAuX3vKmkqJ6W
         QRQw==
X-Forwarded-Encrypted: i=1; AKwUvBzvaCAVio84A+K0KF9ZI9GAzGTbPx9noZKqDVX3h5t13Ax0Ly586sFcTRs/iIVqI3DM/HCS73zf0Qt7rW6KFNr+0n4E@vger.kernel.org
X-Gm-Message-State: AFuF++mf70Q9i7FM5lual+h+3K+Z5hx+9Mk2g61I4cKY+MJp4wTnNNp3
	YcBcGEIvyf4homMArWA8UHj4JVm8FESeXW1vhG1bmATyejMpvxF0h65e
X-Gm-Gg: AYBFou3Z6LP8Cn+aFn9dy8F0cmU76IXzIUuwnykhSkUvthcI3gVGBmTokHdorf6Trla
	aFMK7bpczWrFDYHSMfqn1oZEwOo3ZO8kYTe/CYo+yijIUVnEWBj32C6IkeyyfBoGviv5cAp/9mw
	taIe3aOy5WB5L6ZJOM1nV93aEi9JyrGjLIk9cA4vCL/Yoq8v3Mhs8QCCdSLcmhBBWMZJFNCY7ll
	dTnQOOBNkvKB78TgQ+wg0pgKQIrHg6sJWKB6+/Fm/iJf8VUi1EqPNff/wOs5TSJ77tYkDq+EiCS
	oKtLz5QL+wd3mFnD7zZ1anBQGM5IQLJZYAFO4ypAz30/k6qh+tSUu5zWTPlf+ncTQvCiXI3/oA1
	AglxWK46spCUSsxMvpnvlwEWXzdJMHkxGO32GhFG7zxamh4zGANkdNhslKp1lSnnJLRe18F9ThI
	l3X88nf7IVY+u+jbA0SAwfjfr/mabzPTBnLkMJRf+KOCOrD/8NTWh3CDca0Vpc5+z/xduhFkJa2
	iuGTim5XVMrEax2axRvp2qAHNWNWuZ64YM=
X-Received: by 2002:a17:903:2f03:b0:2d7:1858:1d96 with SMTP id d9443c01a7336-2dd9c7c2906mr159974055ad.7.1789984262990;
        Mon, 21 Sep 2026 02:51:02 -0700 (PDT)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba45fsm31317095ad.50.2026.09.21.02.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:02 -0700 (PDT)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	jprvita@gmail.com,
	scardracs@disroot.org,
	bryan.odonoghue@linaro.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chipang_kao <chipang_kao@asus.com>
Subject: [PATCH v2] platform/wmi: Move ASUS platform drivers from x86 to wmi/asus
Date: Mon, 21 Sep 2026 17:48:42 +0800
Message-ID: <20260921094941.261599-1-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2384d8f5-106c-4cbd-a119-62d923725bf7@kernel.org>
References: <2384d8f5-106c-4cbd-a119-62d923725bf7@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ASUS WMI and related platform drivers currently reside under
drivers/platform/x86/. However, with ARM64 devices utilizing ACPI WMI
interfaces, maintaining these drivers exclusively under x86 creates
unnecessary architectural restrictions and Kconfig duplications.

To allow ARM64 architectures to build and utilize ASUS WMI drivers
cleanly:
1. Relocate all ASUS platform drivers and headers from
   drivers/platform/x86/ to drivers/platform/wmi/asus/.
2. Create dedicated Kconfig and Makefile under
   drivers/platform/wmi/asus/ and source them in
   drivers/platform/wmi/Kconfig and Makefile.
3. Update drivers/platform/x86/Kconfig to remove duplicated entries
   and source the unified WMI-based ASUS configuration.

No functional code logic changes are introduced in this patch; this is
a pure code relocation and build infrastructure refactoring.

Signed-off-by: chipang_kao <chipang_kao@asus.com>
---

Changes in v2:
- Relocated ASUS platform drivers from drivers/platform/x86/ to
  drivers/platform/wmi/asus/ to eliminate Kconfig duplication and
  architectural restrictions for ARM64 platforms.
- Dropped patch 1/2 from the original series as CONFIG_ACPI_WMI
  dependency changes are covered by Armin's WMI refactoring series.
- Updated MAINTAINERS file to reflect the new path.

 MAINTAINERS                                   |   6 +-
 drivers/platform/wmi/Makefile                 |   1 +
 drivers/platform/wmi/asus/Kconfig             | 123 ++++++++++++++++++
 drivers/platform/wmi/asus/Makefile            |  12 ++
 .../platform/{x86 => wmi/asus}/asus-armoury.c |   0
 .../platform/{x86 => wmi/asus}/asus-armoury.h |   0
 .../platform/{x86 => wmi/asus}/asus-laptop.c  |   0
 .../platform/{x86 => wmi/asus}/asus-nb-wmi.c  |   0
 .../{x86 => wmi/asus}/asus-tf103c-dock.c      |   0
 .../{x86 => wmi/asus}/asus-wireless.c         |   0
 drivers/platform/{x86 => wmi/asus}/asus-wmi.c |   0
 drivers/platform/{x86 => wmi/asus}/asus-wmi.h |   0
 drivers/platform/x86/Kconfig                  | 117 -----------------
 13 files changed, 139 insertions(+), 120 deletions(-)
 create mode 100644 drivers/platform/wmi/asus/Kconfig
 create mode 100644 drivers/platform/wmi/asus/Makefile
 rename drivers/platform/{x86 => wmi/asus}/asus-armoury.c (100%)
 rename drivers/platform/{x86 => wmi/asus}/asus-armoury.h (100%)
 rename drivers/platform/{x86 => wmi/asus}/asus-laptop.c (100%)
 rename drivers/platform/{x86 => wmi/asus}/asus-nb-wmi.c (100%)
 rename drivers/platform/{x86 => wmi/asus}/asus-tf103c-dock.c (100%)
 rename drivers/platform/{x86 => wmi/asus}/asus-wireless.c (100%)
 rename drivers/platform/{x86 => wmi/asus}/asus-wmi.c (100%)
 rename drivers/platform/{x86 => wmi/asus}/asus-wmi.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..25e4030e24b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4124,7 +4124,7 @@ M:	Denis Benato <denis.benato@linux.dev>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 W:	https://asus-linux.org/
-F:	drivers/platform/x86/asus*.c
+F:	drivers/platform/wmi/asus/asus*.c
 F:	drivers/platform/x86/eeepc*.c
 
 ASUS TF103C DOCK DRIVER
@@ -4132,7 +4132,7 @@ M:	Hans de Goede <hansg@kernel.org>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
-F:	drivers/platform/x86/asus-tf103c-dock.c
+F:	drivers/platform/wmi/asus/asus-tf103c-dock.c
 
 ASUS ROG RYUJIN AIO HARDWARE MONITOR DRIVER
 M:	Aleksa Savic <savicaleksa83@gmail.com>
@@ -4144,7 +4144,7 @@ ASUS WIRELESS RADIO CONTROL DRIVER
 M:	João Paulo Rechi Vita <jprvita@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/asus-wireless.c
+F:	drivers/platform/wmi/asus/asus-wireless.c
 
 ASUS WMI HARDWARE MONITOR DRIVER
 M:	Ed Brindley <kernel@maidavale.org>
diff --git a/drivers/platform/wmi/Makefile b/drivers/platform/wmi/Makefile
index 2feff94a5594..305f4688324f 100644
--- a/drivers/platform/wmi/Makefile
+++ b/drivers/platform/wmi/Makefile
@@ -6,6 +6,7 @@
 
 wmi-y			:= core.o marshalling.o string.o
 obj-$(CONFIG_ACPI_WMI)	+= wmi.o
+obj-$(CONFIG_ASUS_WMI) += asus/
 
 # Unit tests
 obj-y			+= tests/
diff --git a/drivers/platform/wmi/asus/Kconfig b/drivers/platform/wmi/asus/Kconfig
new file mode 100644
index 000000000000..f7caf1450a5d
--- /dev/null
+++ b/drivers/platform/wmi/asus/Kconfig
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Asus Platform Specific Drivers
+#
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
+
diff --git a/drivers/platform/wmi/asus/Makefile b/drivers/platform/wmi/asus/Makefile
new file mode 100644
index 000000000000..0cee8db2d9d8
--- /dev/null
+++ b/drivers/platform/wmi/asus/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/wmi/asus
+# Asus Platform-Specific Drivers
+#
+
+obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
+obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
+obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
+obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
+obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
+obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/wmi/asus/asus-armoury.c
similarity index 100%
rename from drivers/platform/x86/asus-armoury.c
rename to drivers/platform/wmi/asus/asus-armoury.c
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/wmi/asus/asus-armoury.h
similarity index 100%
rename from drivers/platform/x86/asus-armoury.h
rename to drivers/platform/wmi/asus/asus-armoury.h
diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/wmi/asus/asus-laptop.c
similarity index 100%
rename from drivers/platform/x86/asus-laptop.c
rename to drivers/platform/wmi/asus/asus-laptop.c
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/wmi/asus/asus-nb-wmi.c
similarity index 100%
rename from drivers/platform/x86/asus-nb-wmi.c
rename to drivers/platform/wmi/asus/asus-nb-wmi.c
diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/wmi/asus/asus-tf103c-dock.c
similarity index 100%
rename from drivers/platform/x86/asus-tf103c-dock.c
rename to drivers/platform/wmi/asus/asus-tf103c-dock.c
diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/wmi/asus/asus-wireless.c
similarity index 100%
rename from drivers/platform/x86/asus-wireless.c
rename to drivers/platform/wmi/asus/asus-wireless.c
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/wmi/asus/asus-wmi.c
similarity index 100%
rename from drivers/platform/x86/asus-wmi.c
rename to drivers/platform/wmi/asus/asus-wmi.c
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/wmi/asus/asus-wmi.h
similarity index 100%
rename from drivers/platform/x86/asus-wmi.h
rename to drivers/platform/wmi/asus/asus-wmi.h
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 957034f39e4e..257404b3fd44 100644
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
-- 
2.43.0

