Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D0E466B01
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Aug 2026 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838410; cv=none; b=FLhAQMl9SbIOALBnTUPRL8WYNEkbgbR3A8e8JFTG9c92iOkMM42No0s/deDEAm4ME5VkpEZLn9QaT/OtiW5w1yj5rumEQPDx1Ql6uNnBvop8K1nANct4oKJcjbHP3sH3fZ8jHzv5nHOV0yrensDBunzPK4a/jrLZJiNoJ1J4Xb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838410; c=relaxed/simple;
	bh=655sXRuPwCv8keUAqLh0V+ifZPkrkHWb7tuYg7b0E9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UpQYODLuKnlrA0dxacNd3Wb9TDCbYgUAgZ9R7wA/1VfRYXXFXqQJHnEcNLg5Fifl4AN67Zh65GJJurfnVzJjC7hdIo19gwB1mkTmmNT2tPyoqXXDBLtsUTx3LQ38QEex5GfcIWYBhZ57yGWFgZleHD1r4xa+q/zGwqaDC0hZRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=ndkXW4+U; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="ndkXW4+U"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so1219924f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 03:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785838407; x=1786443207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLdt9DbJhtF9Wr8WDpk+P3jJIYzXdtmn+TfxgVbn6u0=;
        b=ndkXW4+U3KGunT4NpnXW3smwWODvKtZErhblhKoGEGGC2tJiZdFeM+slSXVD52PStA
         hWD0n0AWPh1DfRpp5Tv7ZBTlGaHiEbPqSFiTDyHdbtBQhU4e1ZfBsH7sagNZ1+jHRhIh
         1JEkCY1Js0HlkAXBi4zddBUmrUXmhDvWZRr6JW6JgzLR8sJlDWf54qldbuZzvAZzAlKM
         MSTjojGpK35KcN4gYnrta30tn6QfsozIKq/RRXuzqkGwrvt6tx2ZDo6O6rTf7IRnI5rN
         /6Y/WjaB2Owh/peUUi+ZopVlWlEwHVHBGtfTrh+Gl4XJirnZFxxQjFRO5mOehvpYqziQ
         VuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785838407; x=1786443207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLdt9DbJhtF9Wr8WDpk+P3jJIYzXdtmn+TfxgVbn6u0=;
        b=TL8FsaKF4sPuugM0QaevthZrKAqeXUHlVhxhJQF73ZnKWBfhwGeZf/4TiE0g6q2IHV
         y5Y2kl678xvCGNBftzcV9XXC/XBtvSFCIDXv3eiV0Z4WRIkM7HS+b2nIRsFMBXLhecYt
         sxuCRNKiisSE2+5RfifDbh2cYXWjuhzDrE6aS7x3O/V9Iq8gvQfooAivNqqbInsWwCgM
         fdjP5KZOdTniDLXs0rqMTffzzJ+bB5utoSIaeA0Kjsc9KWq3hbxCAO3yZtHJ6rT2BRCB
         CtaOe3tmHesw58sx309IpeUtQdEnRFjAgOvCN6bmAl2a7/530cvckdEjzQ6j+jy2bXBX
         yF6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrMu0zbRXVzoXGYHIyitACkdE8tNmVgPnm/97fubx2yDJkYDEkK+V89hwRFMiasb8ctiBjSMqNbb4JXyewqO7u/q/HF@vger.kernel.org
X-Gm-Message-State: AOJu0YzYw398SZnl39SudcmCuKcUA98iK3k7HmgPl7CgaF1QyPcrAAKM
	2P3JQW00OKy2wSksOPSaRSFeqfHncOF35UyvMZL6Mg3ANMACKtfBkfl7F1+ke5YHhg==
