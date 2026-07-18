Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0446923393D
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Jul 2026 02:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784341337; cv=none; b=kseDD1z8HK22Q6rxKCHph03M8RzSVYyLXgBPKFAvJpjlVlIBMua0hemlTq56PPwQ7uciwskzLJTqFZr8ayiFVQpA+c1x6mqnxnCt496f7tSAfRaS/TIaDVrlX3yAGXdLC+eFsm6YLPhM4mjaaUJz5IaHgj0AKd1ETpV8+eXkm5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784341337; c=relaxed/simple;
	bh=Edh2TrG99oQiXSL/ZsaqNhwjoJJlC/LprqcxSVNNNVU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=X9Hyl5tFce+DKCz+rBFEXuQIXyWRdQpfPKDLjZq9dd7hIkzOb4/Ax4c5HjaiMElECTkMZ5H06CKSgjlsfjF+m9u8JVVaV5rgX8D7cNKIqomgh3YOtbJ6bfo5PxCVRd5tqVA+ysshardNNLfjIqvI6+9vPACC2QuEAf7iNEhMhy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6+4ON0C; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6+4ON0C"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca965de53baso2844522a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 19:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784341334; x=1784946134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ExB1p3Z3IT7x/9bhPdQsOZ/rnXj+b/pRJqJqdJYDkHU=;
        b=c6+4ON0C8FwRvkVpItnOh561cmlETcKPjvbfle3Kc7mr4oucMlR5ZoSnuPYvp/FovL
         zjbayGYEIld6HTxy9/zqouqC7SP+KrKQLbOIizSh3gL0Ocsk7Ck9K0z0c22kZ6kSzZ1+
         pmk9hF90PcOBQZHRt8/863x4J1hVgmkXYXgnBOUMvbvc003CdGDra69NnV10oZ6YeXpW
         n9SE3rqKX+Qo103A2y71WglsjWDPliBsleicGcVRTlVw31+OcFkIJCxbgM+9ox991SIp
         txhJicVVUZhWOfOwO7661YYvsRFx+Mhamq8PVRxBEIK18Hpr56+dZJk88f0Cj7zcrWky
         1Pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784341334; x=1784946134;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExB1p3Z3IT7x/9bhPdQsOZ/rnXj+b/pRJqJqdJYDkHU=;
        b=nl+9pskajCYbpdeGECcClti/NnSB5bz314zYNH0Db5rNEkl0Hw0oTPzBD/i4xc+H5B
         NvboD/6O28ZpEJoFvxoXxPrGzpFO1tW1/CSLoANuotjkSHa9spd667JfP7NgFOEGPxVk
         AqCpb7BPGli+Fgncc2nhmPp3bw6tLTEzRvD6d0MxVBpAru7+AxsJ0fxQvETt22S28bpx
         hEKKRDSaJU9mcBQ0tyvFHyee3eVhN821qdDJo/38iTenmGdriuagd4jI815joJ7h9O54
         jbLPpLMg1s2i/+BI0QfXawFJtnVkRR01Ccpk6AZTVauBSwDXXEYl/lsM8oUfOYSZEiWZ
         FjTg==
X-Forwarded-Encrypted: i=1; AHgh+RpTScyi+y86KkxlFlSsiQMp1WlaV03Md+ilu9FcIfUeZRA9gIFKgIcjzeGCjLy/foHyzETleZWaorkoEkzQn7u7K0DA@vger.kernel.org
X-Gm-Message-State: AOJu0YzST0dp1O7xJN7zPI+bU4DnQ54p07pgydYFkb4dJzPj6jTBD9/x
	skZNIN61P27wu9mQj1PotGuUCsCB/fQUclB36ONeJJYW2l3Oz/kRbXBC
X-Gm-Gg: AfdE7ckPonlysU2/4yNJswxBzd1uw0gS0/+PvgsvaMjU9LTPkkNWUBHiAFTK+AsYPoJ
	n7A3HKjwoM1CZ6T6BD7FoYgseyFn6I/D0frtBykZWifQRB1M3kkr+jy0H5d1mhjFJL5K9CFxhKw
	Dwoxnx4k/vIwd7fvM1XL5dFw0YznJhOcS4XP8/p/RSuHUpfy40TFhQyJHKkg9tHb7zZLjE7WqzJ
	K1ANEo0EU0OzbFRlFIZSESt3/ODFT2xeIvEPjoCi5KUZg/Orjd4OsrhgRluHiG4arnUnrPFQe65
	THjYR56FKOAxnl4O5JQAfjn62nFwTSmNZNWWv1DKCJGRb+w1l1goRd7zQ72NUnIg/yIHRWAcjzR
	BAJ5JXO6nivajZ2EOQ5IDqukQ62bkzXc4lZIfKw9hQ5T3Gfrtr1DjnGD+IeJJDOHvR6wWnQeY9R
	BxdqwMUxsBwWJZ7PGcE7MPDEwldpfDAZpFlkoO1/78HdWjVmX3Wr3epTtmQ8W6v4RMp3j7QvD4
