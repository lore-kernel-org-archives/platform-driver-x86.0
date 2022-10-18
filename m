Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30DEC433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Oct 2022 20:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbiJRUfp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Oct 2022 16:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbiJRUfn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Oct 2022 16:35:43 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C55FBBE08
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:38 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id l5so16930799oif.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CjG+NMIQ//ZWLuNrlaRvo80fl8jOmzVqbwxDK09CXk=;
        b=X5egpnztbAEiRR4SIpW/0Jv8fK9zm1zd7vbhB/2s2IgBp1A9FkJgk7lSCZNz6oUMVh
         LQirwbh3MS/fZECYgkLFRE/wdZpFK8SY7Cf10Hx0HDFJZpjk/62HJObXGX/Crc+B8hhP
         0bStSoKTafzPjZZXX7ZhAZqvPScdhQDdnffSVJA+PzIabdru2OxLxBUa+Z5lb6URg0GO
         XQrGxSPV0EEGczXNzWDC224Dbejkab/Ik4bYynlByUPwd/YvOu81s8SpElCbDCHpNSIr
         pyv0MUinhoCBrO2x6avUTJv2Zu/ek9bB4fsiQejC4eDCxcSLpL0liGkmoyqmjmVVZDdM
         ePtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CjG+NMIQ//ZWLuNrlaRvo80fl8jOmzVqbwxDK09CXk=;
        b=e+5/K5BdD0sX4WDsN0vXHSdzs9xeh87JQ18pa0Wr5Yr4EKo9nFKWqj5qg0oWv/k+ou
         I4DAp7xTZYlOtk3mYFWvntFjy18k/55zXAregFmUFLalt+p9+RnpX/BMbHjJtRzAjPkJ
         B2fTCSRJmdaIkVG52VsSvtgFLiEV7Ezmx0tE5tyzNVwfgBQbLLUNgWKeghTdTLUP8GK/
         7taBOyMZmplRER/ilIUR84rU19hYXFgTVt5fW9Ku6FTpwyYD2BCa2cP4KcevnxLjbLVy
         427TkAi3p5dkL9/R4bYYtTg9sMoD/jfslDk3cs/FgS40HMNO6dGKuUzpBQDrvXsERYr3
         DUKw==
X-Gm-Message-State: ACrzQf1TZl9V3QqBgNtLr2d5AqhVPW4RFIJd8gnyGDxNY+PF2Bjg0mUv
        Hf4R3HR4iIBDODqZSE54O7PVC0UcLyo=
X-Google-Smtp-Source: AMsMyM7nadrH80FG0UtLdQ3pYkscqGMVol2/ywAWHOSiiq+IjI8mdp6y3LtmN6HjE5BCq8feBpRzrQ==
X-Received: by 2002:aca:4b8b:0:b0:355:4433:d3ef with SMTP id y133-20020aca4b8b000000b003554433d3efmr3472419oia.282.1666125337365;
        Tue, 18 Oct 2022 13:35:37 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:6d8c:32db:7793:d4c0])
        by smtp.gmail.com with ESMTPSA id s4-20020a056870248400b00136cfb02a94sm6580722oaq.7.2022.10.18.13.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 13:35:36 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 5/6] Moving existing HP drivers to a central location
Date:   Tue, 18 Oct 2022 15:35:30 -0500
Message-Id: <20221018203531.17130-6-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018203531.17130-1-jorge.lopez2@hp.com>
References: <20221018203531.17130-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose of this patch is to provide a central location where all
HP related drivers are found. HP drivers will recide under hp
directory with exception of hp-bioscfg.  hp-bioscfg is found under
hp/hp-bioscfg/ directory.

Introduced changes to Kconfig file to list all HP driver under "HP X86
Platform Specific Device Drivers" menu option.

Changes needed to relocate hp-bioscfg driver

