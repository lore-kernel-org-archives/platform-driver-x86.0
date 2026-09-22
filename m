Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558D63BED55
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 03:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047361; cv=none; b=m9q7UhRSYUddsl/p/qg+iZYeeh3r5ZMZQHZ4IrOXwGIq1E8N94rQ8JbB4Fpa0/afOXHzUI1u7jLecLGje/7qL+3HEgIQiKOqbnSVVTutw2adgeD4beyFAJ8RPUMn179wVkcNTRv5JUUFB55P/i0YX9WkmwclAo2o1gQ+Js71h78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047361; c=relaxed/simple;
	bh=I5wIP9Lb3GzPo8AB1Hn1xUTzMr8FY3PyNIw2iVhcHwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBKxYUg6/knSfoQLBeggvvDX5Sl60oRwuQWtrhanMuSDSGg5lAxOliG/WmprJ09JCRxku6zcIKvODibknJ+sSDY5tFRjbRu2lyC3udmBQjJ7W68yu4BEXR0MbHACTvVUZZh+AVYpAFv1he7M8dMEZe3jZk++j7XBWkC5JcQGF1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITFE5Jnx; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITFE5Jnx"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fdc579daso41006565ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 20:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047358; x=1790652158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9ZOikjG/jKsquUCOs4ef+k0ESK3vg9QpXxcFWfbPnE=;
        b=ITFE5Jnx8I/90sp1TYyuAKSAtCs2rksOhjyWvk/VSM2jyb6Ptxf3wiqmrC4UPmrKkr
         Pz97ex9KL0n4NOrBei42SFv4kRLdShNhAA7ZY9MAXnd8LH+i7ABNtpnHEXOFjR68tkgE
         RVNCYts8jVMaoHzuug/UGjj8wqonWg2GwGazRnNEtvkOqMZsSXsPKw4jZQFvcha9GU87
         0EmclgDoWpLIiDzBZdu2ASXRN8v7tJdc1LPFfPBFpW37pKtVDhH27+xLXLZhsaOzRGTr
         c/bCrx0YP0NhQyXuf0P8SY5+i7r56ZIfW7lFtr5ZQOxXXnExGMh7r7CrfaoopGAoLB7E
         C2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047358; x=1790652158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9ZOikjG/jKsquUCOs4ef+k0ESK3vg9QpXxcFWfbPnE=;
        b=c50Ziaer56jH6HlJb+UaF/pAC6ABFN5rMZx0QstskxxazzYIEg42qwoPbKr5/i0o+5
         aNKtqbfevJwyuzRd8T6Q0DUbnKryZ8hsXZjX+ABOtiERTbSl9yfYoMtQCJKxKmpw7h5O
         xtCzyPu7587Ieg/a/7bvwVr4D2L1qgTX6zPOMHVE4ixxz2bdGkTlZFLXQo+MypEUqMJ/
         KwduEthqJccJoTdNiv3Va7atxjnk6ZhIhEW3U3G39tAZSV9uKh+OVFXueibVqiTgMpIf
         IX9jSFGUez5xcoOFbvOpWMzSo6KxKW5PG1eYw5G2/D/Nz8YH896Y8XGps1AZaxRggpia
         aPcw==
X-Forwarded-Encrypted: i=1; AKwUvBykXvtGK6ZqOyqTBEkT34QasgNAifdqRwgyjIJctebjm9Gpgv40fyCEQvaFV0Whk5yZomvOc+2BfRr+lDo02KVbHFNh@vger.kernel.org
X-Gm-Message-State: AFuF++npBJhefm2GIFatpx0GosNy3LF6rbvgNgiSd73K2pmRjQbI0T9Q
	GPskKmiXlelTOLXu/X/D97TsR1DSsddxOMGCc7R4tRGLQFQikxGwCF8S
