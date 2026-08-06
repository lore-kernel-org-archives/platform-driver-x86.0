Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B5F4DC523
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048110; cv=pass; b=lSwCoK0A49VGJOBkAyegTKbQZ11gLEr7NzJp8ns1R3GoRiFUTdywTVUOdU4HmNFPIe2dthgpyL02AuXqah+sGZquBNreNX8FVTaeiwYSE70/dlDmAwO/Q/LlWv4kDoupzRtkbLXGteff+tR/Xhg4k0h7y1WZikCaW1XMhIJCab0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048110; c=relaxed/simple;
	bh=xjyGYu6w8CU2vRHvhNRUuB7iPZmlc1EALiS991dExao=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GWhdprocYiSM+Ah0/OQRe5DyWFhaWqGmw4Is063PxBGGL3Y30DDyeDQQR2rAWpQ+CeNBI5RuZ9DpKSBK0qspWqvefeoiM4wxJRgQuHImWdK+/77A/lqifsDU+aigHG8LlEyRBUGlp3hwS7pNs+2ZNv53vAzJLDzCEgIT15oqCHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=JkITN2Jy; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="JkITN2Jy"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66899fe9077so4291687d50.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Aug 2026 13:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786048108; cv=none;
        d=google.com; s=arc-20260327;
        b=C80RaNu05BiDjlEHms3M9W7RuJ6SsJI97jVeGpO4N6cyLHE2XFq3mb+MohqYk7ca1X
         RobTec4nmZXIWwDZnMAqGK0X0+oYfQZvfxeDJAtPT/WkjDOOBH3jfKgPqMH7XFfh+joc
         NEwpNkdjdfvGtTmtWxmxH+7p/AXtEAsabUyZHK7WDUoJ5s9fjr3S2d0HztY+KpTxCqVL
         R1Sq5TpISfH35CzMHCmTUshkBp8ievqewAM0Owj96xQM1y9YlaQYxJ7fZYzZv+4/mIIi
         OTurJ35JKQN26USK3BDwV2VW2mdwKt3jnMcTgVBPjiMb5OSU8ZE2fI52qowS2/EUpqyw
         jOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Pl3lOHYD5u9a9DZft1poeG2yn48m4MRRkvM23CvELd0=;
        fh=G5Gvwur4OcNVnnJuMJDUKGiV5GFRBNlc0eTYqkCtGUc=;
        b=Z/l7CABKjHvkNAq+52icPzvG5+3+6KyZ+5YrvPIrR/wQjxo7n/FSHV1KmdXqV0rL4W
         et45hhurk3Bg7yNieSlCeZEkq0NFsfoLBCo0hsyvHa+MEzw5naVk9qakHjQbxFg8VcZS
         wCcnHN1BbkkxD98p1L0Azd2afMClIFQgf6I8T3xWk+X2JJTlJeqeWhI+6aIQYsjdALx3
         VqsenE9PzgIo78Ecb77kTMIZWH/cEySZnmGSSWSVePr+JOhW0EGfmg3mDlbZrxaqWZ3b
         am3PY9qkAyx+U+d0Syo08htt0cviNRqLzO80D8AcHHNpzGBZd3myqzKie/ofcX4pNJLS
         dREQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1786048108; x=1786652908; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pl3lOHYD5u9a9DZft1poeG2yn48m4MRRkvM23CvELd0=;
        b=JkITN2Jy6jtCFSY/YMhT/5V7gpLrcG2qm74jsAofhl3lA2YBXMvQVgZ53A+DGDokSO
         IUykzwoLWkyXiB6tpL5hFXohLBFNKEHIdBLcuuZevKQmcThaPYm0GY8ghywYRh4wraFf
         0xxl5kfIMBD2qH3BFpaKD5uW8P0xJMdkVi8AXh+BkhYSql7N08Z3SwVSEz3LyULdiGK1
         /yZ2qahVlZB6JIOyvHhfFrf0tNcNYtdbmw8661g+uzr0K70n79a62ASarlY90jXP97Nh
         OvC40IgvSK82LWhAkPDk/uLN4LUVIHmX3AYfKl1RwKELlCbsmjQ4S8qnq6gOLpNJGuWN
         3E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786048108; x=1786652908;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pl3lOHYD5u9a9DZft1poeG2yn48m4MRRkvM23CvELd0=;
        b=gexEpNY3YPPdc/oDraxlqj3l0EptCQEqjBb2GbHjh8WJKs+wZxL3VLtSWhZR8xv/ZG
         7Ti9Bo7uO4mgEvq/xUDC77WE4WZTCmjoYSnolMd02XjgjPRYfvdg/QRZcejl+ai9g+5d
         yuSPd7ujFZlP7E3YJcVC4lRlBtyxd71dsNzeQ0CwqWl+6qt4OmwTgYJVFshUWNsJhCRT
         aQMGQI8uSq7M35fgIlJt2JSH3GrVOxkSpAOIFv7FJFqIBu1y+k2dKJeMWQZubnj/wFa+
         nlKt20Df5+dd07BMoEVkG5hj4VZYtP0GsMFnN5weu3i6KvqhyGK0tWzJfwXGl+HTm/3Y
         nvdw==