Relocation of the driver requires minor changes such updating the path
for a local include file.  Additional changes include update MAINTAINERS
file to indicated support status, reviewer, and maintainer of hp-bioscfg
driver.  Lastly, removal of 'stddef' include file from the source.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 MAINTAINERS                                   | 15 ++++--
 drivers/platform/x86/Makefile                 |  5 +-
 drivers/platform/x86/hp/Kconfig               | 51 ++++++++++++++++++-
 drivers/platform/x86/hp/Makefile              | 30 ++++-------
 drivers/platform/x86/hp/hp-bioscfg/Makefile   | 19 +++++++
 .../hp/{ => hp-bioscfg}/biosattr-interface.c  |  1 -
 .../x86/hp/{ => hp-bioscfg}/bioscfg.c         |  2 +-
 .../x86/hp/{ => hp-bioscfg}/bioscfg.h         |  0
 .../x86/hp/{ => hp-bioscfg}/enum-attributes.c |  0
 .../x86/hp/{ => hp-bioscfg}/int-attributes.c  |  0
 .../hp/{ => hp-bioscfg}/ordered-attributes.c  |  0
 .../{ => hp-bioscfg}/passwdattr-interface.c   |  0
 .../{ => hp-bioscfg}/passwdobj-attributes.c   |  0
 .../hp/{ => hp-bioscfg}/spmobj-attributes.c   |  0
 .../hp/{ => hp-bioscfg}/string-attributes.c   |  0
 .../{ => hp-bioscfg}/sureadmin-attributes.c   |  0
 .../{ => hp-bioscfg}/surestart-attributes.c   |  0
 drivers/platform/x86/{ => hp}/hp-wmi.c        |  0
 drivers/platform/x86/{ => hp}/hp_accel.c      |  0
 drivers/platform/x86/{ => hp}/tc1100-wmi.c    |  0
 20 files changed, 92 insertions(+), 31 deletions(-)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/biosattr-interface.c (99%)
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/bioscfg.c (99%)
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/bioscfg.h (100%)
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/enum-attributes.c (100%)
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/int-attributes.c (100%)
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/ordered-attributes.c (100%)
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/passwdattr-interface.c (100%)
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/passwdobj-attributes.c (100%)
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/spmobj-attributes.c (100%)
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/string-attributes.c (100%)
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/sureadmin-attributes.c (100%)
 rename drivers/platform/x86/hp/{ => hp-bioscfg}/surestart-attributes.c (100%)
 rename drivers/platform/x86/{ => hp}/hp-wmi.c (100%)
 rename drivers/platform/x86/{ => hp}/hp_accel.c (100%)
 rename drivers/platform/x86/{ => hp}/tc1100-wmi.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a918c703b63..9ad23364ae69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -120,7 +120,7 @@ Descriptions of section entries and preferred order
 	   matches all files in and below net excluding net/ipv6/
 	N: Files and directories *Regex* patterns.
 	   N:	[^a-z]tegra	all files whose path contains tegra
-	                        (not including files like integrator)
+				(not including files like integrator)
 	   One pattern per line.  Multiple N: lines acceptable.
 	   scripts/get_maintainer.pl has different behavior for files that
 	   match F: pattern and matches of N: patterns.  By default,
@@ -140,8 +140,8 @@ Maintainers List
 ----------------
 
 .. note:: When reading this list, please look for the most precise areas
-          first. When adding to this list, please keep the entries in
-          alphabetical order.
+	  first. When adding to this list, please keep the entries in
+	  alphabetical order.
 
 3C59X NETWORK DRIVER
 M:	Steffen Klassert <klassert@kernel.org>
@@ -9286,10 +9286,15 @@ S:	Obsolete
 W:	http://w1.fi/hostap-driver.html
 F:	drivers/net/wireless/intersil/hostap/
 
+HP BIOSCFG DRIVER
+M:	Jorge Lopez <jorge.lopez2@hp.com>
+S:	Maintained
+F:	drivers/platform/x86/hp/hp-bioscfg/
+
 HP COMPAQ TC1100 TABLET WMI EXTRAS DRIVER
 L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
-F:	drivers/platform/x86/tc1100-wmi.c
+F:	drivers/platform/x86/hp/tc1100-wmi.c
 
 HPET:	High Precision Event Timers driver
 M:	Clemens Ladisch <clemens@ladisch.de>
@@ -11747,7 +11752,7 @@ M:	Eric Piel <eric.piel@tremplin-utc.net>
 S:	Maintained
 F:	Documentation/misc-devices/lis3lv02d.rst
 F:	drivers/misc/lis3lv02d/
-F:	drivers/platform/x86/hp_accel.c
+F:	drivers/platform/x86/hp/hp_accel.c
 
 LIST KUNIT TEST
 M:	David Gow <davidgow@google.com>
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 7f4fdec482a5..ade6d24b441d 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -55,10 +55,7 @@ obj-$(CONFIG_FUJITSU_TABLET)	+= fujitsu-tablet.o
 obj-$(CONFIG_GPD_POCKET_FAN)	+= gpd-pocket-fan.o
 
 # Hewlett Packard
-obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
-obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
-obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
-obj-$(CONFIG_HP_BIOSCFG)        += hp/
++obj-y				+= hp/
 
 # Hewlett Packard Enterprise
 obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
index b17b99449ee5..b0dae087cb2a 100644
--- a/drivers/platform/x86/hp/Kconfig
+++ b/drivers/platform/x86/hp/Kconfig
@@ -5,6 +5,7 @@
 
 menuconfig X86_PLATFORM_DRIVERS_HP
 	bool "HP X86 Platform Specific Device Drivers"
+	default y
 	depends on X86_PLATFORM_DEVICES
 	help
 	  Say Y here to get to see options for device drivers for various
@@ -26,10 +27,58 @@ config HP_BIOSCFG
 	  This driver enables administrators to securely manage BIOS settings
 	  using digital certificates and public-key cryptography that eliminate
 	  the need for passwords for both remote and local management. It supports
-          changing BIOS settings on many HP machines from 2018 and newer without
+	  changing BIOS settings on many HP machines from 2018 and newer without
 	  the use of any additional software.
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called hp-bioscfg.
 
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
 endif # X86_PLATFORM_DRIVERS_HP
