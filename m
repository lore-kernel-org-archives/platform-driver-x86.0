Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2C5C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 Oct 2022 20:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiJTUKp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 Oct 2022 16:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbiJTUKm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Oct 2022 16:10:42 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3448613A7E1
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:37 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id l5so884697oif.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTbLj213UZWMtUwJSRrUxAujg0FY+IlyIftXQ7pgyw8=;
        b=ZQs7R2PKX9QZwN8pF+DqkZ6qi7XwuSfPE+2fTwKG4SvxJa/EZomROP2ThAs2ktNIA4
         eBoY9oDXmgr9MgHYXVyGcDCnaQb2fh+wCEo2jiFwoFvVhcH4QcnaY6Yl1w/5sEWP/k1j
         1Pbigpw5CSa5Tj28tlXs2p90I64hdJKthjGlCU4h3TI1zhOPRd0qAeMFK0DJPRqDEozZ
         p7eboou+H4muQ/wRw9epDJ11si8BMHZd1PzbmGIl/uPEOJNBk4vBW+U/S5BP1r/Kjzsu
         7TWyL1ODlAkcU7L3vBmYLlFC3hluyKdirdURdbLoVRp4QtPTJLfKCfxlCyv5XFdCTg/W
         ctQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTbLj213UZWMtUwJSRrUxAujg0FY+IlyIftXQ7pgyw8=;
        b=PknrOjiDyzsSI99q6sII2G8t16nICRCPWhIvfFucfGZWtSYXk+IW7UB9bI+SnKgrW1
         15SFubuTnS1ZtdGVWeowwcv0HdB7drM6YeVo9ZqfraX7EITJ0LxcGxGDxOSS9DpU9KAp
         C8A84lnlGRQYOT5rpWtw587LfRVKdiLPz0z3vCwGeaJKMoo8HqeaKZEJcIyADhPsB8lg
         YN9QxhzbsHNRO2r2lKaaXjrd8O9RxjPDnGFMdRmrMBHK+k6exvJfYexP+QHbgBzQVI72
         IPJbyokgBM7WtWW5fs62Bre1JXOdhJX7cXHxcdDgTXRrR8q+L5vdVom6yZB12SfRoDII
         siHw==
X-Gm-Message-State: ACrzQf0Vhk5kClxmFWkRPyBQegiGqfkDxhUw3o2y0pxYubaIJMTJcq83
        y19e4yRWZ3MTTpCREj1aB6U=
X-Google-Smtp-Source: AMsMyM6MGq6lcg9yLDY+iq1svZ5iRsvlcLN5QmKT3PniGYyA2iKi/2cvKHhgCNNdlMLUfMJx5/MgOA==
X-Received: by 2002:a05:6808:2092:b0:354:d5b3:737a with SMTP id s18-20020a056808209200b00354d5b3737amr22609940oiw.3.1666296636328;
        Thu, 20 Oct 2022 13:10:36 -0700 (PDT)
Received: from grumpy-Fury.hsd1.tx.comcast.net ([2601:2c3:480:7390:ece5:3818:e03c:2cb7])
        by smtp.gmail.com with ESMTPSA id a25-20020a544e19000000b003539686cb7bsm302896oiy.53.2022.10.20.13.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 13:10:35 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 1/6] Moving existing HP drivers to a central location
Date:   Thu, 20 Oct 2022 15:10:28 -0500
Message-Id: <20221020201033.12790-2-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020201033.12790-1-jorge.lopez2@hp.com>
References: <20221020201033.12790-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose of this patch is to provide a central location where all
HP related drivers are found. HP drivers will recide under
drivers/platform/x86/hp directory.

Introduce changes to Kconfig file to list all HP driver under "HP X86
Platform Specific Device Drivers" menu option. Additional changes
include update MAINTAINERS file to indicate hp related drivers new
path.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 MAINTAINERS                                |  4 +-
 drivers/platform/x86/Kconfig               | 80 ++++++----------------
 drivers/platform/x86/Makefile              |  4 +-
 drivers/platform/x86/hp/Kconfig            | 65 ++++++++++++++++++
 drivers/platform/x86/hp/Makefile           | 10 +++
 drivers/platform/x86/{ => hp}/hp-wmi.c     |  0
 drivers/platform/x86/{ => hp}/hp_accel.c   |  0
 drivers/platform/x86/{ => hp}/tc1100-wmi.c |  0
 8 files changed, 98 insertions(+), 65 deletions(-)
 create mode 100644 drivers/platform/x86/hp/Kconfig
 create mode 100644 drivers/platform/x86/hp/Makefile
 rename drivers/platform/x86/{ => hp}/hp-wmi.c (100%)
 rename drivers/platform/x86/{ => hp}/hp_accel.c (100%)
 rename drivers/platform/x86/{ => hp}/tc1100-wmi.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a918c703b63..48f6705c19f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9289,7 +9289,7 @@ F:	drivers/net/wireless/intersil/hostap/
 HP COMPAQ TC1100 TABLET WMI EXTRAS DRIVER
 L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
