Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AC93672BF
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 16:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701614; cv=pass; b=Oi+J6SawqF97ir1nuomHiO5JHiu2Sg1G0NN6pHTyEHGuo5DMxocgFhOyUUVGzzwO7EaqxbMAwyzjd9aWQh4JeRSeT1gH3Dh125vua9GKFbr8lF8K03BhoB4ngWy+CbmAUBqvLACAkgunmMl7idb7ROtjLuRA7U9TlplTf+VxEjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701614; c=relaxed/simple;
	bh=vX9dRgZiOib3WIdLa0aIly0qKS67zbaen72OeP0duog=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Le0ibfs7URwFZnj18q3658HNhiTB7lhrW8hUK65w239DRBjVRUNxDE9xOMpheR7bUG+ig+wtOhkb6pSWfnpyc3DgN5K82Dpu/04X+pWhgaTxTwU9x9R7ovVnJByt8oCAZ/FgklC+DkT3My6JsLkvyqcH8GF9c6iXUqM7svW4vUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=JZjYW4iv; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="JZjYW4iv"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81dfdbd86d1so11675477b3.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 09:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783701612; cv=none;
        d=google.com; s=arc-20260327;
        b=BhRZdUUGo6axZLbg1p5suUPrHUtZRXxYNo8avQv6CIotGlibDTDO5dbPwpGAgH5uG6
         Sk/Y3BFrZ5COYRAGOVpDGytiboYNuFJ+Z8QWn1r2N5JLHm8ZYAL2acwKe++p/OBnhzXp
         CGnKF6CpIP5vW0AuHSgtE5et2N6hWXZ2oVvxNlof9GEnKLEUY0V1I9mueQxcv8uLcACR
         KajWEaeTXZZSi7MYEayNczhkgOjld9OvFNpmXnbanYYO4vrGwxMjurSlMD3V4tw8w+sj
         O165DPYtnkmHHkobVPdgYfxJClmPk5NnGkK2BB/U+RgHkPik0DEdM5GhQK+NZIDiN6Od
         kojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=op9wScPI33f2ZOlCY/RZbSVNoKYXZMr7L+XLezl5RMY=;
        fh=wIliqLXJdFpL1S/grWIbGVBtyZAicFWL2oW9SZtBpYc=;
        b=o23imVOcXB8qpQgBWayuXiyVw7kEWpsPbweW2hO22KcO2ZMWrsXmMmRvs15PIhUepw
         6dBZtHKj4q72JhleUpPycsiC3oTip+pgCsQgJbU/cfcdt4iB/W4zwmEGiKdSIMXtM612
         HbPlLVzWdtOZgwhpxpLDfTy+mA7SUr1sW62Wor7tNcFCpFhq+O7j0j6v4YDb7Kjd5v24
         gc6AiROXrBXdeACl4nqDCIpwLMLLkkA26nb9DOMc9i3rDqdB52SCAyZoauqzGSH5CbE+
         uFvxVL2cWNmQqutmR4SGXZY0TiSxx+B2NkUqGIyhg1424e8brEtWzF0VaZ9DF0WN2fdf
         LYxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783701612; x=1784306412; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=op9wScPI33f2ZOlCY/RZbSVNoKYXZMr7L+XLezl5RMY=;
        b=JZjYW4ivlD3voHrO7v79yvpQEWpR+gjUOOJEP7bJKLT8/HySLS56MoB10QBfPevq4p
         G6DhDbG2ssh/lvYzPboZqxSjd5f7kB+Cv0znFx3T3jnaZt7je7F9u1ZfirmRCssMcdo/
         PGS1/sNNOP9vOQm9oh4DYAUpEJZ8BNc+wiNXPg+xCHmQA0lpG+z/kdac7CIAA5LCr0qY
         YV6N7uUXEgwoXzRCGO/QtIShAbZ4hQ2KJixk3knOL+Q/gUd5DMPvl01Qzg6G8ANBrL2n
         /xzTqRbJFQUBPcX5CZ1aCjLzgy2VJZiTPlHE9GaJ/pFcYDarPSl0NP/J/6NwcYFyHMjq
         yyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701612; x=1784306412;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=op9wScPI33f2ZOlCY/RZbSVNoKYXZMr7L+XLezl5RMY=;
        b=hy2EN5sMUUqops7GGnsp3l+WarArpNyNy1k7FWbMuCaFt2Qhk3w5VfnN/R8CtsX4IL
         +m91ht/Dq+I2iCl0fCPnq34nIW7sF3CDihg9NsIcSo0s65ZD6HqMUgu7mfoCzmX0Z/KK
         x7WG6MOdjVPQ3MP+cmR0BrcSrsbs8VZu2ipBtsBhDLcoz+fh+0BwhTR9HMz5NwUcosyS
         jYuNcnb8fjXQDrsavad9UZWDsOgjgxWIdkoAnpoCXTQxXfEgyVoHGHD/zeh7Lxc3m3j6
         L2OFZpv6hIOp3q5V7lBCDTe7Te70uPX1UoZX3Hjh7u+8Qz1fwg+Sxy1p7yLAzc9Hevf6
         rMtA==
X-Forwarded-Encrypted: i=1; AHgh+RrG5Cl8KIP7JFdpoAjweDVfiQUpvJSpmJpyCRAWicwT1wUj9uF6yZmwTKg1zyRsZRylDtbqsVFiPVszlTC9xxJtnatw@vger.kernel.org
X-Gm-Message-State: AOJu0YwI0uDrdG3JYzxoO45TIq28iqG+NbDur7mE+K/bS88xRsOL740r
	T8F43fqyPmLr1JRE54xBbT33do+GoRZzywn5vLPvDHgTMz4HewUGnHdh/BUzQfBG0bZNfiVcqIs
	KR8uiY/V+ICVgZPhGU7FR6c+xyj8qz6lHgSxIK6+M
X-Gm-Gg: AfdE7cnXZrMxQQaOFXgPpGPclvygTufs5hUJR3eyjoB7Qcl/+SkwWB5fIiGGJLisnm6
	LYS8xbjE/kBhbyDNPLIg5rEK1km6r/ftfvt0UFWhLOqFpB8VvliI6GOgubxMyu4pnFtN+XvUaIs
	H5RfWsvjHg+5GRsyM/TtiHN7NuGxgC2V8jiZB6TX1tmDvuuVLBwt1xLMNUCXYJZNxmvdxMqdu0X
	VHIhR2IRyNTO2qbPZzK8GQsqmvsTvLhDz7hFrK0DJbEV3dzG3J813eChBWh136nLILjri4HTQbx
	RejPmBmbEpQ3yaCLW/85Y/u0o8Q=
X-Received: by 2002:a05:690c:e20e:20b0:81e:45a6:bd4b with SMTP id
 00721157ae682-81e45a6beb8mr60026327b3.64.1783701612037; Fri, 10 Jul 2026
 09:40:12 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 09:40:11 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 09:40:11 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Fri, 10 Jul 2026 09:40:11 -0700
X-Gm-Features: AUfX_mzj-k4Cecw16XOoowahCa3WZP-cgVbjCZvyTHTeH3LzbO8RFPxq_txRErw
Message-ID: <CABtds-3w+8Ve52x8QQwES0jGe7y5O-vdRATwuqk8KnNkpd27yQ@mail.gmail.com>
Subject: [PATCH v4 2/3] firmware: Rename google firmware directory to coreboot
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	chrome-platform@lists.linux.dev
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
index 07bdba98b1b1..8cf2766d515d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11068,14 +11068,14 @@ S:	Maintained
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
-- 
2.53.0