X-Received: by 2002:a05:6300:95:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3c3ad79fb45mr5829768637.8.1784341334288;
        Fri, 17 Jul 2026 19:22:14 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20c158sm12581874eec.29.2026.07.17.19.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 19:22:13 -0700 (PDT)
Date: Fri, 17 Jul 2026 19:22:08 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Sean Rhodes <sean@starlabs.systems>, tzungbi@kernel.org
CC: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 luke@ljones.dev, denis.benato@linux.dev, prasanth.ksr@dell.com,
 jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, josh@joshuagrisham.com,
 briannorris@chromium.org, jwerner@chromium.org, tzimmermann@suse.de,
 javierm@redhat.com, kees@kernel.org, u.kleine-koenig@baylibre.com,
 mst@redhat.com, chenhuacai@kernel.org, wenst@chromium.org,
 florian.fainelli@broadcom.com, titouan.ameline@gmail.com,
 oliver@liuxiaozhen.dev, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 1/3] firmware: Move firmware attributes class helper
User-Agent: Thunderbird for Android
In-Reply-To: <20260717085003.369496-2-sean@starlabs.systems>
References: <20260717085003.369496-1-sean@starlabs.systems> <20260717085003.369496-2-sean@starlabs.systems>
Message-ID: <99A0E55C-A79E-4BBC-B7E6-B5F4172F62AD@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 17, 2026 1:50:01 AM PDT, Sean Rhodes <sean@starlabs=2Esystems> wrot=
e:
>Move the firmware attributes class helper from drivers/platform/x86 to
>drivers/firmware and expose its class declaration through a public Linux
>header=2E
>
>The helper is not x86-specific=2E Keeping it in firmware lets coreboot
>firmware drivers use the standard firmware-attributes ABI without living
>under platform/x86=2E
>
>Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>Tested-by: Oliver Lin <oliver@liuxiaozhen=2Edev>
>Signed-off-by: Sean Rhodes <sean@starlabs=2Esystems>
>---
> MAINTAINERS                                               | 8 ++++++++
> drivers/firmware/Kconfig                                  | 3 +++
> drivers/firmware/Makefile                                 | 1 +
> =2E=2E=2E/x86 =3D> firmware}/firmware_attributes_class=2Ec          | 2 =
+-
> drivers/platform/x86/Kconfig                              | 3 ---
> drivers/platform/x86/Makefile                             | 2 --
> drivers/platform/x86/asus-armoury=2Ec                       | 2 +-
> drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec        | 2 +-
> drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec              | 2 +-
> drivers/platform/x86/lenovo/think-lmi=2Ec                   | 2 +-
> drivers/platform/x86/lenovo/wmi-other=2Ec                   | 2 +-
> drivers/platform/x86/samsung-galaxybook=2Ec                 | 2 +-
> =2E=2E=2E/linux/firmware_attributes=2Eh                           | 6 ++=
+---
> 13 files changed, 22 insertions(+), 15 deletions(-)
> rename drivers/{platform/x86 =3D> firmware}/firmware_attributes_class=2E=
c (94%)
> rename drivers/platform/x86/firmware_attributes_class=2Eh =3D> include/l=
inux/firmware_attributes=2Eh (60%)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index f37a81950e25=2E=2E07bdba98b1b1 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -10114,6 +10114,14 @@ F:	include/linux/firewire=2Eh
> F:	include/uapi/linux/firewire*=2Eh
> F:	tools/firewire/
>=20
>+FIRMWARE ATTRIBUTES CLASS
>+M:	Hans de Goede <hansg@kernel=2Eorg>
>+M:	Ilpo J=C3=A4rvinen <ilpo=2Ejarvinen@linux=2Eintel=2Ecom>
>+L:	platform-driver-x86@vger=2Ekernel=2Eorg
>+S:	Maintained
>+F:	drivers/firmware/firmware_attributes_class=2Ec
>+F:	include/linux/firmware_attributes=2Eh
>+
> FIRMWARE FRAMEWORK FOR ARMV8-A
> M:	Sudeep Holla <sudeep=2Eholla@kernel=2Eorg>
> L:	linux-arm-kernel@lists=2Einfradead=2Eorg (moderated for non-subscribe=
rs)
>diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
>index 12dc70254842=2E=2E78a239f8bbef 100644
>--- a/drivers/firmware/Kconfig
>+++ b/drivers/firmware/Kconfig
>@@ -8,6 +8,9 @@ menu "Firmware Drivers"
>=20
> source "drivers/firmware/arm_scmi/Kconfig"
>=20
>+config FW_ATTR_CLASS
>+	tristate
>+
> config ARM_SCPI_PROTOCOL
> 	tristate "ARM System Control and Power Interface (SCPI) Message Protoco=
l"
> 	depends on ARM || ARM64 || COMPILE_TEST
>diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
>index 4ddec2820c96=2E=2E385b6e8b7fc6 100644
>--- a/drivers/firmware/Makefile
>+++ b/drivers/firmware/Makefile
>@@ -16,6 +16,7 @@ obj-$(CONFIG_FIRMWARE_MEMMAP)	+=3D memmap=2Eo
> obj-$(CONFIG_MTK_ADSP_IPC)	+=3D mtk-adsp-ipc=2Eo
> obj-$(CONFIG_RASPBERRYPI_FIRMWARE) +=3D raspberrypi=2Eo
> obj-$(CONFIG_FW_CFG_SYSFS)	+=3D qemu_fw_cfg=2Eo
>+obj-$(CONFIG_FW_ATTR_CLASS)	+=3D firmware_attributes_class=2Eo
> obj-$(CONFIG_SYSFB)		+=3D sysfb=2Eo
> obj-$(CONFIG_SYSFB_SIMPLEFB)	+=3D sysfb_simplefb=2Eo
> obj-$(CONFIG_TH1520_AON_PROTOCOL) +=3D thead,th1520-aon=2Eo
>diff --git a/drivers/platform/x86/firmware_attributes_class=2Ec b/drivers=
/firmware/firmware_attributes_class=2Ec
>similarity index 94%
>rename from drivers/platform/x86/firmware_attributes_class=2Ec
>rename to drivers/firmware/firmware_attributes_class=2Ec
>index 736e96c186d9=2E=2E503ecc288086 100644
>--- a/drivers/platform/x86/firmware_attributes_class=2Ec
>+++ b/drivers/firmware/firmware_attributes_class=2Ec
>@@ -3,7 +3,7 @@
> /* Firmware attributes class helper module */
>=20
> #include <linux/module=2Eh>
>-#include "firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
>=20

