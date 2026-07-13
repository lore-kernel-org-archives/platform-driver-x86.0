Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870843AD529
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930409; cv=none; b=MDx4dkVV4DusoJ5xGE0T58+QnGsP1a0etuqFnUo/hajQy/l0bXptUeVITb6jwpuBCDHQ/B6OdxvzzMg4wCCF5PmsPE+1EItSf80kIkjeMam7UaQTGg1M8Jhz6mlBIcfsU+Hg9ZubMYCjGN97J+jJptUaAHa282Nf5KS4C2JmO5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930409; c=relaxed/simple;
	bh=QY2qCsT5gS4+FUURGOFQWBEwlDJ5AoZzDXv74k/9cSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snKgx2ru1R39e2jKfno7ui4f2GuhcGyEP/I2Y00ZXyMV2ixSSwx7PlfaiQ39hMvp5NmOD8nNqtlX0luCoHqKZrRc64a5tPmh7htALP3tW2j6lcOu826FWhHLcTD75MoG0kK/WaEsp1vM5oSqoP0JILZl24EWB/lwAD+YN81ouxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=QqzK4QZj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="QqzK4QZj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f0ae9572so10707555e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 01:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783930406; x=1784535206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnOZE3fkSqZ4ELC1ntUIknKBMd0F4RA56k/w3JH2jic=;
        b=QqzK4QZjgYJZk8fdE9XM/m4S7Fuh02nshpKNR6weexg4i9XruYKSr9bM2PK/5mpNMj
         TrQzcSesNmjLFdmZMVTfnQYXTN3S5QuuUE949GfcMt3KCCKWBisEN9s2inRsDmHzo4y0
         CRTCHRoRMPqKhZOkWuRTPRtMosH23OcNby329r8FyiZHWqnh4CXJJbcAJHr/yli9ETd4
         EXHgUyvlf72JQcm5yW3gqy1qjvu11Y2mzNURPX5NwUCXST/7DaTk2pCVCcq8/b2WRqJ+
         lDi37JJFZ55FSPXHlbRNxykqE9Fwiawcf7CLewPEGKF+Wz4uvh6oMVnOTQsLrYuEUM6Q
         7KyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930406; x=1784535206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnOZE3fkSqZ4ELC1ntUIknKBMd0F4RA56k/w3JH2jic=;
        b=HJMQjtygYzNH15Tg7Z6+quH07A3Zp1e93CpLr8V4AheQQifgLBvL4SF3fs6M4bdY+X
         06kARSjcmGYJvI7ezZcSdlPcKvlnU/Fk7SUqbWF0PNtxV8X5wTm1diL3QPXxxNSWco5F
         UuFsK6DModrzJP93FCKF8sCuLCnkTRRxjAtk4X7OKQsA+rDIk9wbpgpKi8wXpmRSQ1nS
         HClwYKFY10OOAAKIN6j6Ojd4+z+nmLG8amipm+3zkYaoY/Q490MavlW3fnrKuRK5X+Zw
         NrvXrjMjTHylL0wJc53xAI55dxRS/LrZJOUc4A4WaBmxN87FB1GDJCzFrQmXkRGKcidY
         pbDw==
X-Forwarded-Encrypted: i=1; AHgh+Roa0v2OgEn2aCyeYviwOw7n0f6RWAp05wSLA1++FAfCJDywV6azKs67Vpc4fqIzaEh+mF+j/ORBElbEFnuZvs/uZC0B@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv3d+TUbmyReUsRYtCDoubotTSKyc8d4oRHR0gdGrfiSpNKfTU
	HugUqzhEKpd9Rvqus2YwWttM5duESgt0DnO/698fHdgaoPkjzhWM0efTFEbj8T6IGw==
X-Gm-Gg: AfdE7cnMTZx8j9zn4OZOj3FVUOVsv4QKv8wWnfd54kIfTn8E1aJbCQBwWTvB/sdBFIs
	Wwy/rQk1zCrd/xXYQBpk0SWXjPddhbavMtO2vW3xjRCuFCUR3TaoD5o0dGVEBUUsT7QkZttyi6v
	b8ZKk7d0wNy9vf/RLu8Om6vNAa/hy3WSWGbK+WHFCHSgrercgq4KuEK5NCHOF/m0qtL99F2yyZb
	gvZjKyyf0UWW6j5v7+sbsWp8JeTlmf5WlH1KyLXxSRrSo8ECoz6c00B4RIHx9anVWAg4hcpeEGp
	TTFpQve6jSa9m9Gl1iZn/wdqu47QDSs1y9Gc4PSjkbYpvKaIwmWSrKq3NGGgobh1CZySSDdOt1P
	/3wwjrb0wyZ3qt1C/NWmTTE0BQyxcpIGMsjapMnRQ3WmKLT1l/PWpzbwnDhbnxS1Hi3VuEUIhgB
	V53rq8sgDsg+Pe3sCeL8RR+cpK542ahGiD+cYrLD+ZS5wjMQsppxGQaZO+3s+TsEdHgcE=
X-Received: by 2002:a05:600d:6413:10b0:494:1cdd:4f9e with SMTP id 5b1f17b1804b1-4941cdd5035mr4884335e9.31.1783930405768;
        Mon, 13 Jul 2026 01:13:25 -0700 (PDT)
Received: from horizon.localdomain ([150.228.38.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73ae14sm343217885e9.11.2026.07.13.01.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:13:25 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: tzungbi@kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	prasanth.ksr@dell.com,
	jorge.lopez2@hp.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	josh@joshuagrisham.com,
	briannorris@chromium.org,
	jwerner@chromium.org,
	tzimmermann@suse.de,
	javierm@redhat.com,
	kees@kernel.org,
	u.kleine-koenig@baylibre.com,
	mst@redhat.com,
	chenhuacai@kernel.org,
	wenst@chromium.org,
	florian.fainelli@broadcom.com,
	titouan.ameline@gmail.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	chrome-platform@lists.linux.dev
Subject: [PATCH v6 2/3] firmware: Rename google firmware directory to coreboot
Date: Mon, 13 Jul 2026 09:13:16 +0100
Message-ID: <20260713081317.2954586-3-sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713081317.2954586-1-sean@starlabs.systems>
References: <20260713054526.2902319-1-sean@starlabs.systems>
 <20260713081317.2954586-1-sean@starlabs.systems>
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
diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/coreboot/Makefile
similarity index 100%
rename from drivers/firmware/google/Makefile
rename to drivers/firmware/coreboot/Makefile
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
-- 
2.53.0

