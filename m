Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B9C4DB568
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048098; cv=pass; b=IKHaI6ieYIPkqLmIOOnwZtPhzGrltoLXdy0qPx4wy0KMk65XJu8dpU6LV9B6GEFCAqDRPVum9f9aCkEYPKFMTp5/jxmbGcwJYSQjNuG6Bvg7IZky0d2K0Hm7uC2Pc+FH1WhnlE54v+x3Yo2DvAp3bybqu8I8R4Xuxrj+gj4m8nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048098; c=relaxed/simple;
	bh=Q8xsnxF3jEw/7SM10kKTcT1xfMbd107PgsOg74WP0cw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MJglNF2WfA3lFjLIqRbN0IfGWFfWWUF4yQVrFbFUQwSOcp9xz0fSR1QfTAqSpd0qsp/tT3jI5xg6eAHzRYkXG84xZqZB1skja9xji4lu7SiKx65YK9s0oHtk2OCFIIcPSibI8AK83fOqpo8J2fIbSXFQuHmaiVIIjrxC9nSQFCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=JKehnM6U; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="JKehnM6U"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6682259cae6so2920479d50.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Aug 2026 13:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786048095; cv=none;
        d=google.com; s=arc-20260327;
        b=ZjXV8zO+OzIx4PA4B8jLtd8u22sR5xBqNaZVXdj0dMO9khIRPC3h2sOhlImm+wE89P
         B2gvGzvennoLi5zMEhFOiFM6uDX3Tau1CAzeToNqvl3vwuABNdJku4N8KRxT3cr+x02t
         DSVvk9Jf8/5oG7CdVFRcxeZXLyVxV6cMnr1lpl62n5pDL6PRl8kxhZxyu01kLH49DCuZ
         HINSFMZFD6uUAw4INL9vBT4FSzYzVcZL/kWCrPLFUjbnXIJ+zl5BdKY08tI/nkEC+y+T
         MicHjvmhbBs88hSjfhn7UWgvCz+OyFLtd6TV68NRkd99tbllB1ChJiPtXVQU42nPLjfP
         66+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=S6+EvfUzcdRKdEZLNQTWkgob6H9iavzA0+44dEG9fHY=;
        fh=kWVwhT7CO+Z2z3FOyKDNsOuK/99oRUHGQ5fPMnGWM4s=;
        b=BwRktJKT5xJUoW1seWW/hcg68EXiO5ht8Hl8LkrJB9p1Ou4van8zU/RqU9e+gYVoX4
         gNjVYtsTxA1wEcfwlJCX7iU+BDO5xje+qvhUKYd3SrN4F0GIYN3QUF7GpdR4EZIVYokw
         u7wyyY3FSEZQQBBEQfxSbgLpXBRu/tcnPSibYdTGd9Ii3+nT7oeBwKISyiz1M0l1ZnzN
         e4EIQyPw/VTulFa0mjCaY0DlRuurSdzTA9SmjH5zbcjQD2ya7DyHCaaVF9cMHzAxZrtD
         T7X/bolwviaKsf/Zvvb6iz0N1RDwlWOhJls4f7gVHR91NVswlWqaIDM0bOuYmXVtC0y1
         LJfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1786048095; x=1786652895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6+EvfUzcdRKdEZLNQTWkgob6H9iavzA0+44dEG9fHY=;
        b=JKehnM6UIrzaIj6D/KpknZAsVQsiNQQnB99SKYlHfEummo7GswSHbkYxUduj4IdUCU
         JkEia7gZNdT1biJM6jFR+y5shKivlgh0pDNPopqcapRDi6YpPizq2jp6a8OvYgR9YJCU
         c1v22On2kYScfCg5ulfS5R5516eXGFervqyBvysnxVBmGV4BBHWCpytaAUSysJk4mwlP
         dxCY5TtWgtyarWb+Ib6hpXeaZuW3nAdFhsOxDjVU1TVN4+jvO9grk1LI5Q3a8AvncGgb
         jBS38YKDTWUgSKY4Uyg/kMwkuVI8ER5xgxsjDxiIq4CquqEevd8416n1EiXkCjNXMqcW
         Xtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786048095; x=1786652895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S6+EvfUzcdRKdEZLNQTWkgob6H9iavzA0+44dEG9fHY=;
        b=baq8w5db+fzRTP8eLl31FKex25daazGMZleMXeH/UaF1erkviw1XscuQDUAICmkF1G
         EtDTMr3hm6/bj4W4kRr2zg5kpJlPCcHwk7DZp5vKCFpQzvH2R4+FR9obD5Dd1IIPBaOM
         2YJC5Nk1mH8bJe0HgnAb++8UOhNW2PEOjtRS09vFlo4/WYHWC2wsmUuw1qeO9/8MqUVo
         PNT/4HhGgpPjyrJjvePgjKgnUx1KzhxclZSGK2pkLxd/mw5sts+TAD/wHxF7DNPv5cYY
         L9hPV1BEUcIFYu5FxJYHviDmhV+OurQ2ntmhVhe2YTgForfsKD6rAxWLZ3/Gfa1F0EIx
         d41Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp4fpxXHA1VGdY18oNYnJAQgTu7Xh6gNwXC31sS6Du1085QDn5/+TL7e0HZ60izvG8aI+JCYQ0iCBFYmd02IF671rnT@vger.kernel.org
