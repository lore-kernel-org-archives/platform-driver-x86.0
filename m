Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CB3434408
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701602; cv=pass; b=Iu6o9rut7Pv1N9hTPaOHvQGbG3MT9cwU/CNggQT5Wnct3N54dZn35wwnhXtJXyj1omQf0j0Dx4qQQcA2EIiszK9Rv2ptKr8u+GzDLrMto0pR9rT0PUHUMdZQPbyKkxUBDttXrHUcFLCN85gglUYxcLSxqlfoy2V8cBMyG9NgP+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701602; c=relaxed/simple;
	bh=QexclfBzaqE3+S8dAciIHYGqYjO8GqJLBm6iskWgors=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GoTvnQj+/oTwiL5v7B1vGY7tR0LBniRco7LHl+uM5kMutmVmgTyMJyw6hsOYLKdFxksc1j8Ygwmr48v/OvQ5DXd06NnbOE1m/zKtIKsS1tHpXek4IRt49WHqx3uDlQXqqiICaKwj9JpW49H3GSDkg1UQLfDcaKhbJOg+QwuxSnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=UVkU2qqA; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="UVkU2qqA"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-80a123ef90aso18996037b3.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 09:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783701600; cv=none;
        d=google.com; s=arc-20260327;
        b=RYTXcIBq9IbQ5RTU8gxbMjiDTzcswFRp3GuTm0phgNEla+1/Q41rX8UFf8gXos/Zww
         jfVFF0thcVJfwjoYeJUjE3dA8MBDSmFlwGmtauQEazhakDd2ClEKpYqsHRe3W4zFkO/l
         cMuIbpaRa/qwQiNnSz3MpDRAa8qsq+aO7AjG4wi/qoAvRmrjQWpp/iCkCB4Z8ydY6QiM
         aFK5zAg49pUk5E7eg7etC8R1oSKjstisEqSaui/q4B3r8bIvG0kr5yFnT4CTE5DpIvRd
         0KMQdkdvBr7MuN42BWsZtT+awQjouM+HqydcCvTiuZKEbOMy+egRWB09rYS6PwXq5wJB
         kLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=dcii6k10Mp2MrepC25qtb7xjfJlvzdYUQ5m4akD9Fd0=;
        fh=ePVSuxLLFLOUTqbK/PskXLGCwsMPAtR3Xo5kt4iWe94=;
        b=jEE+3e4xilki2XaGXUlriRkksvx+wo2K1fTLLrxuVne1GB3o71Z5N3v7J75WFrMmMV
         uvnwbypYIAWvvnFQ+kLrVWKGzhCsiuvLOm0HNa+xomTn87iLGzPISEK3uBeoOaZ8KR9r
         Eod1HwnGmvzm9IAS3tdg/fG3MEeoWCNZUdC9cSwnafErpBeufdcMvCi44IbfbaVvtVU7
         2sx9soSi/Vma+nEL9+yEWh7pdaiI4QojLqKQcVotnPdVzzcuTeLeUgJONI5Sinft2Kqz
         3vwHOkShzSsJp9DqaOQf/R+RvDIWIh5EwRrfgMv2jE4b15/+e7pLStSP/2NAK1hNNLNg
         CSHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783701600; x=1784306400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcii6k10Mp2MrepC25qtb7xjfJlvzdYUQ5m4akD9Fd0=;
        b=UVkU2qqAr3itzL02nEj/rjNrGLZPixPYWKj6597ssje9x7EDFdcSFa8g+gHr9QI4ia
         gWrZy3iQaTeIhKma6r09UA3hgdxQOXy/uEFFUNaluT/xMjk/r3XGc8aZfFYNerIsEi00
         w0ASsSSiD5SJZPjTLpqRM3b+0F1jqZBikiXBGdTo2IcbvdMXnRHR31kNsjIHqqzCUq6R
         0B+2SAd3inSqihEspNbQ6CXWToVzVhnQG01GMOimeWzevfQ5TRh6DKdm6reQRfDZyvLT
         p1yRuR71/KFq0ZW5jkb3P+EE+W4qAmE0lkMkkv9Mjlv973iJITcr8uhkAcWG1/ddY28L
         Z6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701600; x=1784306400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dcii6k10Mp2MrepC25qtb7xjfJlvzdYUQ5m4akD9Fd0=;
        b=ohqjPzqC1iGBG13uDGIblwU6pOxGrWXd9butfOzPymdt9AnG8NJmscEzhuvItmkTJn
         zicr73CXHCX8X+Xh3KzRXNJqFPdMN+mvQuGeHXlWs191un1uh4XvxOjcuV/UlRDXwMer
         ydsEiRUA21OjRIKvvbq9yjTCRopktF6FokxqtB2tnioCuNAM8LjGEYTsAZxC+9AVhDXx
         mlw/QsXxdo+V5Hxlmmqi/M0oB9ctgUwlgH/K/cwD7r+d3vxiLs/rW/n9bkN+CuTVRyQb
         ZC1CNzQmT7AKE/qbExfxuGSPMzVJnO51iZKOefZrXW0lTcJRnYif9pMuOILMeZeDIEpa
         DTFw==