-F:	drivers/platform/x86/tc1100-wmi.c
+F:	drivers/platform/x86/hp/tc1100-wmi.c
 
 HPET:	High Precision Event Timers driver
 M:	Clemens Ladisch <clemens@ladisch.de>
@@ -11747,7 +11747,7 @@ M:	Eric Piel <eric.piel@tremplin-utc.net>
 S:	Maintained
 F:	Documentation/misc-devices/lis3lv02d.rst
 F:	drivers/misc/lis3lv02d/
-F:	drivers/platform/x86/hp_accel.c
+F:	drivers/platform/x86/hp/hp_accel.c
 
 LIST KUNIT TEST
 M:	David Gow <davidgow@google.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f5312f51de19..731cf9945df5 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -81,7 +81,7 @@ config MXM_WMI
        tristate "WMI support for MXM Laptop Graphics"
        depends on ACPI_WMI
 	help
-          MXM is a standard for laptop graphics cards, the WMI interface
+	  MXM is a standard for laptop graphics cards, the WMI interface
 	  is required for switchable nvidia graphics machines
 
 config PEAQ_WMI
@@ -163,18 +163,18 @@ config ACERHDF
 	  here.
 
 config ACER_WIRELESS
-        tristate "Acer Wireless Radio Control Driver"
-        depends on ACPI
-        depends on INPUT
+	tristate "Acer Wireless Radio Control Driver"
+	depends on ACPI
+	depends on INPUT
 	help
-          The Acer Wireless Radio Control handles the airplane mode hotkey
-          present on new Acer laptops.
+	  The Acer Wireless Radio Control handles the airplane mode hotkey
+	  present on new Acer laptops.
 
-          Say Y or M here if you have an Acer notebook with an airplane mode
-          hotkey.
+	  Say Y or M here if you have an Acer notebook with an airplane mode
+	  hotkey.
 
-          If you choose to compile this driver as a module the module will be
-          called acer-wireless.
+	  If you choose to compile this driver as a module the module will be
+	  called acer-wireless.
 
 config ACER_WMI
 	tristate "Acer WMI Laptop Extras"
@@ -400,17 +400,17 @@ config FUJITSU_TABLET
        depends on ACPI
        depends on INPUT
 	help
-         This is a driver for tablets built by Fujitsu:
+	 This is a driver for tablets built by Fujitsu:
 
-           * Lifebook P1510/P1610/P1620/Txxxx
-           * Stylistic ST5xxx
-           * Possibly other Fujitsu tablet models
+	   * Lifebook P1510/P1610/P1620/Txxxx
+	   * Stylistic ST5xxx
+	   * Possibly other Fujitsu tablet models
 
-         It adds support for the panel buttons, docking station detection,
-         tablet/notebook mode detection for convertible and
-         orientation detection for docked slates.
+	 It adds support for the panel buttons, docking station detection,
+	 tablet/notebook mode detection for convertible and
+	 orientation detection for docked slates.
 
-         If you have a Fujitsu convertible or slate, say Y or M here.
+	 If you have a Fujitsu convertible or slate, say Y or M here.
 
 config GPD_POCKET_FAN
 	tristate "GPD Pocket Fan Controller support"
@@ -424,24 +424,7 @@ config GPD_POCKET_FAN
 	  of the CPU temperature. Say Y or M if the kernel may be used on a
 	  GPD pocket.
 
-config HP_ACCEL
-	tristate "HP laptop accelerometer"
-	depends on INPUT && ACPI
-	depends on SERIO_I8042
-	select SENSORS_LIS3LV02D
-	select NEW_LEDS
-	select LEDS_CLASS
-	help
-	  This driver provides support for the "Mobile Data Protection System 3D"
-	  or "3D DriveGuard" feature of HP laptops. On such systems the driver
-	  should load automatically (via ACPI alias).
-
-	  Support for a led indicating disk protection will be provided as
-	  hp::hddprotect. For more information on the feature, refer to
-	  Documentation/misc-devices/lis3lv02d.rst.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called hp_accel.
+source "drivers/platform/x86/hp/Kconfig"
 
 config WIRELESS_HOTKEY
 	tristate "Wireless hotkey button"
@@ -455,30 +438,6 @@ config WIRELESS_HOTKEY
 	 To compile this driver as a module, choose M here: the module will
 	 be called wireless-hotkey.
 
