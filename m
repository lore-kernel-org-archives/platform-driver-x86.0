Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B0E43F086
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 21:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787002058; cv=pass; b=OHzck/WVVAOoYF2oNzntwzOAYdBGJcgD1QJZz58vFAO3UTHK/K3nLEkUVJxWw3iQXNYFrJJfIkVTT2lkfsDfaAVvxzN+MVVfXbHPNZ4jYA/xhjuFWMOp2YcQLamMUlnxVGCYUWv7Hej1CT9OLRtp3WA5Hq6w3GOYufBFkyr08DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787002058; c=relaxed/simple;
	bh=9tHY00/zVpv15LRlOltrWpIy51qnOvn2gYJhldF+wJg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRMtmuTH4uStAsajfQhDg/ZrkcYPDLp7GSgho5khAASEhEGkmuxMspWtHWidbK4RAREnVTfo5D0xhBh921n88LvLWll+efS+hGdBccnhWr+WfgED95o3adkVAoor75otA7k/l2jkLMqUopzcyZp6FDdlWN7ap12rB4aGAs7/luU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=al2g2j3v; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="al2g2j3v"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66bd7857841so2921270d50.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 14:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787002055; cv=none;
        d=google.com; s=arc-20260327;
        b=aos7Szr1Em6UjgTUmEYmS+pjesSqzIpYPgzIH3cVg5Si9+3w1uSZraWHR57CPYu25U
         vl7fOfSXBDLc8DQueHozJqjZ8Hsg3ZAuXcZD6ds6PgnT5pSjX+NJ+UxAS63ciUvBewhp
         88Qr67k1jV93aS/ixQtcF/ZCgIbJYh7qQHq7AUjkIyHvNxxC6ODrBgPg4fWo2wsWDjod
         lwCJCG6jV/77vG/RBHgiaUiVQS+LzHUKB+Mp1xcyk47UJjCnhrJY288soTwl/s4JDtrS
         86xQj+tPWkWbddmf5KRThTFEbS6yOBTmKaH86aGAdtJMJbWfjH7f5khklSJiMH7t19Vj
         thtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=ca4eMcGxa8KIFHG+pXXqzU5NDD92u+6oxQHxaxWgz1Q=;
        fh=NK7vKdR6Glm0ZZlB9z6JzPOZGyWH6nFnzFSiiNoD7j0=;
        b=ABXiOfgn9YBzZsE5aqNLg1E+rgt6t7AI4KqhV3K0f42e4XRBePbYOcEWYRQiwL47uO
         b+AdBfXYwQ1J1ksmGz9T0H/tcwcambJ8RYQ9Wlf3LZtYmy1hEoTuwPf62tFLOHkxUXf9
         8o+6I2HcBNkyBwjQdxyG3z0vmfNMkVaM6HJ1lPYo93wjZS9ucnILm+O9uediZasETN/Z
         2+YtFzxdMvs9TLgxxRbTapDrcJWgxM21FVw5jY3/1m2mtKXKHmahAhFtUIZGtXsWFIRW
         sAodOgJYoPWRKfiz6oAme6TY+/5lc1M7BGWTOJx1Ud01ATL8DyLyF1P2R3C5ju3abc17
         kPtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787002055; x=1787606855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ca4eMcGxa8KIFHG+pXXqzU5NDD92u+6oxQHxaxWgz1Q=;
        b=al2g2j3v71X7bHLAtxRma20YNbrz4ZhPO65njhvbqnW17JDXVilPFBBZpWJbg3pO21
         UuhStdHsG1pWKbCTT1P5qftl2moDzQYnmJVzjxwTe1YGaSn6dWPeBaMY3GN6fxMYc6nj
         szRkrD27K9GPqf99UnW+CFzgHI+1tZ46wUXRiIWk2BAqUcrpC7kOX272gDaiSEtF5YOj
         gpLed2wXFyUr4cL9poJngQk0zboM6L/vx5nwivs0ukrQVWb55m6QwCt6/K1STkywgUDg
         iOVCX4HxIXWqpA9EC/sRSRjwYB2FtunsibJ2mZPXbe1NFTcQaQFAElEgKB+2tofDtKKQ
         2JeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787002055; x=1787606855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ca4eMcGxa8KIFHG+pXXqzU5NDD92u+6oxQHxaxWgz1Q=;
        b=Zvt/FBvF7nZRrkgqMd2b1+F4gmcsztalmupkh7xqpSdiUAZZ4AG4ZcHHacSk2JUMfs
         7m4WX+sOGx5CVc4VHQ7vl5lbLNWpDSWKGr9hYyLGuRoIwEfXtYEfmt1poGgsE+QR4Exz
         9NuuMmNqxEtU0E26rEYAjDB6tKGD2nIli6wn0Q2/Ajuq2vGujoHGCc6G3n8YUD2aSxMo
         N7U3wLQBHT/8CwkBeKuUnQ/T+MCXtHeQVH6JGlncvtKWKDDox7hTo55mRywKILkDUfS/
         4WATdhEPzjXOkmeNu1YqJiWTqp7ATagtpvV3jjXdVFgZxwN/VXh8DCGte3joyy0In4uU
         +YdA==