X-Gm-Gg: AR+sD11eNXbPjidqL74qE2UfjkunawRjKI9LITqKmhFJ1AVBPVkKg1f3nhrEaw2/SfH
	IhTk8jH9spjTsgyXg0XxTmWp13q7PRX577ZGzQE6hpDQdDwIEoH/v/mOr406BhnzoN11CZK4fiv
	JgZSmWU9O6WdolKUnkrKNkn6IlyLyCGG3Nz18TXlxyDdYQbUZfBtn8yhnUJbQulCHnkxq/lKrFL
	aTb9i41Bb3rL8+cdO947njq7UkSVbF6uaX6eeiSv/Atseij/i5koPo63g8dIA71JmB+Etr7aSLd
	ZNURWWUuDRit4fQhXaoqrAPmf/tm57VQAYuNZw1q83RmsP1isHylHoBhttglXCrQiIY1YtbIF4H
	VluYxuodvBjqWz8IhyFJ3Vx/YRGHdHXrp0ZhDGHUDIHgTZ6hJbfnsdTUwQLZDBiGyFMEYny4THO
	U9VDLHbc+fxd95XSSn5ehFyFRj/7T20hlrLgc2HU2n1gce2T4GywJzPuZD1SoIUi4tR19tOhdro
	2idnq+nbIAp2VZ3Nuj03IUPMDGoXsSf
X-Received: by 2002:a05:600c:1992:b0:498:28b:1045 with SMTP id 5b1f17b1804b1-4980c645611mr264401445e9.3.1785838406680;
        Tue, 04 Aug 2026 03:13:26 -0700 (PDT)
Received: from horizon.localdomain ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm67300275e9.4.2026.08.04.03.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 03:13:26 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: chrome-platform@lists.linux.dev
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Sean Rhodes <sean@starlabs.systems>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Oliver Lin <oliver@liuxiaozhen.dev>
Subject: [PATCH v11 3/4] firmware: Rename google firmware directory to coreboot
Date: Tue,  4 Aug 2026 11:13:08 +0100
Message-ID: <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785838269.git.sean@starlabs.systems>
References: <cover.1785838269.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most drivers in drivers/firmware/google are coreboot table drivers rather
than Google-specific firmware drivers. Rename the directory to coreboot
and update the Kconfig prompt, build path and maintainer entry.

Rename the generic coreboot Kconfig symbols at the same time. Keep the old
CONFIG_GOOGLE_* names as transitional symbols so existing configurations
migrate to the new names.

Suggested-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 MAINTAINERS                                   |  4 +-
 arch/arm64/configs/defconfig                  |  6 +-
 drivers/firmware/Kconfig                      |  2 +-
 drivers/firmware/Makefile                     |  2 +-
 drivers/firmware/{google => coreboot}/Kconfig | 74 ++++++++++++++-----
 .../firmware/{google => coreboot}/Makefile    | 10 +--
 drivers/firmware/{google => coreboot}/cbmem.c |  0
 .../{google => coreboot}/coreboot_table.c     |  0
 .../{google => coreboot}/coreboot_table.h     |  0
 .../framebuffer-coreboot.c                    |  0
 drivers/firmware/{google => coreboot}/gsmi.c  |  0
 .../memconsole-coreboot.c                     |  0
 .../memconsole-x86-legacy.c                   |  0
 .../{google => coreboot}/memconsole.c         |  0
 .../{google => coreboot}/memconsole.h         |  6 +-
 drivers/firmware/{google => coreboot}/vpd.c   |  0
 .../{google => coreboot}/vpd_decode.c         |  0
 .../{google => coreboot}/vpd_decode.h         |  0
 drivers/gpu/drm/sysfb/Kconfig                 |  2 +-
 19 files changed, 72 insertions(+), 34 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (64%)
 rename drivers/firmware/{google => coreboot}/Makefile (51%)
 rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
 rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
 rename drivers/firmware/{google => coreboot}/vpd.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index e6a8c271e79d..62ddee473f55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11069,14 +11069,14 @@ S:	Maintained
 F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
 F:	drivers/net/ethernet/google
 
-GOOGLE FIRMWARE DRIVERS
+COREBOOT FIRMWARE DRIVERS
 M:	Tzung-Bi Shih <tzungbi@kernel.org>
 R:	Brian Norris <briannorris@chromium.org>
 R:	Julius Werner <jwerner@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
-F:	drivers/firmware/google/
+F:	drivers/firmware/coreboot/
 F:	include/linux/coreboot.h
 
 GOOGLE TENSOR SoC SUPPORT
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..32ec89a872d9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -267,9 +267,9 @@ CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_INTEL_STRATIX10_SERVICE=y
 CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_MTK_ADSP_IPC=m