X-Gm-Gg: AYBFou0uaQn2VsHS0K4LyK7XVG0PzKzjq74S9UHlq317QHLcLv4Tz5Q++a3XKQ4S65W
	3FF6lT8YdT95u4XuIqizfc1m82xjUArKUsr9RwmSZ9PjY2dg0dJHI0SOBINNS2ZuLAq5AhyeBoK
	pCebqsBBvlWflMvUxf3GfWQWThE81bTUBRvPuCyJVLov6q2wm7Ju1itqvpDzKjfFwN+hErD6pl/
	YcgO2/dFlKzpDHzavV17KD8SxUuTRHUaCgKCQaILnRT/NknKz3N6F1cYF/c1f2vKs8qhWGXONxf
	9ekB/HUWtlrEWGpEO+qeezcMHL6eWPmXXXBv3pTMi0NC0iaKRgpxcSQI892NWv9GxAYivIRAru5
	iZS/u/L4EhGtXrZ1wr+c3PDrq/JfDSqOjC7t+ejkC3k3fcR8rs8w3fqPFEtRy3Ehf0vDLG0k5A/
	/O6mVS+f5Q9ztbT6E4+h9agwjqoGsPSkiX48OTuYt8gLW9NCcjKqc4y7kzFBE2qCUbZn6op9SgL
	NiFW2NsBmNB/Z+F/W652Bgklod3G9XF7tA=
X-Received: by 2002:a17:903:2349:b0:2dd:c100:3136 with SMTP id d9443c01a7336-2ddc100317fmr123475555ad.50.1790047358371;
        Mon, 21 Sep 2026 20:22:38 -0700 (PDT)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5cf8390esm1970575ad.8.2026.09.21.20.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:22:36 -0700 (PDT)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	scardracs@disroot.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chipang_kao <chipang_kao@asus.com>
Subject: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to wmi/asus
Date: Tue, 22 Sep 2026 11:21:57 +0800
Message-ID: <20260922032157.120188-1-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2384d8f5-106c-4cbd-a119-62d923725bf7@kernel.org>
References: <2384d8f5-106c-4cbd-a119-62d923725bf7@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASUS WMI and related platform drivers currently reside under
drivers/platform/x86/. However, with ARM64 devices utilizing ACPI WMI
interfaces, maintaining these drivers exclusively under x86 creates
unnecessary architectural restrictions and Kconfig duplications.

To allow ARM64 architectures to build and utilize ASUS WMI drivers
cleanly:
1. Relocate all ASUS WMI-based drivers and headers from
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

Changes in v3:
- Refined the file relocation scope to target ONLY pure WMI-based
  platform drivers (asus-wmi, asus-nb-wmi, and asus-armoury).
- Retained non-WMI x86 platform drivers (such as asus-laptop,
  asus-wireless, and asus-tf103c-dock) under drivers/platform/x86/.
- Updated drivers/platform/wmi/asus/Kconfig and Makefile to only build
  and export the relocated WMI components.
- Dropped patch 1/2 from the original series as CONFIG_ACPI_WMI
  dependency updates are handled by Armin's WMI refactoring series.

Changes in v2:
- Relocated ASUS platform drivers from drivers/platform/x86/ to
  drivers/platform/wmi/asus/ to eliminate Kconfig duplication and
  architectural restrictions for ARM64 platforms.
