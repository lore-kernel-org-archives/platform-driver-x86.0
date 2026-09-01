Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B7D48D880
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284897; cv=none; b=OQ0tOHGejY5Fp8atFcYFr4Ut/jbmzFsXS/uE6CX8NM69HqTwWt5qY1DqYF/o/EEL1wj3CWmK0JkYtvi41K2D5ipavtuiycaWhre9BSD/RL1I03UWe2IaMq9Gsz2dV9Icqw6mcwGuiAPPatIedx+D98UtTFtuN/s8EIkVlqc6qCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284897; c=relaxed/simple;
	bh=JkGm0UaS5Y3Qe3Vn2Bz1+l4/YRY5ooddh+4LtrMHuHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D0SSG3CylHf5I1sdNrYE6t2ll2zDs+XnkCxUXHCyqKt+lr8pfxXTWw0FYWD1irmZoqj5n/RvVcxJgibjHUMNwTWYV9vguLfUIBcJcc4PA8Kq1FZPtBD8Av+xu4Dmccg/8ZZqv84yNd747NkMWxCm15tuUP5SpJhhZuLAfXguMLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=HZl6OgH6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="HZl6OgH6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso614555e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Sep 2026 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1788284892; x=1788889692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zj7jRoHjkudAVVu49wNa7RpBG/Rcn+AOqbhR2Afeq2k=;
        b=HZl6OgH6Ff8AdFhI8U5oQ97xpEawD7D1cZB6XqMvmJIcHe5vaEphf1C7BwzmVOMe4G
         mZ8WtZPeDPSPcZRv2JCFoUn7QPoGRDiKCHCf1wR7fGR1/K3ie4iQGBF/lYIVKEz1IpU6
         UZLUUp6izBwMOUe2CGnwQHqECstTfm5t/Vlq/5cf+QjCSaOGdxa9+1RwbFsgJq3Sc8/S
         cEtMdlj08uMob/j+w7fw9lry+sHO3DZ1dFgJAkl3ZekD+GPeAEHV1iLSsQ/RDPZIpRgW
         5pYdZEqGMGxEMgDnnS/k9bOKdztTlv2QVioePNSUMNgEujPeJ8e5jHyWwuYI+v528Nur
         t4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284892; x=1788889692;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj7jRoHjkudAVVu49wNa7RpBG/Rcn+AOqbhR2Afeq2k=;
        b=aTKTuIRpwiqc1wje+35fDSJFljeNuvyIgQbZ0WGpmRSmRzEgbJ+afskJE+mariaSn7
         EPGZdgeFe+b2Pwr8D67Vww8BqSQxLN/3DZL+Yl1+a+k47rAty+aSEhhOzPLOyu5GvmCC
         s4LdJvfZimPiyhR53efO9whmPTgAD0o/+55SKuUGfON3hFHLnZR/fwKCYmId/CLpGZJ6
         XVDFUpkGltPEJBrUVFlO1y0+evVUeeh7UpA1Vr7d73g8eT89JYF/Rn9QFrG+WW0xyUtr
         WpTF4y7m2cQ6o14/BvkcrvkshwK13GUUTvt7Oj++MQuoV31PNExAHmN3pQqaFEqBi3Iu
         9sKg==
X-Forwarded-Encrypted: i=1; AHgh+RqjMNDXZziykdkLYJEBIFtQt/nJlkh8wFMUlUONJKgikW9/SXMoFyl2L9SoYPXBf65/niaiu/oRkQC00fxOrckaltwQ@vger.kernel.org
X-Gm-Message-State: AFuF++kX0Q/A3a8ExzgCOXQYVoK/OPjaw3kEk1PceU10Wye2k4jEmAo/
	Knb6CA5PRl0tC7COprt/xoKUY8xeoQKFcpXcUPLqxOD89FVy0iJHgQftrnEFcgicqg==