X-Gm-Message-State: AOJu0YyhKztEyHNcnJ2TQ87/nZe+Y06sk0WrZedZq0VMhj5gkX1lIIZJ
	LyevXW/7PcenfXlLDW4slUEvY3xlAl6JmKmoX+NhT1Za2rX+xU+0KTlNouzHpRvHfl64UWgdxHZ
	yYLmTDNCLx8QitKvmlqJPR2/6EGFyiD4yfCQIy9eG
X-Gm-Gg: AR+sD10UWGImb0MyVbAi+nera3x/Dy2SQVRB4xCFzYv0Yt4eeyJSJVa7YT9f7iRVZ7L
	FyTFLfQNQGpyGICtJxxvbV29zLVkIF6TbINA5sYcwxgmNTuGaNseLLkcakNQo6aNTcaM20yWayQ
	sfpw7bORg+3rW2S4WsjVNQ9zvo/2IcsUUda/ISAcgX1Q6jM7SBWOO6xk0AQLFnx4PRbq8QyUG9C
	+pmCdgVjn0vIevlHo8yYS0XbBYg81JlQnI3b89i+cDNdKp3JlqT4zLSsr2ilv+XofeMcZSeRTTR
	gsclVTtRw+1mLdKLiMnvWJuofwW/Fyc86ceTiLnxTyBMFsO7acheNOJbybkS9AGJprmCuKhS3uC
	DnQklxbVp
X-Received: by 2002:a05:690e:4548:10b0:667:fef9:364a with SMTP id
 956f58d0204a3-6699ab00b66mr8379032d50.44.1786048095063; Thu, 06 Aug 2026
 13:28:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 20:28:14 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 20:28:14 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 6 Aug 2026 20:28:14 +0000
X-Gm-Features: AUfX_mwSgC3XC75glDsSswFFwgcIHGZ5glc6wBS4jCc3mbERlVYji01wGOfvrYk
Message-ID: <CABtds-31q1yj0r=E7vrkv1LS21udzax22BVxf77W+uvPzqRO5Q@mail.gmail.com>
Subject: [PATCH v12 2/4] firmware: Move firmware attributes class helper
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
Content-Transfer-Encoding: quoted-printable

Move the firmware attributes class helper from drivers/platform/x86 to
drivers/firmware and expose its class declaration through a public Linux
header.

The helper is not x86-specific. Keeping it in firmware lets coreboot
firmware drivers use the standard firmware-attributes ABI without living
under platform/x86.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Oliver Lin <oliver@liuxiaozhen.dev>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 MAINTAINERS                                               | 8 ++++++++
 drivers/firmware/Kconfig                                  | 3 +++
 drivers/firmware/Makefile                                 | 1 +
 .../x86 =3D> firmware}/firmware_attributes_class.c          | 2 +-
 drivers/platform/x86/Kconfig                              | 3 ---
 drivers/platform/x86/Makefile                             | 2 --
 drivers/platform/x86/asus-armoury.c                       | 2 +-
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c        | 2 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c              | 2 +-
 drivers/platform/x86/lenovo/think-lmi.c                   | 2 +-
 drivers/platform/x86/lenovo/wmi-other.c                   | 2 +-
 drivers/platform/x86/samsung-galaxybook.c                 | 2 +-
 .../linux/firmware_attributes.h                           | 6 +++---
 13 files changed, 22 insertions(+), 15 deletions(-)
 rename drivers/{platform/x86 =3D> firmware}/firmware_attributes_class.c (9=
4%)
 rename drivers/platform/x86/firmware_attributes_class.h =3D>
include/linux/firmware_attributes.h (60%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f9472c1a090..e6a8c271e79d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10115,6 +10115,14 @@ F:	include/linux/firewire.h
 F:	include/uapi/linux/firewire*.h
 F:	tools/firewire/

+FIRMWARE ATTRIBUTES CLASS
+M:	Hans de Goede <hansg@kernel.org>
+M:	Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/firmware/firmware_attributes_class.c
+F:	include/linux/firmware_attributes.h
+
 FIRMWARE FRAMEWORK FOR ARMV8-A
 M:	Sudeep Holla <sudeep.holla@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 12dc70254842..78a239f8bbef 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -8,6 +8,9 @@ menu "Firmware Drivers"

 source "drivers/firmware/arm_scmi/Kconfig"

+config FW_ATTR_CLASS
+	tristate
+
 config ARM_SCPI_PROTOCOL
 	tristate "ARM System Control and Power Interface (SCPI) Message Protocol"
 	depends on ARM || ARM64 || COMPILE_TEST
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 4ddec2820c96..385b6e8b7fc6 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_FIRMWARE_MEMMAP)	+=3D memmap.o
 obj-$(CONFIG_MTK_ADSP_IPC)	+=3D mtk-adsp-ipc.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) +=3D raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+=3D qemu_fw_cfg.o