- Updated MAINTAINERS file to reflect the new path.

 MAINTAINERS                                   |  1 +
 drivers/platform/wmi/Kconfig                  |  1 +
 drivers/platform/wmi/Makefile                 |  1 +
 drivers/platform/wmi/asus/Kconfig             | 64 +++++++++++++++++++
 drivers/platform/wmi/asus/Makefile            |  9 +++
 .../platform/{x86 => wmi/asus}/asus-armoury.c |  0
 .../platform/{x86 => wmi/asus}/asus-armoury.h |  0
 .../platform/{x86 => wmi/asus}/asus-nb-wmi.c  |  0
 drivers/platform/{x86 => wmi/asus}/asus-wmi.c |  0
 drivers/platform/{x86 => wmi/asus}/asus-wmi.h |  0
 drivers/platform/x86/Kconfig                  | 58 -----------------
 drivers/platform/x86/Makefile                 |  3 -
 12 files changed, 76 insertions(+), 61 deletions(-)
 create mode 100644 drivers/platform/wmi/asus/Kconfig
 create mode 100644 drivers/platform/wmi/asus/Makefile
 rename drivers/platform/{x86 => wmi/asus}/asus-armoury.c (100%)
 rename drivers/platform/{x86 => wmi/asus}/asus-armoury.h (100%)
 rename drivers/platform/{x86 => wmi/asus}/asus-nb-wmi.c (100%)
 rename drivers/platform/{x86 => wmi/asus}/asus-wmi.c (100%)
 rename drivers/platform/{x86 => wmi/asus}/asus-wmi.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..2e4fa6812093 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4124,6 +4124,7 @@ M:	Denis Benato <denis.benato@linux.dev>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 W:	https://asus-linux.org/
+F:	drivers/platform/wmi/asus/asus*.c
 F:	drivers/platform/x86/asus*.c
 F:	drivers/platform/x86/eeepc*.c
 
diff --git a/drivers/platform/wmi/Kconfig b/drivers/platform/wmi/Kconfig
index d62f51ff3b7f..acce8e9b7264 100644
--- a/drivers/platform/wmi/Kconfig
+++ b/drivers/platform/wmi/Kconfig
@@ -33,5 +33,6 @@ config ACPI_WMI_LEGACY_DEVICE_NAMES
 	  the same GUID to fail in some corner cases.
 
 source "drivers/platform/wmi/tests/Kconfig"
+source "drivers/platform/wmi/asus/Kconfig"
 
 endif # ACPI_WMI
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
index 000000000000..75b6dd45af66
--- /dev/null
+++ b/drivers/platform/wmi/asus/Kconfig
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Asus Platform Specific Drivers
+#
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
+
diff --git a/drivers/platform/wmi/asus/Makefile b/drivers/platform/wmi/asus/Makefile
new file mode 100644
index 000000000000..8daa5ebff89f
--- /dev/null
+++ b/drivers/platform/wmi/asus/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/wmi/asus
+# Asus Platform-Specific Drivers
+#
+
+obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
+obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
+obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/wmi/asus/asus-armoury.c
similarity index 100%
rename from drivers/platform/x86/asus-armoury.c
rename to drivers/platform/wmi/asus/asus-armoury.c
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/wmi/asus/asus-armoury.h
similarity index 100%
rename from drivers/platform/x86/asus-armoury.h
rename to drivers/platform/wmi/asus/asus-armoury.h
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/wmi/asus/asus-nb-wmi.c
similarity index 100%
rename from drivers/platform/x86/asus-nb-wmi.c
rename to drivers/platform/wmi/asus/asus-nb-wmi.c
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/wmi/asus/asus-wmi.c
similarity index 100%
rename from drivers/platform/x86/asus-wmi.c
rename to drivers/platform/wmi/asus/asus-wmi.c
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/wmi/asus/asus-wmi.h
similarity index 100%
rename from drivers/platform/x86/asus-wmi.h
rename to drivers/platform/wmi/asus/asus-wmi.h
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 957034f39e4e..68cf99de415d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -253,64 +253,6 @@ config ASUS_WIRELESS
 	  If you choose to compile this driver as a module the module will be
 	  called asus-wireless.
 
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
 config ASUS_TF103C_DOCK
 	tristate "Asus TF103C 2-in-1 keyboard dock"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 872ac3842391..0bacd55f2fce 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -33,9 +33,6 @@ obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
 # ASUS
 obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
 obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
-obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
-obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
-obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
 obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
 obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
 obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
-- 
2.43.0