X-Forwarded-Encrypted: i=1; AHgh+RqAMNqxWbDx3PBY7/uG1YobF9VmN/4qsczRTbs37j8FiyQvFHogLeNovNHJfGZixnq5j5mOVAeBX9ZFOT/1o/iqnsYa@vger.kernel.org
X-Gm-Message-State: AOJu0YzX2jnbuQeDNOk4Q/SmEm8DhFzKE/HyfHb2csYWl5Fz3/qSTjKC
	CUwdiVz+m6OC3JBIg7mhhobVYZGE1dtADkB/YUlK0wQPn/ESW0qy6ApDfXycHnbuzl2pNX679Oi
	KnrnB5Hq682ZsZtif0m0+4M9bWqjL0wWp4RthZ83F
X-Gm-Gg: AR+sD130L9sxf5hTUMIVsyLj8vzxtBlfBPWS5A8bGSCWEMezVsOo0+2MECx2Xgj8ee0
	FgAUQfHecnUwfTfOFFKB5G1PgQeeb2QchnfDS/lKh/kAXSm+nKhlebDZZ+SoTKqLO19cI8bpQUO
	iNHxVfCUJyOzgtPmgDkO5gZ9dZW/7llClVqj8L5Pcvp0TyT9rrnxaJeZB8kkshii5HVHmB0xAZq
	wgivxI9+pzfnoxiueQzQuiY/zo0yPAmpbqGW3fVcdxEBfNbFvraeAiwXTw2Dm7bl0xF7ccReULT
	TiLrxJfeMGyjDQHepRX/wSEDnjiyRPmw5Uv5w0KXCR4Nu5vi6QadlmnW+AoYu3m6lhoAd1tC
X-Received: by 2002:a05:690e:e85:b0:669:113d:7183 with SMTP id
 956f58d0204a3-66c72d282cdmr10287083d50.40.1787002054766; Mon, 17 Aug 2026
 14:27:34 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:27:33 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:27:33 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
References: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Mon, 17 Aug 2026 14:27:33 -0700
X-Gm-Features: AcwNN1V14uoooqWOX3w5engFL_zlRkFbkdBnAzwUKfuDQAraspdTlsGVuLqqdKw
Message-ID: <CABtds-2zdAbqAWJd+6HD3zU-017jUKZd_QYmdFw60FDqF3aEXg@mail.gmail.com>
Subject: [PATCH v13 2/5] firmware: Move firmware attributes class helper
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
index 8014b9f8253e..caef5ab15a4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10106,6 +10106,14 @@ F:	include/linux/firewire.h
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
diff --git a/drivers/firmware/x86/firmware_attributes_class.c
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
--=20
2.53.0