X-Forwarded-Encrypted: i=1; AHgh+RrU+Dx7oL8vNCkjM59sOD273T5OgTUe7obWY/UW8ktZRSawC4wH1lz1QtNner8ojyFIpPsSlNvlaBbL9RjpFJ0nhZ6+@vger.kernel.org
X-Gm-Message-State: AOJu0YyRuUIdUcWw9UssuxRK2DBMrJ/mhjiyRyFGCgYZ/iNHP/hOlEMc
	bkR8mvkmifS5nxHCHSvHssAP/xoXED4I4ak7K9ERyI/01My7EXu67xIdodSoEJlf83RSOKooqCK
	OB/PzM6wtWdydhhNSVaij7J2Xcr0hq0FznebQquIa
X-Gm-Gg: AR+sD11CvXMryLc/jKa2m4qIf1pBJ+i19sRvuWKvy6F8nr0Gxl9tOzBfpoukv6sNu2M
	ZrzZwZ6l/OwFhG5hwEIgBT5r9z4ENVxVn2P5hpaEHwn/gA2sR9q8YJePHo6jWB0LAu4DWI/A0nf
	4uYC6f1JCj7fGwZDsiRGGsyTYgH07KRz1wkpt6LUh+PRNUYUglJIe+WC8kSPVf2cq/ZxlqFZ/+9
	Ez8rKoPQXGLaKSvJmcyvODJIvAfl5hCBlIUv1xKc8JOTTRBRrnV768QklZD7bzq8Trelsl8Gbez
	CEHL89C70vgZRicF+VbEXsWMhxjcOK9UdZNM6we7vSR3j8fA3OjPAq/KU+FcashcKnd0bFImwg=
	=
X-Received: by 2002:a53:510c:0:b0:668:1c09:aef1 with SMTP id
 956f58d0204a3-6699a8f6b6bmr7594739d50.6.1786048107607; Thu, 06 Aug 2026
 13:28:27 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 13:28:26 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 13:28:26 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 6 Aug 2026 13:28:26 -0700
X-Gm-Features: AUfX_mwOaRxg95OuW9Ds8iNQvGKcieqxJPLMdtz6kfQAyNoKr3gXMq_u-wATIaU
Message-ID: <CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com>
Subject: [PATCH v12 3/4] firmware: Rename google firmware directory to coreboot
To: chrome-platform@lists.linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, 
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	josh@joshuagrisham.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	florian.fainelli@broadcom.com, chenhuacai@kernel.org, mst@redhat.com, 
	wenst@chromium.org, tzungbi@kernel.org, briannorris@chromium.org, 
	jwerner@chromium.org, tzimmermann@suse.de, javierm@redhat.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, krzysztof.kozlowski@oss.qualcomm.com, andersson@kernel.org, 
	geert@linux-m68k.org, dmitry.baryshkov@oss.qualcomm.com, arnd@arndb.de, 
	ebiggers@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com, 
	sven@kernel.org, u.kleine-koenig@baylibre.com, bhelgaas@google.com, 
	dakr@kernel.org, o-takashi@sakamocchi.jp, titouan.ameline@gmail.com, 
	kees@kernel.org, dri-devel@lists.freedesktop.org, oliver@liuxiaozhen.dev
Content-Type: text/plain; charset="UTF-8"

Most drivers in drivers/firmware/google are coreboot table drivers rather
than Google-specific firmware drivers. Rename the directory to coreboot
and update the Kconfig prompt, build path and maintainer entry.

