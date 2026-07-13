Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B845814F70
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783926785; cv=none; b=EFOFhUSfbsMlud5rocaO/OkpmBgQ2JnVp4GHp6yDcncCq2BqjHZJbeIOFvGCYWYZPuEy2j9ypou5Pz3CF5pnwzZLL6Awjkypbc5NmObcDj8vERwrLGtEpJTNazHHEZtaIQQD4AWRnDEyeegNLO2V+aPVNKLRUWlYhcvCVhjFyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783926785; c=relaxed/simple;
	bh=LUVeQgY4o0fHQ8xIX//qTWXkFdlOyUCh2BjZdKIA+wY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=HOxqDbtZEKVNE2mL27uTDpJGAcxx7cSRUJ1CyQbg+Z1OO21Ol8EkjFynIOhAgpKDhlm5B6e8WNhpHxVmChGO+fMIh5RGxKLPYmkMrtEota5IxQeie5TpUyNPfKoDOSjw/hxmGY6+4Ew6B7STjcAtTai5FHzXvxszMaoUktfYOgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGMLdDxg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGMLdDxg"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38175907a56so2937785a91.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783926783; x=1784531583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VIUlyELxeJZwAwkpOsl3GB2D82CzRM+HS3x5FJxMKtI=;
        b=nGMLdDxgzE8IqnxqzixlgAJicYz4zpjjkqbGaf2rq4hM5f9qyjvklZG1vmiZveAzOG
         Bm6HebLnWM4H0EPOri6votmWM0M9s5n7/yeN9hT6Rrid4AsChRMWxnt2Z/D3dArBODKf
         cbAzp2aKUHp4b+yH+wUYYoIsqIb0PT9jM47D9OM3i+eU0dRs62LI8l9rFlSnlUsyKE+g
         /pDCN+GwGWrFd3Ji5IT1pgs3GWJ6rX6eSqvxkV3CnH83H9ELTP1MEJQvV6xVAD489b9H
         FWHPXVTktd90O9lynsaWE/MNhyUMuLWhUQ7nD3/zbsewU1ffx97GjRWdEqkSKxULYPdi
         f2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926783; x=1784531583;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIUlyELxeJZwAwkpOsl3GB2D82CzRM+HS3x5FJxMKtI=;
        b=OlOYHAJ8AezgiP2LIyjQ6q9C6zfz3rqRnLe4gh70aXJ8MHhyTt500qbg1ZxFEqOx4/
         EzJL9TN/FmjzskZX61qF8pbogqbdnKygJ2zYp0GZiZEhU34m1iuU91rv2txif+GS/j5Z
         WAs748DGpMSkoa3lwuFPL8+4Ut3cPhx5JJ0x6unzS0iVOlE6vfcbYpKW5upMZt/zb5n5
         cv0nwAxEufd/ahXun9BpYRDSHhBo24y6R5RBrgpFoqdj3/fa46ny2WdWT9ajd8ZRq85r
         sURLSqMfcsxp1fS+HJT7kd3rrPiMd2YEeDXwMXVx02WLODgMRiLzV/9j3cASOWwSaox7
         1H8Q==
X-Forwarded-Encrypted: i=1; AHgh+RoVSEfji3mtgXqZk/hire3ktaPS2vKgKG/5PkIJVlBq65zbonnkrl6EtQui4aL8ofRaft1l7FGhmhf+DgZLNGNjR9+N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz06c/DQELtrDgierwGnOx9yzHK7DTGISOlHoMVvt1C5gpI5NEU
	RCTxvHIFoBZ8JimsSfgnRbdWWuZmYUPZWc2MFnHK0YhZKffg/gi2ERhD
X-Gm-Gg: AfdE7cnGMqUdy6kU677tGHPINBkjm+cbxOXEC02GKCiQsS5j/CVtrA+Y/6F0B1oMY2k
	4yoUoCfoWYo+jKrnu+W2AV5cWWQ+/ZCrxDyMoWb7e7+/pSbW4dHf09HZk46NvLgMty6nTc/R+7u
	K6Gfp0Ftcx9TpVKWwfvLDtWwccITzBPSUoWOIN4IegvaI9uwwsv9Dj3hHs5WgO2Xhps7sVPGMtx
	SDWMGjt/glueMXaPFEtIa0kg+ndxTeZcZ8t5BnRi1KvhGIFogs6sM9/+rDxnvi77ncxUoJoN+ks
	9Hvun9ztv1qT9g/W/wDonhTkk6fPFtc0PbabjHXcS/4gPzbRWoMmn9vc/sqjxT0CO7ex053LOlc
	xe5dKQJtHCKWEwZ30emRXjbtiacAuXIaEbnfowl8U8rvXy0ZLFDiDd3u8PFSLpXuKVx1lR0UgVI
	s5GsMra3w9JU9zDo0bE4Vnp7pLV4PGO18wNffDBhMz2QL4BulqrbwDS+N/kh9khoA81ghOOgp/
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id 98e67ed59e1d1-38dc81c1b09mr5704556a91.9.1783926782987;
        Mon, 13 Jul 2026 00:13:02 -0700 (PDT)
Received: from ehlo.thunderbird.net (221x252x203x146.ap221.ftth.ucom.ne.jp. [221.252.203.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38dc9fc78ffsm2825228a91.9.2026.07.13.00.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:13:02 -0700 (PDT)
Date: Mon, 13 Jul 2026 16:13:00 +0900
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
Subject: Re: [PATCH v5 1/3] firmware: Move firmware attributes class helper
User-Agent: Thunderbird for Android
In-Reply-To: <20260713054526.2902319-2-sean@starlabs.systems>
References: <CABtds-0uN8WW2SkDzwYf8cbQGZnx=Y8Nocs-ebMYB0KWOiX_Kw@mail.gmail.com> <20260713054526.2902319-1-sean@starlabs.systems> <20260713054526.2902319-2-sean@starlabs.systems>
Message-ID: <08F19E6F-35B6-470A-A156-D6CB96326DD5@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 13, 2026 2:45:24 PM GMT+09:00, Sean Rhodes <sean@starlabs=2Esystems=
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

Hi Sean,

With this moving from a relative file path include to a full Linux header =
include, it should be moved up to be with the other header includes above (=
in alphabetical order)=2E

Applies to all drivers below as well=2E

With those changes,

Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>

Thanks,
Derek


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