X-Forwarded-Encrypted: i=1; AHgh+RoPJHHGdhp5eOp4mpsmz7YRSdjwPkHVFPkH0uOCioxm79Dl+4cDvGmyP7MTStIHVdR1wu41Uv3gGPXeGODN3GA4RLzq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnom+sgmFDoOwgkkb6y+r2NbiSXiifwQsPCHFSwslmYRD7H5uh
	5M83YLKd5ORQHDb1nWCGVBxan659lQxSwxYQb8T0P8pD43lHtumITEguZ/qGqbhbMWftEGqqi0w
	3oNv3sgqsL4tf24cCAOdB+aPIGUQpm5taEf9jvYqo
X-Gm-Gg: AfdE7cnaqyZNskPGJOJkTS/oh/UHU674YsSJX61mcmnbV6Lrf7eb9nWvD4Ix+RjyGW2
	UpJd9bH1doBdXq+3X16kiVpyklocjOu/JOrLW68ETCaoZyVlqgi8LGqfs+EKQwOzS8jmjLSPNlG
	mJuN1LPBUsynNqtw44COPAA2eLT0qevJ8ZvBPVUPR9nOgvd6zcHShEcU0QEt8R9NJNVYd3I0Xvf
	NzQk7GqZsfHrk6Cs3Px384o6Zhw8JtZzlGPqj0t6LYhejN9cQjVn10OnrNneO3P807Ma6xeLRCH
	zFvQraWK5UOU4EyvD9Ylw9WHV8I=
X-Received: by 2002:a05:690c:39b:b0:7f0:38f7:6ca6 with SMTP id
 00721157ae682-81e7bb51942mr32207357b3.5.1783701599655; Fri, 10 Jul 2026
 09:39:59 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 11:39:59 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 11:39:59 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Fri, 10 Jul 2026 11:39:59 -0500
X-Gm-Features: AUfX_mwHkm41UZfzpbD_kZ-vBaOyV0lUUDkcHWV7JS5YE9EqlCPxnHY3uuVWlJ0
Message-ID: <CABtds-3_6LCymxnWXVswrGAYXaBL50Jh6oSBNe1rDmLTmUXh4Q@mail.gmail.com>
Subject: [PATCH v4 1/3] firmware: Move firmware attributes class helper
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
Content-Transfer-Encoding: quoted-printable

Move the firmware attributes class helper from drivers/platform/x86 to
drivers/firmware and expose its class declaration through a public Linux
header.

The helper is not x86-specific. Keeping it in firmware lets coreboot
firmware drivers use the standard firmware-attributes ABI without living
under platform/x86.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
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
index f37a81950e25..07bdba98b1b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10114,6 +10114,14 @@ F:	include/linux/firewire.h
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
index 495dc1e31d40..93fac0d464d2 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -34,7 +34,7 @@
 #include <linux/sysfs.h>

 #include "asus-armoury.h"
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>

 #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index ab46a023cc34..85670be01647 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -16,7 +16,7 @@
 #include <linux/sysfs.h>
 #include <linux/wmi.h>
 #include "dell-wmi-sysman.h"
-#include "../../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>

 #define MAX_TYPES  4
 #include <linux/nls.h>
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 27fd6cd21529..44314ae4e5e3 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -14,7 +14,7 @@
 #include <linux/string.h>
 #include <linux/wmi.h>
 #include "bioscfg.h"
-#include "../../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/nls.h>
 #include <linux/errno.h>

diff --git a/drivers/platform/x86/lenovo/think-lmi.c
b/drivers/platform/x86/lenovo/think-lmi.c
index e215e86e3db7..a56f152b5f28 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -20,7 +20,7 @@
 #include <linux/types.h>
 #include <linux/dmi.h>
 #include <linux/wmi.h>
-#include "../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include "think-lmi.h"

 static bool debug_support;
diff --git a/drivers/platform/x86/lenovo/wmi-other.c
b/drivers/platform/x86/lenovo/wmi-other.c
index fbb32bf404f2..e9a2c4684e5f 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -50,7 +50,7 @@
 #include "wmi-capdata.h"
 #include "wmi-events.h"
 #include "wmi-helpers.h"
-#include "../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>

 #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"

diff --git a/drivers/platform/x86/samsung-galaxybook.c
b/drivers/platform/x86/samsung-galaxybook.c
index 6382af0b106c..74b8c887dd79 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -28,7 +28,7 @@
 #include <linux/uuid.h>
 #include <linux/workqueue.h>
 #include <acpi/battery.h>
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>

 #define DRIVER_NAME "samsung-galaxybook"

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
