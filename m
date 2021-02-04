Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA70C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 20:40:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF79064F45
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 20:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhBDUkq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 15:40:46 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:49944 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhBDUkp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 15:40:45 -0500
Date:   Thu, 04 Feb 2021 20:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612471199;
        bh=6zLUuzuXYJeKd6+P1kp7fPjwiTAjnlkcbRP860RMBPs=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=Hx8PsoZf7eo/1abFnnFgSdDPHCJbsezCvGvNXJqIjrRFfXVlDzrVoM5ovQr1Fydaj
         8sxbVuzgh58PlcIosHJuEP7wd/+yqRbcbM+mxGyeZXRDXJY7i6y9qG0Iy0S5WJF8cY
         KQpe+lGeO2Lw1dc9N5H6Ocht3mKvsaXTKQzIgSu8=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Pearson <markpearson@lenovo.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH 1/2] platform/x86: move thinkpad_acpi and ideapad-laptop into lenovo subfolder
Message-ID: <20210204203933.559752-2-pobrn@protonmail.com>
In-Reply-To: <20210204203933.559752-1-pobrn@protonmail.com>
References: <20210204203933.559752-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For better manageability and as preparation for extracting the common
DYTC code from both drivers, move them into a dedicated folder.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

 create mode 100644 drivers/platform/x86/lenovo/Kconfig
 create mode 100644 drivers/platform/x86/lenovo/Makefile
 rename drivers/platform/x86/{ =3D> lenovo}/ideapad-laptop.c (100%)
 rename drivers/platform/x86/{ =3D> lenovo}/thinkpad_acpi.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34bfa5c1aec5..ddbec78fbac4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8584,7 +8584,7 @@ M:=09Ike Panhc <ike.pan@canonical.com>
 L:=09platform-driver-x86@vger.kernel.org
 S:=09Maintained
 W:=09http://launchpad.net/ideapad-laptop
-F:=09drivers/platform/x86/ideapad-laptop.c
+F:=09drivers/platform/x86/lenovo/ideapad-laptop.c
=20
 IDEAPAD LAPTOP SLIDEBAR DRIVER
 M:=09Andrey Moiseev <o2g.org.ru@gmail.com>
@@ -17648,7 +17648,7 @@ S:=09Maintained
 W:=09http://ibm-acpi.sourceforge.net
 W:=09http://thinkwiki.org/wiki/Ibm-acpi
 T:=09git git://repo.or.cz/linux-2.6/linux-acpi-2.6/ibm-acpi-2.6.git
-F:=09drivers/platform/x86/thinkpad_acpi.c
+F:=09drivers/platform/x86/lenovo/thinkpad_acpi.c
=20
 THUNDERBOLT DMA TRAFFIC TEST DRIVER
 M:=09Isaac Hazan <isaac.hazan@intel.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 56353e8c792a..200e9961348a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -442,22 +442,6 @@ config IBM_RTL
 =09 state =3D 0 (BIOS SMIs on)
 =09 state =3D 1 (BIOS SMIs off)
=20
-config IDEAPAD_LAPTOP
-=09tristate "Lenovo IdeaPad Laptop Extras"
-=09depends on ACPI
-=09depends on RFKILL && INPUT
-=09depends on SERIO_I8042
-=09depends on BACKLIGHT_CLASS_DEVICE
-=09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
-=09depends on ACPI_WMI || ACPI_WMI =3D n
-=09depends on ACPI_PLATFORM_PROFILE
-=09select INPUT_SPARSEKMAP
-=09select NEW_LEDS
-=09select LEDS_CLASS
-=09help
-=09  This is a driver for Lenovo IdeaPad netbooks contains drivers for
-=09  rfkill switch, hotkey, fan control and backlight control.
-
 config SENSORS_HDAPS
 =09tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
 =09depends on INPUT
@@ -476,145 +460,7 @@ config SENSORS_HDAPS
 =09  Say Y here if you have an applicable laptop and want to experience
 =09  the awesome power of hdaps.