Hi Sean,

I think there is a middle ground between just renaming these while knowing=
ly having them all in the wrong spot, and reorganizing all the includes for=
 drivers whose includes aren't properly alphabetized in a single patch=2E O=
ne of these options would be preferable:

- Introduce a cleanup patch before the rename that does the reordering, th=
en rename in the correct order=2E

- Do the rename without a full reordering, placing the firmware attributes=
 include right after its preceding alphabetical order location so that it w=
ouldn't need to be moved if someone else does a full reordering later=2E

Personally I think the first option is better, but if that's out of your d=
esired scope or you're worried about additional effects in existing drivers=
 then please at least do the second option=2E

Thanks,
Derek

> const struct class firmware_attributes_class =3D {
> 	=2Ename =3D "firmware-attributes",
>diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>index b54b5212b204=2E=2Ebeed14c38b54 100644
>--- a/drivers/platform/x86/Kconfig
>+++ b/drivers/platform/x86/Kconfig
>@@ -926,9 +926,6 @@ config DASHARO_ACPI
>=20
> source "drivers/platform/x86/x86-android-tablets/Kconfig"
>=20
>-config FW_ATTR_CLASS
>-	tristate
>-
> config INTEL_IMR
> 	bool "Intel Isolated Memory Region support"
> 	depends on X86_INTEL_QUARK && IOSF_MBI
>diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
>index 872ac3842391=2E=2Ecab20a4145e3 100644
>--- a/drivers/platform/x86/Makefile
>+++ b/drivers/platform/x86/Makefile
>@@ -63,8 +63,6 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+=3D hp/
> # Hewlett Packard Enterprise
> obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs=2Eo
>=20
>-obj-$(CONFIG_FW_ATTR_CLASS)	+=3D firmware_attributes_class=2Eo
>-
> # IBM Thinkpad (before 2005)
> obj-$(CONFIG_IBM_RTL)		+=3D ibm_rtl=2Eo
> obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps=2Eo
>diff --git a/drivers/platform/x86/asus-armoury=2Ec b/drivers/platform/x86=
/asus-armoury=2Ec
>index 495dc1e31d40=2E=2E93fac0d464d2 100644
>--- a/drivers/platform/x86/asus-armoury=2Ec
>+++ b/drivers/platform/x86/asus-armoury=2Ec
>@@ -34,7 +34,7 @@
> #include <linux/sysfs=2Eh>
>=20
> #include "asus-armoury=2Eh"
>-#include "firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
>=20
> #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
>=20
>diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec b/drive=
rs/platform/x86/dell/dell-wmi-sysman/sysman=2Ec
>index ab46a023cc34=2E=2E85670be01647 100644
>--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec
>+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec
>@@ -16,7 +16,7 @@
> #include <linux/sysfs=2Eh>
> #include <linux/wmi=2Eh>
> #include "dell-wmi-sysman=2Eh"
>-#include "=2E=2E/=2E=2E/firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
>=20
> #define MAX_TYPES  4
> #include <linux/nls=2Eh>
>diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec b/drivers/pla=
tform/x86/hp/hp-bioscfg/bioscfg=2Ec
>index 27fd6cd21529=2E=2E44314ae4e5e3 100644
>--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec
>+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec
>@@ -14,7 +14,7 @@
> #include <linux/string=2Eh>
> #include <linux/wmi=2Eh>
> #include "bioscfg=2Eh"
>-#include "=2E=2E/=2E=2E/firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
> #include <linux/nls=2Eh>
> #include <linux/errno=2Eh>
>=20
>diff --git a/drivers/platform/x86/lenovo/think-lmi=2Ec b/drivers/platform=
/x86/lenovo/think-lmi=2Ec
>index e215e86e3db7=2E=2Ea56f152b5f28 100644
>--- a/drivers/platform/x86/lenovo/think-lmi=2Ec
>+++ b/drivers/platform/x86/lenovo/think-lmi=2Ec
>@@ -20,7 +20,7 @@
> #include <linux/types=2Eh>
> #include <linux/dmi=2Eh>
> #include <linux/wmi=2Eh>
>-#include "=2E=2E/firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
> #include "think-lmi=2Eh"
>=20
> static bool debug_support;
>diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platform=
/x86/lenovo/wmi-other=2Ec
>index fbb32bf404f2=2E=2Ee9a2c4684e5f 100644
>--- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>+++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>@@ -50,7 +50,7 @@
> #include "wmi-capdata=2Eh"
> #include "wmi-events=2Eh"
> #include "wmi-helpers=2Eh"
>-#include "=2E=2E/firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
>=20
> #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
>=20
>diff --git a/drivers/platform/x86/samsung-galaxybook=2Ec b/drivers/platfo=
rm/x86/samsung-galaxybook=2Ec
>index 6382af0b106c=2E=2E74b8c887dd79 100644
>--- a/drivers/platform/x86/samsung-galaxybook=2Ec
>+++ b/drivers/platform/x86/samsung-galaxybook=2Ec
>@@ -28,7 +28,7 @@
> #include <linux/uuid=2Eh>
> #include <linux/workqueue=2Eh>
> #include <acpi/battery=2Eh>
>-#include "firmware_attributes_class=2Eh"
>+#include <linux/firmware_attributes=2Eh>
>=20
> #define DRIVER_NAME "samsung-galaxybook"
>=20
>diff --git a/drivers/platform/x86/firmware_attributes_class=2Eh b/include=
/linux/firmware_attributes=2Eh
>similarity index 60%
>rename from drivers/platform/x86/firmware_attributes_class=2Eh
>rename to include/linux/firmware_attributes=2Eh
>index d27abe54fcf9=2E=2Ed4026ba1fcc2 100644
>--- a/drivers/platform/x86/firmware_attributes_class=2Eh
>+++ b/include/linux/firmware_attributes=2Eh
>@@ -2,11 +2,11 @@
>=20
> /* Firmware attributes class helper module */
>=20
>-#ifndef FW_ATTR_CLASS_H
>-#define FW_ATTR_CLASS_H
>+#ifndef _LINUX_FIRMWARE_ATTRIBUTES_H
>+#define _LINUX_FIRMWARE_ATTRIBUTES_H
>=20
> #include <linux/device/class=2Eh>
>=20
> extern const struct class firmware_attributes_class;
>=20
>-#endif /* FW_ATTR_CLASS_H */
>+#endif /* _LINUX_FIRMWARE_ATTRIBUTES_H */