diff --git a/drivers/platform/x86/hp/Makefile b/drivers/platform/x86/hp/Makefile
index e3790e223084..acffd5b32af0 100644
--- a/drivers/platform/x86/hp/Makefile
+++ b/drivers/platform/x86/hp/Makefile
@@ -1,19 +1,11 @@
-obj-m           := hp-bioscfg.o
-
-hp-bioscfg-objs := bioscfg.o 	\
-	enum-attributes.o 	\
-	int-attributes.o 	\
-	string-attributes.o 	\
-	passwdobj-attributes.o 	\
-	biosattr-interface.o  	\
-	passwdattr-interface.o 	\
-	ordered-attributes.o 	\
-	surestart-attributes.o 	\
-	spmobj-attributes.o 	\
-	sureadmin-attributes.o
-
-default:
-	make -C /lib/modules/`uname -r`/build M=$(PWD) hp-bioscfg.ko
-
-clean:
-	make -C /lib/modules/`uname -r`/build M=$(PWD) clean
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/x86/hp
+# HP x86 Platform-Specific Drivers
+#
+# Hewlett Packard
+#
+obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
+obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
+obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
+obj-$(CONFIG_HP_BIOSCFG)        += hp-bioscfg/
diff --git a/drivers/platform/x86/hp/hp-bioscfg/Makefile b/drivers/platform/x86/hp/hp-bioscfg/Makefile
new file mode 100644
index 000000000000..e3790e223084
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/Makefile
@@ -0,0 +1,19 @@
+obj-m           := hp-bioscfg.o
+
+hp-bioscfg-objs := bioscfg.o 	\
+	enum-attributes.o 	\
+	int-attributes.o 	\
+	string-attributes.o 	\
+	passwdobj-attributes.o 	\
+	biosattr-interface.o  	\
+	passwdattr-interface.o 	\
+	ordered-attributes.o 	\
+	surestart-attributes.o 	\
+	spmobj-attributes.o 	\
+	sureadmin-attributes.o
+
+default:
+	make -C /lib/modules/`uname -r`/build M=$(PWD) hp-bioscfg.ko
+
+clean:
+	make -C /lib/modules/`uname -r`/build M=$(PWD) clean
diff --git a/drivers/platform/x86/hp/biosattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
similarity index 99%
rename from drivers/platform/x86/hp/biosattr-interface.c
rename to drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
index c983ef21a9ed..f0c919bf3ab0 100644
--- a/drivers/platform/x86/hp/biosattr-interface.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
@@ -8,7 +8,6 @@
 
 #include <linux/wmi.h>
 #include "bioscfg.h"
-#include <stddef.h>
 
 #define SET_DEFAULT_VALUES_METHOD_ID	0x02
 #define SET_BIOS_DEFAULTS_METHOD_ID	0x03
diff --git a/drivers/platform/x86/hp/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
similarity index 99%
rename from drivers/platform/x86/hp/bioscfg.c
rename to drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index ce3226d79696..ef32223bd182 100644
--- a/drivers/platform/x86/hp/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -14,7 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/wmi.h>
 #include "bioscfg.h"
-#include "../firmware_attributes_class.h"
+#include "../../firmware_attributes_class.h"
 #include <linux/nls.h>
 
 MODULE_AUTHOR("Jorge Lopez <jorge.lopez2@hp.com>");
diff --git a/drivers/platform/x86/hp/bioscfg.h b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
similarity index 100%
rename from drivers/platform/x86/hp/bioscfg.h
rename to drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
diff --git a/drivers/platform/x86/hp/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
similarity index 100%
rename from drivers/platform/x86/hp/enum-attributes.c
rename to drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
diff --git a/drivers/platform/x86/hp/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
similarity index 100%
rename from drivers/platform/x86/hp/int-attributes.c
rename to drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
diff --git a/drivers/platform/x86/hp/ordered-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
similarity index 100%
rename from drivers/platform/x86/hp/ordered-attributes.c
rename to drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
diff --git a/drivers/platform/x86/hp/passwdattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
similarity index 100%
rename from drivers/platform/x86/hp/passwdattr-interface.c
rename to drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
diff --git a/drivers/platform/x86/hp/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
similarity index 100%
rename from drivers/platform/x86/hp/passwdobj-attributes.c
rename to drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
diff --git a/drivers/platform/x86/hp/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
similarity index 100%
rename from drivers/platform/x86/hp/spmobj-attributes.c
rename to drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
diff --git a/drivers/platform/x86/hp/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
similarity index 100%
rename from drivers/platform/x86/hp/string-attributes.c
rename to drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
diff --git a/drivers/platform/x86/hp/sureadmin-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
similarity index 100%
rename from drivers/platform/x86/hp/sureadmin-attributes.c
rename to drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
diff --git a/drivers/platform/x86/hp/surestart-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
similarity index 100%
rename from drivers/platform/x86/hp/surestart-attributes.c
rename to drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
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