=20
-config THINKPAD_ACPI
-=09tristate "ThinkPad ACPI Laptop Extras"
-=09depends on ACPI
-=09depends on ACPI_BATTERY
-=09depends on INPUT
-=09depends on RFKILL || RFKILL =3D n
-=09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
-=09depends on BACKLIGHT_CLASS_DEVICE
-=09depends on ACPI_PLATFORM_PROFILE
-=09select HWMON
-=09select NVRAM
-=09select NEW_LEDS
-=09select LEDS_CLASS
-=09select LEDS_TRIGGERS
-=09select LEDS_TRIGGER_AUDIO
-=09help
-=09  This is a driver for the IBM and Lenovo ThinkPad laptops. It adds
-=09  support for Fn-Fx key combinations, Bluetooth control, video
-=09  output switching, ThinkLight control, UltraBay eject and more.
-=09  For more information about this driver see
-=09  <file:Documentation/admin-guide/laptops/thinkpad-acpi.rst> and
-=09  <http://ibm-acpi.sf.net/> .
-
-=09  This driver was formerly known as ibm-acpi.
-
-=09  Extra functionality will be available if the rfkill (CONFIG_RFKILL)
-=09  and/or ALSA (CONFIG_SND) subsystems are available in the kernel.
-=09  Note that if you want ThinkPad-ACPI to be built-in instead of
-=09  modular, ALSA and rfkill will also have to be built-in.
-
-=09  If you have an IBM or Lenovo ThinkPad laptop, say Y or M here.
-
-config THINKPAD_ACPI_ALSA_SUPPORT
-=09bool "Console audio control ALSA interface"
-=09depends on THINKPAD_ACPI
-=09depends on SND
-=09depends on SND =3D y || THINKPAD_ACPI =3D SND
-=09default y
-=09help
-=09  Enables monitoring of the built-in console audio output control
-=09  (headphone and speakers), which is operated by the mute and (in
-=09  some ThinkPad models) volume hotkeys.
-
-=09  If this option is enabled, ThinkPad-ACPI will export an ALSA card
-=09  with a single read-only mixer control, which should be used for
-=09  on-screen-display feedback purposes by the Desktop Environment.
-
-=09  Optionally, the driver will also allow software control (the
-=09  ALSA mixer will be made read-write).  Please refer to the driver
-=09  documentation for details.
-
-=09  All IBM models have both volume and mute control.  Newer Lenovo
-=09  models only have mute control (the volume hotkeys are just normal
-=09  keys and volume control is done through the main HDA mixer).
-
-config THINKPAD_ACPI_DEBUGFACILITIES
-=09bool "Maintainer debug facilities"
-=09depends on THINKPAD_ACPI
-=09help
-=09  Enables extra stuff in the thinkpad-acpi which is completely useless
-=09  for normal use.  Read the driver source to find out what it does.
-
-=09  Say N here, unless you were told by a kernel maintainer to do
-=09  otherwise.
-
-config THINKPAD_ACPI_DEBUG
-=09bool "Verbose debug mode"
-=09depends on THINKPAD_ACPI
-=09help
-=09  Enables extra debugging information, at the expense of a slightly
-=09  increase in driver size.
-
-=09  If you are not sure, say N here.
-
-config THINKPAD_ACPI_UNSAFE_LEDS
-=09bool "Allow control of important LEDs (unsafe)"
-=09depends on THINKPAD_ACPI
-=09help
-=09  Overriding LED state on ThinkPads can mask important
-=09  firmware alerts (like critical battery condition), or misled
-=09  the user into damaging the hardware (undocking or ejecting
-=09  the bay while buses are still active), etc.
-
-=09  LED control on the ThinkPad is write-only (with very few
-=09  exceptions on very ancient models), which makes it
-=09  impossible to know beforehand if important information will
-=09  be lost when one changes LED state.
-
-=09  Users that know what they are doing can enable this option
-=09  and the driver will allow control of every LED, including
-=09  the ones on the dock stations.
-
-=09  Never enable this option on a distribution kernel.
-
-=09  Say N here, unless you are building a kernel for your own
-=09  use, and need to control the important firmware LEDs.
-
-config THINKPAD_ACPI_VIDEO
-=09bool "Video output control support"
-=09depends on THINKPAD_ACPI
-=09default y
-=09help
-=09  Allows the thinkpad_acpi driver to provide an interface to control
-=09  the various video output ports.
-
-=09  This feature often won't work well, depending on ThinkPad model,
-=09  display state, video output devices in use, whether there is a X
-=09  server running, phase of the moon, and the current mood of
-=09  Schroedinger's cat.  If you can use X.org's RandR to control
-=09  your ThinkPad's video output ports instead of this feature,
-=09  don't think twice: do it and say N here to save memory and avoid
-=09  bad interactions with X.org.
-
-=09  NOTE: access to this feature is limited to processes with the
-=09  CAP_SYS_ADMIN capability, to avoid local DoS issues in platforms
-=09  where it interacts badly with X.org.
-
-=09  If you are not sure, say Y here but do try to check if you could
-=09  be using X.org RandR instead.
-
-config THINKPAD_ACPI_HOTKEY_POLL
-=09bool "Support NVRAM polling for hot keys"
-=09depends on THINKPAD_ACPI
-=09default y
-=09help
-=09  Some thinkpad models benefit from NVRAM polling to detect a few of
-=09  the hot key press events.  If you know your ThinkPad model does not
-=09  need to do NVRAM polling to support any of the hot keys you use,
-=09  unselecting this option will save about 1kB of memory.
-
-=09  ThinkPads T40 and newer, R52 and newer, and X31 and newer are
-=09  unlikely to need NVRAM polling in their latest BIOS versions.
-
-=09  NVRAM polling can detect at most the following keys: ThinkPad/Access
-=09  IBM, Zoom, Switch Display (fn+F7), ThinkLight, Volume up/down/mute,
-=09  Brightness up/down, Display Expand (fn+F8), Hibernate (fn+F12).
-
-=09  If you are not sure, say Y here.  The driver enables polling only if
-=09  it is strictly necessary to do so.
+source "drivers/platform/x86/lenovo/Kconfig"
=20
 config INTEL_ATOMISP2_LED
 =09tristate "Intel AtomISP2 camera LED driver"
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 60d554073749..2e6b30f0113c 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -56,10 +56,9 @@ obj-$(CONFIG_TC1100_WMI)=09+=3D tc1100-wmi.o
 obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o
