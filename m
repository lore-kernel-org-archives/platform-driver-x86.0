Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD496421238
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2026 20:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750730; cv=pass; b=IoAHT2Yj6UmDkIlhfDW7pMhiLSJLMTJHGYpAizJOlWZ66a1vdYndP2uTEIM6QJ7Z5ViGEixH4/faKTaz/J1VmRC1wFNnUrkJk1hCoIn7EZPh0KuyImrgHVr7ymk6l1J2y4PN3vZ2eteFHikc9Np65rvbprLXR/TTaKqlKAUDh4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750730; c=relaxed/simple;
	bh=rosODR14QE/6hZPV6hpVPxFB0tVG0HjNz7dnckxwIp4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RtGkm5aJ+caxmPvH4my7SdlOhgVoT5QbpPkOBqb2i9JHQOyG9sQg+IrVd39HrG9JpAyPfv2oHDPqdTnxImhoX4Xsbvo640SJKzYK4dK31G9MZaLmIeb8B1eM9+4ZTQMHU9oWuj+qE9R03Q/+4+ET30rdm4rPvThD7EzZwDzmc4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=yNvYxDAb; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="yNvYxDAb"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664e3ed58bcso5900304d50.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2026 13:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784750727; cv=none;
        d=google.com; s=arc-20260327;
        b=KCXX6cVOZvO5B7osynudcAXF2gykbwngMJICyU/8rm2YQGQFY40QjZphYZwMg3j1rb
         O8tQlwApciswCpR+jBRLhvEBPVhxzBaeHZ5RZn1lcKnRJRgnwq8EPyQA1RLfXjcnODo9
         zqXdDZxxVHDVY4Ado5MblUBeThPTiYgvH3y+Vq0+3tabjmvDUMN50vncsaz540gstJ4Y
         YYvLVU8QI+zWEnjPRIAhZ96Vv4uZ5FDywreJOkVTs6g13bFRIupm2xX/CxUrauh9gy7K
         Ex3m8bAZUqLQEOt8HhTHslsfETDHRw3IHC/a1qspkYmy/oFHfxSmNXAsa5f1J8a1T7vj
         GMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KSt/haMiwFzJHPncExHM5YpZ6MAG8AgE75RpNaOL6MY=;
        fh=9A9i/Fzj2wTffu61OzOK+5jchbvGia5CNntBXMYyr6Q=;
        b=H3JXXUJYJgtlII6yV8RZvUx1Wzl+WmEoMZpmlVB95iwuelsv4OrUKVEVx+fvYcs9JA
         WREyyc2ZL9d8tScbr4lkTcOFKfEWSKrQLaAVGYeHbzES5nqrhtp1hNpuPmNC+nMbQiRu
         pg4Mw6ePuGhMhYYXDPtpUHx8G5vnHhHGAbBUoplcNnB4f/jQu8aSkjSOJCEGqo+iJcoV
         wgaR8tZ6T0GhVUJPuHXHcVyzKOmpl+WJv/0ekUIKxkMTGvLlhs1mxe6wv1vWQxT81p7D
         h/v31czEzjzhByjVuK1Z2s6KUvxrmgrlHE+pf1+3UjUxM7KZkXnDvhic0+oIHp4GDtHv
         UxHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1784750727; x=1785355527; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSt/haMiwFzJHPncExHM5YpZ6MAG8AgE75RpNaOL6MY=;
        b=yNvYxDAbMHuSgTe0zTzWmbUJPLxi3JjLslbVT7+3TiBh7oKn1Dvi4hLswCXCiCqopG
         yMLCTjS7l4Fq77WOHGp9cSoFwhhfzmR3DIS+yyGFHKZiJYCy+yOzkra8OvTEdPcePNo6
         l/cOlhUUpJcBDaHe0DUZ1ocxConkm1kYntnUvUCNvRjAu/xpQc9DXY8ZOPZEkn/1wjya
         2d5tp4J1J5sM6qOH10bCYY3MrOzns6CzV0yDThMaqfcJp/Rka0yU5tL56QlugovEFZB2
         EU1Xj7GGgla2y77XvQvwkqIRrFgE3DmmIjWsQOq7AS7Gswem64F68VYjTt8Uo1Cj4Sye
         b7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750727; x=1785355527;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KSt/haMiwFzJHPncExHM5YpZ6MAG8AgE75RpNaOL6MY=;
        b=bZ5uMfeBh8MduNr7+QiHiM66nXck5y3M7ln9KLN846aFsnaGdk+7eb541xdPvs9Xs9
         RCVViGeb5Z5FYvUKRHHGFxGV/WXsI4LPNMKLdndqhfQiv+IJobY85/hfea6pZVX7bptO
         VU/uDrQm77AU5trhpXyJYWA2sJhqp2I+I0OvfqWMrJjiYvHDvRgAZYBfW9QlKq3+/Yqv
         DVIHeI9wFuNckMqIvZBGOrOjiY8gnfQ45qp1Rh81n0og9gnbWoMKGYvw2ktQ8dcfihob
         WAbA27I7u33rkMd2SiWHoQLbWG7qEV9O6Xotjue9X2Se9+ZuW+n6r/2vx5G3AGZXk9gI
         D1Yg==