-config HP_WMI
-	tristate "HP WMI extras"
-	depends on ACPI_WMI
-	depends on INPUT
-	depends on RFKILL || RFKILL = n
-	select INPUT_SPARSEKMAP
-	select ACPI_PLATFORM_PROFILE
-	select HWMON
-	help
-	 Say Y here if you want to support WMI-based hotkeys on HP laptops and
-	 to read data from WMI such as docking or ambient light sensor state.
-
-	 To compile this driver as a module, choose M here: the module will
-	 be called hp-wmi.
-
-config TC1100_WMI
-	tristate "HP Compaq TC1100 Tablet WMI Extras"
-	depends on !X86_64
-	depends on ACPI
-	depends on ACPI_WMI
-	help
-	  This is a driver for the WMI extensions (wireless and bluetooth power
-	  control) of the HP Compaq TC1100 tablet.
-
 config IBM_RTL
 	tristate "Device driver to enable PRTL support"
 	depends on PCI
@@ -1153,3 +1112,4 @@ config P2SB
 	  The main purpose of this library is to unhide P2SB device in case
 	  firmware kept it hidden on some platforms in order to access devices
 	  behind it.
+
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 5a428caa654a..415dc5576396 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -55,9 +55,7 @@ obj-$(CONFIG_FUJITSU_TABLET)	+= fujitsu-tablet.o
 obj-$(CONFIG_GPD_POCKET_FAN)	+= gpd-pocket-fan.o
 
 # Hewlett Packard
-obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
-obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
-obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
+obj-y				+= hp/
 
 # Hewlett Packard Enterprise
 obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
new file mode 100644
index 000000000000..426e3575ddc3
--- /dev/null
+++ b/drivers/platform/x86/hp/Kconfig
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# X86 Platform Specific Drivers
+#
+menuconfig X86_PLATFORM_DRIVERS_HP
+	bool "HP X86 Platform Specific Device Drivers"
+	default y
+	depends on X86_PLATFORM_DEVICES
+	help
+	  Say Y here to get to see options for device drivers for various
+	  HP x86 platforms, including vendor-specific laptop extension drivers.
+	  This option alone does not add any kernel code.
+
+	  If you say N, all options in this submenu will be skipped and disabled.
+
+if X86_PLATFORM_DRIVERS_HP
+
+config HP_ACCEL
+	tristate "HP laptop accelerometer"
+	default m
+	depends on INPUT && ACPI
+	depends on SERIO_I8042
+	select SENSORS_LIS3LV02D
+	select NEW_LEDS
+	select LEDS_CLASS
+	help
+	  This driver provides support for the "Mobile Data Protection System 3D"
+	  or "3D DriveGuard" feature of HP laptops. On such systems the driver
+	  should load automatically (via ACPI alias).
+
+	  Support for a led indicating disk protection will be provided as
+	  hp::hddprotect. For more information on the feature, refer to
+	  Documentation/misc-devices/lis3lv02d.rst.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called hp_accel.
+
+config HP_WMI
+	tristate "HP WMI extras"
+	default m
+	depends on ACPI_WMI
+	depends on INPUT
+	depends on RFKILL || RFKILL = n
+	select INPUT_SPARSEKMAP
+	select ACPI_PLATFORM_PROFILE
+	select HWMON
+	help
+	 Say Y here if you want to support WMI-based hotkeys on HP laptops and
+	 to read data from WMI such as docking or ambient light sensor state.
+
+	 To compile this driver as a module, choose M here: the module will
+	 be called hp-wmi.
+
+config TC1100_WMI
+	tristate "HP Compaq TC1100 Tablet WMI Extras"
+	default m
+	depends on !X86_64
+	depends on ACPI
+	depends on ACPI_WMI
+	help
+	  This is a driver for the WMI extensions (wireless and bluetooth power
+	  control) of the HP Compaq TC1100 tablet.
+
+
+ endif # X86_PLATFORM_DRIVERS_HP
diff --git a/drivers/platform/x86/hp/Makefile b/drivers/platform/x86/hp/Makefile
new file mode 100644
index 000000000000..f651a405e876
--- /dev/null
+++ b/drivers/platform/x86/hp/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/x86/hp
+# x86 Platform-Specific Drivers
+#
+
+# Hewlett Packard
+obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
+obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
+obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
similarity index 100%
rename from drivers/platform/x86/hp-wmi.c
rename to drivers/platform/x86/hp/hp-wmi.c
diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp/hp_accel.c
similarity index 100%
rename from drivers/platform/x86/hp_accel.c
rename to drivers/platform/x86/hp/hp_accel.c
diff --git a/drivers/platform/x86/tc1100-wmi.c b/drivers/platform/x86/hp/tc1100-wmi.c
similarity index 100%
rename from drivers/platform/x86/tc1100-wmi.c
rename to drivers/platform/x86/hp/tc1100-wmi.c
-- 
2.34.1

