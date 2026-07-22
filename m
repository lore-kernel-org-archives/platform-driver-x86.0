Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73D63E16B9
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2026 20:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750728; cv=pass; b=NiRDAbb/6DTqWKAAVKtTJ7xi7OjQiFd5v3IEF4w24X64wQenCSO4wuiRGbsnY7sy8Ty2J7py3AgS4qQXQLmrRUl5rtQUPs/bPZUZyG9gKVirVVmG61WhFaZev178YffCRW/h5F47S+3XX+WOZ56nQCjF7kba/izUsTzUO/3UBJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750728; c=relaxed/simple;
	bh=IxYClJWT4i1RqJwNBxrT0irY7XxVoQ8l/y86jKl+r2w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=haRVKMBBURDialJMCfMbkzjHeiFYIrhsFZVNt+IdvnqyMmUECFNIvZZFf+698sfMxhkA8QVnASAMRCfWMEMbocRUSlWRQ5jY3v9Yka/ngSE6dpIZWf/FJjzynUucvNvEgoC9B3hsafAJtGoFGEB8orspPSwlN0OCczzAc3mOr6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=hP9eXZqR; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="hP9eXZqR"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6685001353fso4556914d50.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2026 13:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784750726; cv=none;
        d=google.com; s=arc-20260327;
        b=qBxjjj7g49TPYwG74SsSoddsv3DVsdcb3Lk7ys19b4UGCWW6mzvSSZKNwaP9FHXIZF
         YFkk+I5a2Br45CjknuskTEuVqjDNk3jfZIUVcCBNuKxis2oWUPTE8xsZjJ5y4BkkMcuf
         ianQduuH+SRDKOZ99HK9sWw54n+J5dy7mLj5IiQdixC5ZQaDfnpQJl+vdLwUK7FI/d8K
         dScxyMVLcr7sh+WG/60+GLXqlclCWlcRZXwjCxQ/K0AFygfc4KEfsjo0mmHhP4mR0u5e
         bRgkxeswC3B4fOlWc8+ExMty7TAFcGXNepsEal3J+sc32SU7P2hjYkqa4EeMrz3HVPo6
         VsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=hlvWPCqElfG2Cldp43RMlu5ErGVRXjf05pzcHyrFQXk=;
        fh=SPD7XxgIieNLSJYbGgF3IFOyecsPjn+G5mt9vj39F7g=;
        b=FZKOO2HO1UxwX1+GsIUBUfGBHb9DHtIXlmxfF9sIPSWdDUbPjfuSnUTHlk71fzf2GD
         0GqyD0bTBRuXZcOEGnxpQ6o+2BsnorxJEpVLBGc+guhfch4yhZLX7UNljGqvadBetUdP
         pgAolIImzLKCZpUcIWnYBoy+V4WKfhBPQjlsAt9UbbUXidJKzB8PK/tapI75/G/uZI1d
         Kw+RPWCLUp33WcPsh2hEuWUhiKY3Qz2PvJ1sfKQBYUlbbYhSfhv7udrdAXEoHXgk3JCF
         8iHwWCpOHsfp7RAjG88n5V56ftkDY36vSobBFVOzVEZrD4W4QwvyMYVzpkcgPbLBrwBv
         8/Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1784750726; x=1785355526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlvWPCqElfG2Cldp43RMlu5ErGVRXjf05pzcHyrFQXk=;
        b=hP9eXZqRyP4KfoT7ovhAe9pjfsknitkBv+IaIrBa4JqB4hcYQdmXn9lee82ccyehQZ
         l6pNEysksrlIQW5S50UKZuD626vaPDIgif8ospZLJZM90fO48TDO/govMlvwTPx2p1jN
         yJPGn0zXgJKNsgGaSERHzyy2JI02b2ruL5UJ3GeIwdV7d6C+jgaMrBSsHPKWKH65OjbM
         vQw+pEm0SO7UyrKbk/JmqPLZAfUttQ07OfxhOTdu0Ru9mMRXUrz+OVbA90TZm6tKc/tP
         Z/9lm4/sHFOuXsMQsetpMzRxMb+H7vK+1W8h/3PW27iAGAuUf5wIaTOg0U3ae0fQuvJY
         LIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750726; x=1785355526;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hlvWPCqElfG2Cldp43RMlu5ErGVRXjf05pzcHyrFQXk=;
        b=fYV6QT5qdvX/+Z1+UIUk/5GImTKewqbOxhYU4uK+nWbkPYVKEqubA2f1XR02qDor/O
         Ayr7HNSZRYZNBeczWPJ3x4VHbMMHiC4GBwX1+rz2qzVCeCqZztDo/QJdph/tZ5PEJoGO
         v2JD4WsXBxPqlGx67ZAGVywTS8PEDx6McWwAZK4wQJWnIWZ4W1ZAAoSD5mHka5VybY/J
         aN1I6+c3ieb93iEsKU03xzcwju/2tVq2m1dCFPRO6g3/h5upJaoypIj6UCVZNTppC+pc
         9mC1rAzKu1kx9P8Y4eSXJyKJEmkI5OUHkEq1Lr1zprCs7L/LkXX6b8bmEf5g5kkwLF6Q
         8Ttw==
X-Forwarded-Encrypted: i=1; AHgh+RpWFpCsMAvDHG4vyJQlYEmLP9W5JWIeOEliK04hL1rXjEv6wRM2TeQ/oJJruZZJJMosYrVM+AnPWQjAdbEnkVSX8Bnq@vger.kernel.org
X-Gm-Message-State: AOJu0YwhxGWfHx6bQYaio1zP3XNAhsNZTJrWqn3lI+2tRH/nrbcUXReJ
	K2kitFDx9duWjPozrRofEcUsOw8lvfGlmysVm2w0BaspRBgxpplF7L7dp9TsfasIGg6ZOra3nU9
	P9vdK9K5Es3WdoSttrrbSzAwLMBRrTnnW8mMMjBJR
X-Gm-Gg: AR+sD10k9aj0xSbA4hoN8VnnJS5Gprb2zYkuqf3R33GEYNfZkSlIPmBucQKp4z4zW11
	8rSC+w78eByNYC06BMyfrUBFixGu2j/MzMKS9A0+qguOOYmtkP6wbsGCGnUp6sn3N12ZwrFCbJ7
	UXEzEAkY46L5gvY4ttakBnrnbjW9V/Kt31QKTA1/s7+rErnx59vyyA66Z+DAX3liEBOTzG+7bF3
	pqe27eVvvrF9AFKwWwq8quR8pARCR+99BZbQ+HBJuwtWnvPKGDztNO5nzusKnMFHyNf2ft38cfz
	Qxos8SbVYjLLF4o=
X-Received: by 2002:a05:690e:4493:b0:667:f3d1:532 with SMTP id
 956f58d0204a3-668a4bd4c52mr21526d50.2.1784750725675; Wed, 22 Jul 2026
 13:05:25 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 16:05:24 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 16:05:24 -0400
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 22 Jul 2026 16:05:24 -0400
X-Gm-Features: AUfX_myFi27382ARKLrS-MqO9VeTB3v662HF8g9UI2IwT-Xw0VQwiRWZiYGye_Y
Message-ID: <CABtds-3xbpZhqPCPP4TS=xTaGeB+cBkjSfYM2vMbObBpX7KZZg@mail.gmail.com>
Subject: [PATCH v8 2/4] firmware: Move firmware attributes class helper
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
index 1ab8736850ea..3b21dc411b43 100644
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
--=20
2.53.0