-CONFIG_GOOGLE_FIRMWARE=y
-CONFIG_GOOGLE_CBMEM=m
-CONFIG_GOOGLE_COREBOOT_TABLE=m
+CONFIG_COREBOOT_FIRMWARE=y
+CONFIG_COREBOOT_CBMEM=m
+CONFIG_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 78a239f8bbef..4df0a0ad18b8 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -293,7 +293,7 @@ endif # TURRIS_MOX_RWTM
 source "drivers/firmware/arm_ffa/Kconfig"
 source "drivers/firmware/broadcom/Kconfig"
 source "drivers/firmware/cirrus/Kconfig"
-source "drivers/firmware/google/Kconfig"
+source "drivers/firmware/coreboot/Kconfig"
 source "drivers/firmware/efi/Kconfig"
 source "drivers/firmware/imx/Kconfig"
 source "drivers/firmware/meson/Kconfig"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 385b6e8b7fc6..f8da96382680 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -30,7 +30,7 @@ obj-y				+= broadcom/
 obj-y				+= cirrus/
 obj-y				+= meson/
 obj-y				+= microchip/
-obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
+obj-$(CONFIG_COREBOOT_FIRMWARE)	+= coreboot/
 obj-y				+= efi/
 obj-y				+= imx/
 obj-y				+= psci/
diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/coreboot/Kconfig
similarity index 64%
rename from drivers/firmware/google/Kconfig
rename to drivers/firmware/coreboot/Kconfig
index b78c644fa253..d273bd836245 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/coreboot/Kconfig
@@ -1,13 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menuconfig GOOGLE_FIRMWARE
-	bool "Google Firmware Drivers"
+menuconfig COREBOOT_FIRMWARE
+	bool "coreboot firmware drivers"
+	default GOOGLE_FIRMWARE
 	default n
 	help
-	  These firmware drivers are used by Google servers,
-	  Chromebooks and other devices using coreboot firmware.
+	  These firmware drivers are used by devices running coreboot
+	  firmware, including Chromebooks and some Google servers.
+	  They include shared support for coreboot table entries and
+	  drivers for CBMEM, framebuffer, firmware console and VPD records.
 	  If in doubt, say "N".
 
-if GOOGLE_FIRMWARE
+if COREBOOT_FIRMWARE
 
 config GOOGLE_SMI
 	tristate "SMI interface for Google platforms"
@@ -19,9 +22,10 @@ config GOOGLE_SMI
 	  driver provides an interface for reading and writing NVRAM
 	  variables.
 
-config GOOGLE_CBMEM
+config COREBOOT_CBMEM
 	tristate "CBMEM entries in sysfs"
-	depends on GOOGLE_COREBOOT_TABLE
+	depends on COREBOOT_TABLE
+	default GOOGLE_CBMEM
 	help
 	  CBMEM is a downwards-growing memory region created by the
 	  Coreboot BIOS containing tagged data structures from the
@@ -34,9 +38,10 @@ config GOOGLE_CBMEM
 	  memory for each entry in sysfs under
 	  /sys/bus/coreboot/devices/cbmem-<id>.
 
-config GOOGLE_COREBOOT_TABLE
+config COREBOOT_TABLE
 	tristate "Coreboot Table Access"
 	depends on HAS_IOMEM && (ACPI || OF)
+	default GOOGLE_COREBOOT_TABLE
 	help
 	  This option enables the coreboot_table module, which provides other
 	  firmware modules access to the coreboot table. The coreboot table
@@ -44,42 +49,75 @@ config GOOGLE_COREBOOT_TABLE
 	  device tree node /firmware/coreboot.
 	  If unsure say N.
 
-config GOOGLE_MEMCONSOLE
+config COREBOOT_MEMCONSOLE_COMMON
 	tristate
-	depends on GOOGLE_MEMCONSOLE_X86_LEGACY || GOOGLE_MEMCONSOLE_COREBOOT
+	depends on GOOGLE_MEMCONSOLE_X86_LEGACY || COREBOOT_MEMCONSOLE
+	default GOOGLE_MEMCONSOLE
 
 config GOOGLE_MEMCONSOLE_X86_LEGACY
 	tristate "Firmware Memory Console - X86 Legacy support"
 	depends on X86 && ACPI && DMI