+obj-$(CONFIG_FW_ATTR_CLASS)	+=3D firmware_attributes_class.o
 obj-$(CONFIG_SYSFB)		+=3D sysfb.o
 obj-$(CONFIG_SYSFB_SIMPLEFB)	+=3D sysfb_simplefb.o
 obj-$(CONFIG_TH1520_AON_PROTOCOL) +=3D thead,th1520-aon.o
diff --git a/drivers/platform/x86/firmware_attributes_class.c
b/drivers/firmware/firmware_attributes_class.c
similarity index 94%
rename from drivers/platform/x86/firmware_attributes_class.c
rename to drivers/firmware/firmware_attributes_class.c
index 736e96c186d9..503ecc288086 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/firmware/firmware_attributes_class.c
@@ -3,7 +3,7 @@
 /* Firmware attributes class helper module */

 #include <linux/module.h>
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>

 const struct class firmware_attributes_class =3D {
 	.name =3D "firmware-attributes",
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b54b5212b204..beed14c38b54 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -926,9 +926,6 @@ config DASHARO_ACPI

 source "drivers/platform/x86/x86-android-tablets/Kconfig"

-config FW_ATTR_CLASS
-	tristate
-
 config INTEL_IMR
 	bool "Intel Isolated Memory Region support"
 	depends on X86_INTEL_QUARK && IOSF_MBI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 872ac3842391..cab20a4145e3 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -63,8 +63,6 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+=3D hp/
 # Hewlett Packard Enterprise
 obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o

-obj-$(CONFIG_FW_ATTR_CLASS)	+=3D firmware_attributes_class.o
-
 # IBM Thinkpad (before 2005)
 obj-$(CONFIG_IBM_RTL)		+=3D ibm_rtl.o
 obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps.o
diff --git a/drivers/platform/x86/asus-armoury.c
b/drivers/platform/x86/asus-armoury.c
index f3d8c5a85762..e6af93608ec5 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -20,7 +20,7 @@
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/kmod.h>
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 4ff9003c6589..963b3473991d 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -9,7 +9,7 @@

 #include <linux/align.h>
 #include <linux/dmi.h>
-#include "../../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 1965a329be48..f13f21580acd 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -8,7 +8,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

 #include <linux/errno.h>
-#include "../../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/platform/x86/lenovo/think-lmi.c
b/drivers/platform/x86/lenovo/think-lmi.c
index 9e4b3e973de9..4437785aa1f2 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -15,7 +15,7 @@
 #include <linux/array_size.h>
 #include <linux/dmi.h>
 #include <linux/errno.h>
-#include "../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/fs.h>
 #include <linux/mutex.h>
 #include <linux/string_helpers.h>
diff --git a/drivers/platform/x86/lenovo/wmi-other.c
b/drivers/platform/x86/lenovo/wmi-other.c
index fdebaa0a9992..b175971bb308 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -33,7 +33,7 @@
 #include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/export.h>
-#include "../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/gfp_types.h>
 #include <linux/hwmon.h>
 #include <linux/idr.h>
diff --git a/drivers/platform/x86/samsung-galaxybook.c
b/drivers/platform/x86/samsung-galaxybook.c
index 74103c00b0c8..3911f60c23ea 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -14,7 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/err.h>
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/i8042.h>
 #include <linux/init.h>
 #include <linux/input.h>
diff --git a/drivers/platform/x86/firmware_attributes_class.h
b/include/linux/firmware_attributes.h
similarity index 60%
rename from drivers/platform/x86/firmware_attributes_class.h
rename to include/linux/firmware_attributes.h
index d27abe54fcf9..d4026ba1fcc2 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/include/linux/firmware_attributes.h
@@ -2,11 +2,11 @@

 /* Firmware attributes class helper module */

-#ifndef FW_ATTR_CLASS_H
-#define FW_ATTR_CLASS_H
+#ifndef _LINUX_FIRMWARE_ATTRIBUTES_H
+#define _LINUX_FIRMWARE_ATTRIBUTES_H

 #include <linux/device/class.h>

 extern const struct class firmware_attributes_class;

-#endif /* FW_ATTR_CLASS_H */
+#endif /* _LINUX_FIRMWARE_ATTRIBUTES_H */