X-Forwarded-Encrypted: i=1; AHgh+RrofM2CBjxigHMrS39F3z83jaguqC+0KP03CkJ99MTx04N65QMd5TxuqYj8aJe7t/x5gCS2LdTRXHRiS+SjmX2lhBue@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi07yKOD5Z0i5PtHODzvYP5niRYPrw8PoW/jZyISECr6FrFGth
	Qz8oIufaos5SUVwf3PpG1V3m8Bn2FSqbcfEkqmWgOaQSUjIseIBiGMd+vBW58DJuygFX3g9sy4F
	ZkzLL7xJUWW4ijmfszncl0e5mJm7j8+r6RNoPxs5L
X-Gm-Gg: AR+sD13m0KY9ElcDPY2ZG6oiOYK+4KhVo7jfrwcAj41X59+NiohaahMXTiC4962xTP7
	QC8oknOg0TS2Rt3/8S3hb5+yEGnYz9cxk+cOCYhPudPCneCGHbbkN9KjVanTlAnZMHIGLJFZFfC
	ueT/zQrN/jGhA1J5bB3mEH+2TSj2SJ9CT8HYJbBk7n/GEZmKYtnrdCM25rORSqjSjzH40mHvdnS
	MDsg37TQKwUx+U5GVlYUxlVr3JQJCpMEJesAHSOus6eCWt8Qye7Jc391UQL8l3gaMGG9s6iK5CD
	VsdAnWf6VVx+6TI=
X-Received: by 2002:a05:690e:14f:b0:668:7e58:6fe9 with SMTP id
 956f58d0204a3-6688e5bffdbmr1125283d50.19.1784750726777; Wed, 22 Jul 2026
 13:05:26 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 13:05:26 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 13:05:26 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 22 Jul 2026 13:05:26 -0700
X-Gm-Features: AUfX_my9UKXk0h8rioGnf6FqwM-aWLzKxXHCNtyl62_XhENaQfbw2gQ-V8uXvZY
Message-ID: <CABtds-1i6o9EiBM_q=4PMXmDPobKx65A2jxEQXCi6O21kFrpfA@mail.gmail.com>
Subject: [PATCH v8 3/4] firmware: Rename google firmware directory to coreboot
To: tzungbi@kernel.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com, 
	luke@ljones.dev, denis.benato@linux.dev, prasanth.ksr@dell.com, 
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	josh@joshuagrisham.com, briannorris@chromium.org, jwerner@chromium.org, 
	tzimmermann@suse.de, javierm@redhat.com, kees@kernel.org, 
	u.kleine-koenig@baylibre.com, mst@redhat.com, chenhuacai@kernel.org, 
	wenst@chromium.org, florian.fainelli@broadcom.com, titouan.ameline@gmail.com, 
	oliver@liuxiaozhen.dev, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	chrome-platform@lists.linux.dev, sean@starlabs.systems
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
index 3b21dc411b43..8c2634a8dc13 100644
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
-- 
2.53.0