-	select GOOGLE_MEMCONSOLE
+	select COREBOOT_MEMCONSOLE_COMMON
 	help
 	  This option enables the kernel to search for a firmware log in
 	  the EBDA on Google servers.  If found, this log is exported to
 	  userland in the file /sys/firmware/log.
+	  This driver is limited to x86 systems that expose the legacy
+	  Google EBDA console format.
 
-config GOOGLE_FRAMEBUFFER_COREBOOT
+config COREBOOT_FRAMEBUFFER
 	tristate "Coreboot Framebuffer"
-	depends on GOOGLE_COREBOOT_TABLE
+	depends on COREBOOT_TABLE
+	default GOOGLE_FRAMEBUFFER_COREBOOT
 	help
 	  This option enables the kernel to search for a framebuffer in
 	  the coreboot table.  If found, it is registered with a platform
 	  device of type coreboot-framebuffer. Using the old device of
 	  type simple-framebuffer is deprecated.
 
-config GOOGLE_MEMCONSOLE_COREBOOT
+config COREBOOT_MEMCONSOLE
 	tristate "Firmware Memory Console"
-	depends on GOOGLE_COREBOOT_TABLE
-	select GOOGLE_MEMCONSOLE
+	depends on COREBOOT_TABLE
+	select COREBOOT_MEMCONSOLE_COMMON
+	default GOOGLE_MEMCONSOLE_COREBOOT
 	help
 	  This option enables the kernel to search for a firmware log in
 	  the coreboot table.  If found, this log is exported to userland
 	  in the file /sys/firmware/log.
+	  This is the coreboot-table backed variant of the firmware memory
+	  console driver.
 
 config GOOGLE_VPD
 	tristate "Vital Product Data"
-	depends on GOOGLE_COREBOOT_TABLE
+	depends on COREBOOT_TABLE
 	help
 	  This option enables the kernel to expose the content of Google VPD
 	  under /sys/firmware/vpd.
+	  VPD records carry firmware-provided key/value data used by
+	  Google devices.
+
+endif # COREBOOT_FIRMWARE
 
-endif # GOOGLE_FIRMWARE
+config GOOGLE_FIRMWARE
+	bool
+	transitional
+
+config GOOGLE_CBMEM
+	tristate
+	transitional
+
+config GOOGLE_COREBOOT_TABLE
+	tristate
+	transitional
+
+config GOOGLE_MEMCONSOLE
+	tristate
+	transitional
+
+config GOOGLE_FRAMEBUFFER_COREBOOT
+	tristate
+	transitional
+
+config GOOGLE_MEMCONSOLE_COREBOOT
+	tristate
+	transitional
diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/coreboot/Makefile
similarity index 51%
rename from drivers/firmware/google/Makefile
rename to drivers/firmware/coreboot/Makefile
index 8151e323cc43..e681f274417a 100644
--- a/drivers/firmware/google/Makefile
+++ b/drivers/firmware/coreboot/Makefile
@@ -1,14 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_GOOGLE_SMI)		+= gsmi.o
-obj-$(CONFIG_GOOGLE_COREBOOT_TABLE)        += coreboot_table.o
-obj-$(CONFIG_GOOGLE_FRAMEBUFFER_COREBOOT)  += framebuffer-coreboot.o
-obj-$(CONFIG_GOOGLE_MEMCONSOLE)            += memconsole.o
-obj-$(CONFIG_GOOGLE_MEMCONSOLE_COREBOOT)   += memconsole-coreboot.o
+obj-$(CONFIG_COREBOOT_TABLE)               += coreboot_table.o
+obj-$(CONFIG_COREBOOT_FRAMEBUFFER)         += framebuffer-coreboot.o
+obj-$(CONFIG_COREBOOT_MEMCONSOLE_COMMON)   += memconsole.o
+obj-$(CONFIG_COREBOOT_MEMCONSOLE)          += memconsole-coreboot.o
 obj-$(CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY) += memconsole-x86-legacy.o
 
 # Must come after coreboot_table.o, as this driver depends on that bus type.
