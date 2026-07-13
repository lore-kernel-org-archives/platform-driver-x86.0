Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EAE3D565C
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937028; cv=none; b=BJCBE1umj2EGArr1I2lwtZNMYiQ5EuIb4OU8LaD8AJbY9hoWqFofNTDRUyxy0Lx2QW2OlC/kkqKEp0/cFaDTbP0tRq61u3Sn+sWi1j5nkdEa4C7BuciKNUnFgNigsLyKiuyHEfIxEuDuy+OYPCPvFlgsD/yFLk89NMqFZoLLWDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937028; c=relaxed/simple;
	bh=rZLJPUDT8jhsluoSbsrWzkVzj6g466jnf7jZpdr5roY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=hd8tX9UDpbZV0mCVDmvQ7toNGPywUrXCvEmzKau53RuZlTHsaTq7rE9rlEJk6EytgsYT4ldp6zxk1UbxVY6Kpz8VF5+8879IWm/XFYlw9vBb9opXZj+dAUqyPICsMFhGHGHbeEcj/XVROVPaH/YZ5T3HvdBgWJirdBo9T6HkpLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjmZRQci; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjmZRQci"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc61541f8cso44834755ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783937026; x=1784541826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Cxpw3mD2ongknqfmFxDBDW3ncDwYWh6oPRa1TBYOIbY=;
        b=cjmZRQciws4Z4aSj+YYDQS9lRI88by2yiEczKFmzalkw5Q2j/VeRD8WRyNXEwh8+Zk
         RSdfVZcEVDEgWQIlfn8kU5yoTz8UdQ1lUal1wRReXl/goPZa6LT5kddpN3pQJOztpzgH
         Z5pppqO1UMY0nYzecdrNhOr6gktsf9jRORCLnPtwhVMX0pewq7Reu7DdFhY42ADzr+o+
         Frpw8LT8jXjd/HDrNd0nN+yLNPn4Ti9OpmO0SFhatUA0em6OEAsmz6l1cRpWWtFya6j5
         Y8OFl1BYpr1JVsf/ywnd6/eTJO1AOMO/UTljHS82E11b0DNPIxTC9lV9Z4GpmVts1dr7
         rbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783937026; x=1784541826;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cxpw3mD2ongknqfmFxDBDW3ncDwYWh6oPRa1TBYOIbY=;
        b=G9iGI8SpmOBKK00rTqN09/EiZdSewlye+eLF4m0SwIFynMR/45WYqYgUE1eMyLeRs+
         Kz+QEUJ9vqLKQhYh3UbL5k7zvsw4xN/uvN0fWZH111nTy1TRcseh428t0KEYq8UZjTQM
         3urZ0+frpt0KYoTREF8krBp5GCzhhe1lnPvbSdy7DpbO6NWBFr7RAqBTZFEPNZbIzOAy
         9DefbAjSPlzSADap2mxoyZqNZhHTkrj55h4JevRQI/vDk40wagsEjsphwM/ghcoQ22lj
         9UvezI4mmd43BIBpNtaF+dqsVJ3kjc1GtpvGmQIbJHTy/MqfIu0uPjwTOQMueCrxsG/j
         Tg9g==
X-Forwarded-Encrypted: i=1; AHgh+Rr174+7DrQTYkSUystv+6vS8jzw4VNRTZFvVSbiLkez9IynwfuPUjkQwGkS9NxTlFflXcS8d27pMQLWddv69D7UGFSb@vger.kernel.org
X-Gm-Message-State: AOJu0YzokPTb9p24mO434HNcwR064C9M3MWbPXCSq5YVudD1KN4O6B6p
	esfXKDY3kQLmk+jSBnHBGmwYiSFtV3E0ynzj4puW/FMksZ7lKytcyyMO
X-Gm-Gg: AfdE7cnhZX6MBZ+RNbeNWImhUKZyZXZ8+5N5A5M1y1YZj9UC8bKVUhx8aNOBQOkBeFa
	n3Vd7FibZd/2NP1Axw5T6xFoEq30d4lODdDVmwz4CnZp8VvJavSUd6ncnl7MR4yQ82oqDXIzLFq
	mJWNt5eUxo+LZO/7kwkmi569/cef3/Byx5e/XceKRgpXzMxt4qcE+gwzG0r8I/SLcL/wIVGEAZN
	nNuHyTonThVpmYNyqzFoIJjYWHz+BouWAw/4E934uGPkNHygJ/eJfOj1GG7Uo2Zq22AAzEK/FOi
	C7Mn+2XzoxmEdinnLZ+eu7eIdEuOemmj1FAnP9m/E80j5cBhEreg1pbVAE4nVtQdB2LWorBtALm
	yssjWr5FfvWkCM81Ujwecn4eAg8TmfYagNM2vQTwiGsU+VCgdIbOW14zMX1w7e0x8Z6GXyIebGO
	XAccpNjEbVRlmLqE5wWzGjd4RVB92R8lIHXgwTIfdAZqrKiKoAyL9v2HxS6Md9Myv7+7GXNQDZ