X-Gm-Gg: AR+sD12Jhf1GOyCMNEC0CQTqhOJ4jM5+iNeYpPzMjhZ5p0GiXIXbSThoaeO/c6qNJyt
	DSTuA75ga7v/r4mkAOwGPIRI+q21ICOuBpE6H67AcI9fcL/SVkOuITiPVcTnTYOQ81XHiuG4dYe
	u7fLOvhQoSI2Yq8vy7Lc+TzQRX9pFN7RE4V9rcRrAS4nUdLJ058Wzc4aAgCmIqZP7B2eII1HwEm
	OQVZM4H/Y/axWtgkJRDw0dT/CcdFd+AszRXsAQXHtLpACENIOcsb5EGWhu1/vPQP9xIuytukPkR
	jTZoFSvBn9F2WQDCF7zFVbu0/dm4rT0mKmVfJd6jlW+Lrq8u06yb5Nv7Onqz6n5HxOpolL2HNSJ
	1kIgAu0Fk+eaS5Q7O5GOdy+/MWdRzR3AVLt8Rxzs63XyJEdPx4X1f18cW9O9i2sry6vViTmClIm
	wbJSbQspSW612K42y1USz8nTnnoVo1jKs2Uyx31dHoquhQv0jKNfz9pF/gb84CmNLip9rnaIVh7
	yX73a/C8CJWg30=
X-Received: by 2002:a05:600c:4704:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-49b91c2d8femr551603875e9.5.1788284891619;
        Tue, 01 Sep 2026 10:48:11 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47885b1sm2369225e9.14.2026.09.01.10.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:48:11 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	Will Deacon <will@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	Yidi Lin <yidilin@google.com>,
	Kees Cook <kees@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	chrome-platform@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: [PATCH v14 2/5] firmware: Rename google firmware directory to coreboot
Date: Tue,  1 Sep 2026 18:48:03 +0100
Message-ID: <0a81e0d8e15c13f6a65c45ce476e37b33564ad61.1788284852.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788284852.git.sean@starlabs.systems>
References: <cover.1788284852.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most drivers in drivers/firmware/google are coreboot table drivers rather
than Google-specific firmware drivers. Rename the directory to coreboot
and update the Kconfig prompt, build path and maintainer entry.

Rename the generic firmware Kconfig symbols to CONFIG_COREBOOT_* at the
same time so new configurations describe the firmware interface rather
than one vendor. Keep the old CONFIG_GOOGLE_* names as transitional
symbols so existing configurations keep selecting the same drivers
during the rename.

Leave defconfig updates to a separate patch so the configuration churn
is easy to review independently.

Suggested-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 MAINTAINERS                                   | 20 ++---
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
 17 files changed, 76 insertions(+), 38 deletions(-)
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
index a8048eaf49e5..4646744002dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6716,6 +6716,16 @@ F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 F:	tools/testing/selftests/cgroup/test_kmem.c
 F:	tools/testing/selftests/cgroup/test_memcontrol.c
 
+COREBOOT FIRMWARE DRIVERS
+M:	Tzung-Bi Shih <tzungbi@kernel.org>
+R:	Brian Norris <briannorris@chromium.org>
+R:	Julius Werner <jwerner@chromium.org>
+L:	chrome-platform@lists.linux.dev
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
+F:	drivers/firmware/coreboot/
+F:	include/linux/coreboot.h
+
 CORETEMP HARDWARE MONITORING DRIVER
 L:	linux-hwmon@vger.kernel.org
 S:	Orphan
@@ -11144,16 +11154,6 @@ S:	Maintained
 F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
 F:	drivers/net/ethernet/google
 
-GOOGLE FIRMWARE DRIVERS
-M:	Tzung-Bi Shih <tzungbi@kernel.org>
-R:	Brian Norris <briannorris@chromium.org>
-R:	Julius Werner <jwerner@chromium.org>
-L:	chrome-platform@lists.linux.dev
-S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
-F:	drivers/firmware/google/
-F:	include/linux/coreboot.h
-
 GOOGLE TENSOR SoC SUPPORT
 M:	Peter Griffin <peter.griffin@linaro.org>
 R:	André Draszik <andre.draszik@linaro.org>
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 35dd6d422caf..b7d4df89cfb1 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -302,7 +302,7 @@ endif # TURRIS_MOX_RWTM
 source "drivers/firmware/arm_ffa/Kconfig"
 source "drivers/firmware/broadcom/Kconfig"
 source "drivers/firmware/cirrus/Kconfig"
-source "drivers/firmware/google/Kconfig"
+source "drivers/firmware/coreboot/Kconfig"
 source "drivers/firmware/efi/Kconfig"
 source "drivers/firmware/imx/Kconfig"
 source "drivers/firmware/meson/Kconfig"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 0e1e1b92a486..ce925e8ee526 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -31,7 +31,7 @@ obj-y				+= broadcom/
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