=20
 # IBM Thinkpad and Lenovo
-obj-$(CONFIG_IBM_RTL)=09=09+=3D ibm_rtl.o
-obj-$(CONFIG_IDEAPAD_LAPTOP)=09+=3D ideapad-laptop.o
-obj-$(CONFIG_SENSORS_HDAPS)=09+=3D hdaps.o
-obj-$(CONFIG_THINKPAD_ACPI)=09+=3D thinkpad_acpi.o
+obj-$(CONFIG_IBM_RTL)=09=09=09  +=3D ibm_rtl.o
+obj-$(CONFIG_SENSORS_HDAPS)=09=09  +=3D hdaps.o
+obj-$(CONFIG_X86_PLATFORM_DRIVERS_LENOVO) +=3D lenovo/
=20
 # Intel
 obj-$(CONFIG_INTEL_ATOMISP2_LED)=09+=3D intel_atomisp2_led.o
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/len=
ovo/Kconfig
new file mode 100644
index 000000000000..47d35cdddf4d
--- /dev/null
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -0,0 +1,177 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Lenovo x86 platform drivers
+#
+
+menuconfig X86_PLATFORM_DRIVERS_LENOVO
+=09bool "Lenovo x86 platform drivers"
+=09default n
+=09depends on X86_PLATFORM_DEVICES
+=09help
+=09  Say Y here to get to see options for device drivers for various
+=09  Lenovo x86 platforms, including vendor-specific laptop extension driv=
ers.
+=09  This option alone does not add any kernel code.
+
+=09  If you say N, all options in this submenu will be skipped and disable=
d.
+
+if X86_PLATFORM_DRIVERS_LENOVO
+
+config IDEAPAD_LAPTOP
+=09tristate "Lenovo IdeaPad Laptop Extras"
+=09default m
+=09depends on ACPI
+=09depends on RFKILL && INPUT
+=09depends on SERIO_I8042
+=09depends on BACKLIGHT_CLASS_DEVICE
+=09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
+=09depends on ACPI_WMI || ACPI_WMI =3D n
+=09depends on ACPI_PLATFORM_PROFILE
+=09select INPUT_SPARSEKMAP
+=09select NEW_LEDS
+=09select LEDS_CLASS
+=09help
+=09  This is a driver for Lenovo IdeaPad netbooks contains drivers for
+=09  rfkill switch, hotkey, fan control and backlight control.
+
+config THINKPAD_ACPI
+=09tristate "ThinkPad ACPI Laptop Extras"
+=09default m
+=09depends on ACPI
+=09depends on ACPI_BATTERY
+=09depends on INPUT
+=09depends on RFKILL || RFKILL =3D n
+=09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
+=09depends on BACKLIGHT_CLASS_DEVICE
+=09depends on ACPI_PLATFORM_PROFILE
+=09select HWMON
+=09select NVRAM
+=09select NEW_LEDS
+=09select LEDS_CLASS
+=09select LEDS_TRIGGERS
+=09select LEDS_TRIGGER_AUDIO
+=09help
+=09  This is a driver for the IBM and Lenovo ThinkPad laptops. It adds
+=09  support for Fn-Fx key combinations, Bluetooth control, video
+=09  output switching, ThinkLight control, UltraBay eject and more.
+=09  For more information about this driver see
+=09  <file:Documentation/admin-guide/laptops/thinkpad-acpi.rst> and
+=09  <http://ibm-acpi.sf.net/> .
+
+=09  This driver was formerly known as ibm-acpi.
+
+=09  Extra functionality will be available if the rfkill (CONFIG_RFKILL)
+=09  and/or ALSA (CONFIG_SND) subsystems are available in the kernel.
+=09  Note that if you want ThinkPad-ACPI to be built-in instead of
+=09  modular, ALSA and rfkill will also have to be built-in.
+
+=09  If you have an IBM or Lenovo ThinkPad laptop, say Y or M here.
+
+config THINKPAD_ACPI_ALSA_SUPPORT
+=09bool "Console audio control ALSA interface"
+=09depends on THINKPAD_ACPI
+=09depends on SND
+=09depends on SND =3D y || THINKPAD_ACPI =3D SND
+=09default y
+=09help
+=09  Enables monitoring of the built-in console audio output control
+=09  (headphone and speakers), which is operated by the mute and (in
+=09  some ThinkPad models) volume hotkeys.
+
+=09  If this option is enabled, ThinkPad-ACPI will export an ALSA card
+=09  with a single read-only mixer control, which should be used for
+=09  on-screen-display feedback purposes by the Desktop Environment.
+
+=09  Optionally, the driver will also allow software control (the
+=09  ALSA mixer will be made read-write).  Please refer to the driver
+=09  documentation for details.
+
+=09  All IBM models have both volume and mute control.  Newer Lenovo
+=09  models only have mute control (the volume hotkeys are just normal
+=09  keys and volume control is done through the main HDA mixer).
+
+config THINKPAD_ACPI_DEBUGFACILITIES
+=09bool "Maintainer debug facilities"
+=09depends on THINKPAD_ACPI
+=09help
+=09  Enables extra stuff in the thinkpad-acpi which is completely useless
+=09  for normal use.  Read the driver source to find out what it does.
+
+=09  Say N here, unless you were told by a kernel maintainer to do
+=09  otherwise.
+
+config THINKPAD_ACPI_DEBUG
+=09bool "Verbose debug mode"
+=09depends on THINKPAD_ACPI
+=09help
+=09  Enables extra debugging information, at the expense of a slightly
+=09  increase in driver size.
+
+=09  If you are not sure, say N here.
+
+config THINKPAD_ACPI_UNSAFE_LEDS
+=09bool "Allow control of important LEDs (unsafe)"
+=09depends on THINKPAD_ACPI
+=09help
+=09  Overriding LED state on ThinkPads can mask important
+=09  firmware alerts (like critical battery condition), or misled
+=09  the user into damaging the hardware (undocking or ejecting
+=09  the bay while buses are still active), etc.
+
+=09  LED control on the ThinkPad is write-only (with very few
+=09  exceptions on very ancient models), which makes it
+=09  impossible to know beforehand if important information will
+=09  be lost when one changes LED state.
+
+=09  Users that know what they are doing can enable this option
+=09  and the driver will allow control of every LED, including
+=09  the ones on the dock stations.
+
+=09  Never enable this option on a distribution kernel.
+
+=09  Say N here, unless you are building a kernel for your own
+=09  use, and need to control the important firmware LEDs.
+
+config THINKPAD_ACPI_VIDEO
+=09bool "Video output control support"
+=09depends on THINKPAD_ACPI
+=09default y
+=09help
+=09  Allows the thinkpad_acpi driver to provide an interface to control
+=09  the various video output ports.
+
+=09  This feature often won't work well, depending on ThinkPad model,
+=09  display state, video output devices in use, whether there is a X
+=09  server running, phase of the moon, and the current mood of
+=09  Schroedinger's cat.  If you can use X.org's RandR to control
+=09  your ThinkPad's video output ports instead of this feature,
+=09  don't think twice: do it and say N here to save memory and avoid
+=09  bad interactions with X.org.
+
+=09  NOTE: access to this feature is limited to processes with the
+=09  CAP_SYS_ADMIN capability, to avoid local DoS issues in platforms
+=09  where it interacts badly with X.org.
+
+=09  If you are not sure, say Y here but do try to check if you could
+=09  be using X.org RandR instead.
+
+config THINKPAD_ACPI_HOTKEY_POLL
+=09bool "Support NVRAM polling for hot keys"
+=09depends on THINKPAD_ACPI
+=09default y
+=09help
+=09  Some thinkpad models benefit from NVRAM polling to detect a few of
+=09  the hot key press events.  If you know your ThinkPad model does not
+=09  need to do NVRAM polling to support any of the hot keys you use,
+=09  unselecting this option will save about 1kB of memory.
+
+=09  ThinkPads T40 and newer, R52 and newer, and X31 and newer are
+=09  unlikely to need NVRAM polling in their latest BIOS versions.
+
+=09  NVRAM polling can detect at most the following keys: ThinkPad/Access
+=09  IBM, Zoom, Switch Display (fn+F7), ThinkLight, Volume up/down/mute,
+=09  Brightness up/down, Display Expand (fn+F8), Hibernate (fn+F12).
+
+=09  If you are not sure, say Y here.  The driver enables polling only if
+=09  it is strictly necessary to do so.
+
+endif # X86_PLATFORM_DRIVERS_LENOVO
diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/le=
novo/Makefile
new file mode 100644
index 000000000000..c84d0ae5db3d
--- /dev/null
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/x86/lenovo
+# Lenovo x86 platform drivers
+#
+
+obj-$(CONFIG_IDEAPAD_LAPTOP) +=3D ideapad-laptop.o
+obj-$(CONFIG_THINKPAD_ACPI)  +=3D thinkpad_acpi.o
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/l=
enovo/ideapad-laptop.c
similarity index 100%
rename from drivers/platform/x86/ideapad-laptop.c
rename to drivers/platform/x86/lenovo/ideapad-laptop.c
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/le=
novo/thinkpad_acpi.c
similarity index 100%
rename from drivers/platform/x86/thinkpad_acpi.c
rename to drivers/platform/x86/lenovo/thinkpad_acpi.c
--=20
2.30.0