Keep the existing CONFIG_GOOGLE_* symbols to avoid user configuration
churn in this mechanical move.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 MAINTAINERS                                                 | 4 ++--
 drivers/firmware/Kconfig                                    | 2 +-
 drivers/firmware/Makefile                                   | 2 +-
 drivers/firmware/{google => coreboot}/Kconfig               | 6 +++---
 drivers/firmware/{google => coreboot}/Makefile              | 0
 drivers/firmware/{google => coreboot}/cbmem.c               | 0
 drivers/firmware/{google => coreboot}/coreboot_table.c      | 0
 drivers/firmware/{google => coreboot}/coreboot_table.h      | 0
 .../firmware/{google => coreboot}/framebuffer-coreboot.c    | 0
 drivers/firmware/{google => coreboot}/gsmi.c                | 0
 drivers/firmware/{google => coreboot}/memconsole-coreboot.c | 0
 .../firmware/{google => coreboot}/memconsole-x86-legacy.c   | 0
 drivers/firmware/{google => coreboot}/memconsole.c          | 0
 drivers/firmware/{google => coreboot}/memconsole.h          | 6 +++---
 drivers/firmware/{google => coreboot}/vpd.c                 | 0
 drivers/firmware/{google => coreboot}/vpd_decode.c          | 0
 drivers/firmware/{google => coreboot}/vpd_decode.h          | 0
 17 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (94%)
 rename drivers/firmware/{google => coreboot}/Makefile (100%)
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
index 385b6e8b7fc6..7a8fc3eeb3f0 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -30,7 +30,7 @@ obj-y				+= broadcom/
 obj-y				+= cirrus/
 obj-y				+= meson/
 obj-y				+= microchip/
-obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
+obj-$(CONFIG_GOOGLE_FIRMWARE)	+= coreboot/
 obj-y				+= efi/
 obj-y				+= imx/
 obj-y				+= psci/
diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/coreboot/Kconfig
similarity index 94%
rename from drivers/firmware/google/Kconfig
rename to drivers/firmware/coreboot/Kconfig
index b78c644fa253..b248bafe8b6b 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/coreboot/Kconfig
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig GOOGLE_FIRMWARE
-	bool "Google Firmware Drivers"
+	bool "coreboot firmware drivers"
 	default n
 	help
-	  These firmware drivers are used by Google servers,
-	  Chromebooks and other devices using coreboot firmware.
+	  These firmware drivers are used by devices running coreboot
+	  firmware, including Chromebooks and some Google servers.
 	  If in doubt, say "N".

 if GOOGLE_FIRMWARE
diff --git a/drivers/firmware/google/Makefile
b/drivers/firmware/coreboot/Makefile
similarity index 100%
rename from drivers/firmware/google/Makefile
rename to drivers/firmware/coreboot/Makefile
diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/coreboot/cbmem.c
similarity index 100%
rename from drivers/firmware/google/cbmem.c
rename to drivers/firmware/coreboot/cbmem.c
diff --git a/drivers/firmware/google/coreboot_table.c
b/drivers/firmware/coreboot/coreboot_table.c
similarity index 100%
rename from drivers/firmware/google/coreboot_table.c
rename to drivers/firmware/coreboot/coreboot_table.c
diff --git a/drivers/firmware/google/coreboot_table.h
b/drivers/firmware/coreboot/coreboot_table.h
similarity index 100%
rename from drivers/firmware/google/coreboot_table.h
rename to drivers/firmware/coreboot/coreboot_table.h
diff --git a/drivers/firmware/google/framebuffer-coreboot.c
b/drivers/firmware/coreboot/framebuffer-coreboot.c
similarity index 100%
rename from drivers/firmware/google/framebuffer-coreboot.c
rename to drivers/firmware/coreboot/framebuffer-coreboot.c
diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/coreboot/gsmi.c
similarity index 100%
rename from drivers/firmware/google/gsmi.c
rename to drivers/firmware/coreboot/gsmi.c
diff --git a/drivers/firmware/google/memconsole-coreboot.c
b/drivers/firmware/coreboot/memconsole-coreboot.c
similarity index 100%
rename from drivers/firmware/google/memconsole-coreboot.c
rename to drivers/firmware/coreboot/memconsole-coreboot.c
diff --git a/drivers/firmware/google/memconsole-x86-legacy.c
b/drivers/firmware/coreboot/memconsole-x86-legacy.c
similarity index 100%
rename from drivers/firmware/google/memconsole-x86-legacy.c
rename to drivers/firmware/coreboot/memconsole-x86-legacy.c
diff --git a/drivers/firmware/google/memconsole.c
b/drivers/firmware/coreboot/memconsole.c
similarity index 100%
rename from drivers/firmware/google/memconsole.c
rename to drivers/firmware/coreboot/memconsole.c
diff --git a/drivers/firmware/google/memconsole.h
b/drivers/firmware/coreboot/memconsole.h
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
diff --git a/drivers/firmware/google/vpd_decode.c
b/drivers/firmware/coreboot/vpd_decode.c
similarity index 100%
rename from drivers/firmware/google/vpd_decode.c
rename to drivers/firmware/coreboot/vpd_decode.c
diff --git a/drivers/firmware/google/vpd_decode.h
b/drivers/firmware/coreboot/vpd_decode.h
similarity index 100%
rename from drivers/firmware/google/vpd_decode.h
rename to drivers/firmware/coreboot/vpd_decode.h