-obj-$(CONFIG_GOOGLE_CBMEM)		+= cbmem.o
+obj-$(CONFIG_COREBOOT_CBMEM)		+= cbmem.o
 
 vpd-sysfs-y := vpd.o vpd_decode.o
 obj-$(CONFIG_GOOGLE_VPD)		+= vpd-sysfs.o
diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/coreboot/cbmem.c
similarity index 100%
rename from drivers/firmware/google/cbmem.c
rename to drivers/firmware/coreboot/cbmem.c
diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/coreboot/coreboot_table.c
similarity index 100%
rename from drivers/firmware/google/coreboot_table.c
rename to drivers/firmware/coreboot/coreboot_table.c
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/coreboot/coreboot_table.h
similarity index 100%
rename from drivers/firmware/google/coreboot_table.h
rename to drivers/firmware/coreboot/coreboot_table.h
diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/coreboot/framebuffer-coreboot.c
similarity index 100%
rename from drivers/firmware/google/framebuffer-coreboot.c
rename to drivers/firmware/coreboot/framebuffer-coreboot.c
diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/coreboot/gsmi.c
similarity index 100%
rename from drivers/firmware/google/gsmi.c
rename to drivers/firmware/coreboot/gsmi.c
diff --git a/drivers/firmware/google/memconsole-coreboot.c b/drivers/firmware/coreboot/memconsole-coreboot.c
similarity index 100%
rename from drivers/firmware/google/memconsole-coreboot.c
rename to drivers/firmware/coreboot/memconsole-coreboot.c
diff --git a/drivers/firmware/google/memconsole-x86-legacy.c b/drivers/firmware/coreboot/memconsole-x86-legacy.c
similarity index 100%
rename from drivers/firmware/google/memconsole-x86-legacy.c
rename to drivers/firmware/coreboot/memconsole-x86-legacy.c
diff --git a/drivers/firmware/google/memconsole.c b/drivers/firmware/coreboot/memconsole.c
similarity index 100%
rename from drivers/firmware/google/memconsole.c
rename to drivers/firmware/coreboot/memconsole.c
diff --git a/drivers/firmware/google/memconsole.h b/drivers/firmware/coreboot/memconsole.h
similarity index 82%
rename from drivers/firmware/google/memconsole.h
rename to drivers/firmware/coreboot/memconsole.h
index aaff2b72b606..58899c2abaaa 100644
--- a/drivers/firmware/google/memconsole.h
+++ b/drivers/firmware/coreboot/memconsole.h
@@ -7,8 +7,8 @@
  * Copyright 2017 Google Inc.
  */
 
-#ifndef __FIRMWARE_GOOGLE_MEMCONSOLE_H
-#define __FIRMWARE_GOOGLE_MEMCONSOLE_H
+#ifndef __FIRMWARE_COREBOOT_MEMCONSOLE_H
+#define __FIRMWARE_COREBOOT_MEMCONSOLE_H
 
 #include <linux/types.h>
 
@@ -33,4 +33,4 @@ int memconsole_sysfs_init(void);
  */
 void memconsole_exit(void);
 
-#endif /* __FIRMWARE_GOOGLE_MEMCONSOLE_H */
+#endif /* __FIRMWARE_COREBOOT_MEMCONSOLE_H */
diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/coreboot/vpd.c
similarity index 100%
rename from drivers/firmware/google/vpd.c
rename to drivers/firmware/coreboot/vpd.c
diff --git a/drivers/firmware/google/vpd_decode.c b/drivers/firmware/coreboot/vpd_decode.c
similarity index 100%
rename from drivers/firmware/google/vpd_decode.c
rename to drivers/firmware/coreboot/vpd_decode.c
diff --git a/drivers/firmware/google/vpd_decode.h b/drivers/firmware/coreboot/vpd_decode.h
similarity index 100%
rename from drivers/firmware/google/vpd_decode.h
rename to drivers/firmware/coreboot/vpd_decode.h
diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index 2559ead6cf1f..34d3fa8b30c9 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -10,7 +10,7 @@ config DRM_SYSFB_HELPER
 config DRM_COREBOOTDRM
 	tristate "Coreboot framebuffer driver"
 	depends on DRM && MMU
-	depends on GOOGLE_FRAMEBUFFER_COREBOOT
+	depends on COREBOOT_FRAMEBUFFER
 	select APERTURE_HELPERS
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