X-Received: by 2002:a17:902:d98b:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2ce8285abefmr135450165ad.6.1783937025841;
        Mon, 13 Jul 2026 03:03:45 -0700 (PDT)
Received: from ehlo.thunderbird.net (221x252x203x146.ap221.ftth.ucom.ne.jp. [221.252.203.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm96689105ad.79.2026.07.13.03.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:03:45 -0700 (PDT)
Date: Mon, 13 Jul 2026 19:03:44 +0900
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Sean Rhodes <sean@starlabs.systems>, tzungbi@kernel.org
CC: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 luke@ljones.dev, denis.benato@linux.dev, prasanth.ksr@dell.com,
 jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, josh@joshuagrisham.com,
 briannorris@chromium.org, jwerner@chromium.org, tzimmermann@suse.de,
 javierm@redhat.com, kees@kernel.org, u.kleine-koenig@baylibre.com,
 mst@redhat.com, chenhuacai@kernel.org, wenst@chromium.org,
 florian.fainelli@broadcom.com, titouan.ameline@gmail.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Dell.Client.Kernel@dell.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 1/3] firmware: Move firmware attributes class helper
User-Agent: Thunderbird for Android
In-Reply-To: <20260713081317.2954586-2-sean@starlabs.systems>
References: <20260713054526.2902319-1-sean@starlabs.systems> <20260713081317.2954586-1-sean@starlabs.systems> <20260713081317.2954586-2-sean@starlabs.systems>
Message-ID: <01401869-C099-407E-8175-174FE8EDF701@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 13, 2026 5:13:15 PM GMT+09:00, Sean Rhodes <sean@starlabs=2Esystems=
> wrote:
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
>Signed-off-by: Sean Rhodes <sean@starlabs=2Esystems>
>---
> MAINTAINERS                                              | 8 ++++++++
> drivers/firmware/Kconfig                                 | 3 +++
> drivers/firmware/Makefile                                | 1 +
> =2E=2E=2E/x86 =3D> firmware}/firmware_attributes_class=2Ec         | 2 +=
-
> drivers/platform/x86/Kconfig                             | 3 ---
> drivers/platform/x86/Makefile                            | 2 --
> drivers/platform/x86/asus-armoury=2Ec                      | 2 +-
> drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec       | 9 +++++----
> drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec             | 9 +++++----
> drivers/platform/x86/lenovo/think-lmi=2Ec                  | 5 +++--
> drivers/platform/x86/lenovo/wmi-other=2Ec                  | 2 +-
> drivers/platform/x86/samsung-galaxybook=2Ec                | 3 ++-
> =2E=2E=2E/linux/firmware_attributes=2Eh                          | 6 +++=
---
> 13 files changed, 33 insertions(+), 22 deletions(-)
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
>index 495dc1e31d40=2E=2Ee6af93608ec5 100644
>--- a/drivers/platform/x86/asus-armoury=2Ec
>+++ b/drivers/platform/x86/asus-armoury=2Ec
>@@ -20,6 +20,7 @@
> #include <linux/dmi=2Eh>
> #include <linux/err=2Eh>
> #include <linux/errno=2Eh>
>+#include <linux/firmware_attributes=2Eh>
> #include <linux/fs=2Eh>
> #include <linux/kernel=2Eh>
> #include <linux/kmod=2Eh>
>@@ -34,7 +35,6 @@
> #include <linux/sysfs=2Eh>
>=20
> #include "asus-armoury=2Eh"
>-#include "firmware_attributes_class=2Eh"
>=20
> #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
>=20
>diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec b/drive=
rs/platform/x86/dell/dell-wmi-sysman/sysman=2Ec
>index ab46a023cc34=2E=2E963b3473991d 100644
>--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec
>+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec
>@@ -8,18 +8,19 @@
> #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>=20
> #include <linux/align=2Eh>
>-#include <linux/fs=2Eh>
> #include <linux/dmi=2Eh>
>-#include <linux/module=2Eh>
>+#include <linux/firmware_attributes=2Eh>
>+#include <linux/fs=2Eh>
> #include <linux/kernel=2Eh>
>+#include <linux/module=2Eh>
>+#include <linux/nls=2Eh>
> #include <linux/string=2Eh>
> #include <linux/sysfs=2Eh>
> #include <linux/wmi=2Eh>
>+
> #include "dell-wmi-sysman=2Eh"
>-#include "=2E=2E/=2E=2E/firmware_attributes_class=2Eh"
>=20
> #define MAX_TYPES  4
>-#include <linux/nls=2Eh>
>=20
> struct wmi_sysman_priv wmi_priv =3D {
> 	=2Emutex =3D __MUTEX_INITIALIZER(wmi_priv=2Emutex),
>diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec b/drivers/pla=
tform/x86/hp/hp-bioscfg/bioscfg=2Ec
>index 27fd6cd21529=2E=2Ef13f21580acd 100644
>--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec
>+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec
>@@ -7,16 +7,17 @@
>=20
> #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>=20
>+#include <linux/errno=2Eh>
>+#include <linux/firmware_attributes=2Eh>
> #include <linux/fs=2Eh>
>-#include <linux/module=2Eh>
> #include <linux/kernel=2Eh>
>+#include <linux/module=2Eh>
>+#include <linux/nls=2Eh>
> #include <linux/printk=2Eh>
> #include <linux/string=2Eh>
> #include <linux/wmi=2Eh>
>+
> #include "bioscfg=2Eh"
>-#include "=2E=2E/=2E=2E/firmware_attributes_class=2Eh"
>-#include <linux/nls=2Eh>
>-#include <linux/errno=2Eh>
>=20

I wasn't aware so many drivers had headers out of the usual order=2E There=
 may be a reason these (and others) were in that specific order, and the ch=
anges aren't really related to the problem you're looking at=2E It would pr=
obably be better to not touch the load order of anything except the firmwar=
e_attributes header, but wait for Armin or Ilpo to provide more specific fe=
edback on that=2E If they don't mind it you'll at least want to add some do=
cumentation in the commit message that it was changed=2E Something like:

While updating includes, ensure existing includes are alphabetical order=
=2E

Generally though, Ilpo will request those sorts of changes be in their own=
 patch=2E

Cheers,
Derek

> MODULE_AUTHOR("Jorge Lopez <jorge=2Elopez2@hp=2Ecom>");
> MODULE_DESCRIPTION("HP BIOS Configuration Driver");
>diff --git a/drivers/platform/x86/lenovo/think-lmi=2Ec b/drivers/platform=
/x86/lenovo/think-lmi=2Ec
>index e215e86e3db7=2E=2E4437785aa1f2 100644
>--- a/drivers/platform/x86/lenovo/think-lmi=2Ec
>+++ b/drivers/platform/x86/lenovo/think-lmi=2Ec
>@@ -13,14 +13,15 @@
>=20
> #include <linux/acpi=2Eh>
> #include <linux/array_size=2Eh>
>+#include <linux/dmi=2Eh>
> #include <linux/errno=2Eh>
>+#include <linux/firmware_attributes=2Eh>
> #include <linux/fs=2Eh>
> #include <linux/mutex=2Eh>
> #include <linux/string_helpers=2Eh>
> #include <linux/types=2Eh>
>-#include <linux/dmi=2Eh>
> #include <linux/wmi=2Eh>
>-#include "=2E=2E/firmware_attributes_class=2Eh"
>+
> #include "think-lmi=2Eh"
>=20
> static bool debug_support;
>diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platform=
/x86/lenovo/wmi-other=2Ec
>index fbb32bf404f2=2E=2Eb175971bb308 100644
>--- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>+++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>@@ -33,6 +33,7 @@
> #include <linux/container_of=2Eh>
> #include <linux/device=2Eh>
> #include <linux/export=2Eh>
>+#include <linux/firmware_attributes=2Eh>
> #include <linux/gfp_types=2Eh>
> #include <linux/hwmon=2Eh>
> #include <linux/idr=2Eh>
>@@ -50,7 +51,6 @@
> #include "wmi-capdata=2Eh"
> #include "wmi-events=2Eh"
> #include "wmi-helpers=2Eh"
>-#include "=2E=2E/firmware_attributes_class=2Eh"
>=20
> #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
>=20
>diff --git a/drivers/platform/x86/samsung-galaxybook=2Ec b/drivers/platfo=
rm/x86/samsung-galaxybook=2Ec
>index 6382af0b106c=2E=2E3911f60c23ea 100644
>--- a/drivers/platform/x86/samsung-galaxybook=2Ec
>+++ b/drivers/platform/x86/samsung-galaxybook=2Ec
>@@ -14,6 +14,7 @@
> #include <linux/acpi=2Eh>
> #include <linux/bits=2Eh>
> #include <linux/err=2Eh>
>+#include <linux/firmware_attributes=2Eh>
> #include <linux/i8042=2Eh>
> #include <linux/init=2Eh>
> #include <linux/input=2Eh>
>@@ -27,8 +28,8 @@
> #include <linux/sysfs=2Eh>
> #include <linux/uuid=2Eh>
> #include <linux/workqueue=2Eh>
>+
> #include <acpi/battery=2Eh>
>-#include "firmware_attributes_class=2Eh"
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

