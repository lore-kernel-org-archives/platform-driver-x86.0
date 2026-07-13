Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDDC3DBD77
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936422; cv=none; b=HDcfE9EbyKfQUhPUM+YUqpD8Y3Mwlhrvk+TpBJp4pBhv0yYGJfl31lCHobNtgC3d2UbnbpDdGynRcxmwTD4RIiNOUEaNGMnkEEgF7E33kD/TFO0TJBbaxV9oqQWHRIn1DkexifK9CCw2Oijp+nzG6FqlzXk+VDqBydu8D7bvhPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936422; c=relaxed/simple;
	bh=kngE0lL648nAyvUh0+iYcyckbgYing28fV2SNdT9oOc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=r1CEpHxPMCjSdTekeVIH57p5+NXYzSe3jnKy9VR+uSqx/JWcDW+1kiJ+l8IXWLaTem8sTNehid5eLflayHDqZt+eaznlDni51EmsORbbleIt3RPqCEoI0ULYsazGvwMw/nXYsEYw9tnDR7cnaGJmhg5LWAD6Xg/D6Q6T7+pVODs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRDh3Tbj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRDh3Tbj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84867f07d63so3192611b3a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 02:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783936420; x=1784541220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dGOSO8sGjHKjdBRL+JsTb/fGsqegAWj+oEAzRJ22a0A=;
        b=bRDh3TbjdmqLmkE34ZL+StoXHPpZ4P09SBDz13RgAgAIPKE4M2bnZixA/75sF1+lMG
         5ikFGilN1mUKBLGzrrZE/SqvLuTtCKZ+HadiH1TrwhSbASwEejplo0lZRKXzPeRfvzb5
         n0FrakUCMGom0TIetoCTxHJ95whqpBxFJOehLfNGLdFJ13LsqCkjMdaqtkZsLX+/h+5M
         cDOcVvYu5OzhEuST4v/k2GmLLJyv6+X0VbCIKiSNcE0Jz+1fyyK9maP9qBFWdMon0J7y
         vBkCjrR9W3lL3PX1ItRiyrmkuG2u23cON3KGnRSyz/yDYdqVdRPfAwDjQcCmcn5jfPqL
         WNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783936420; x=1784541220;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGOSO8sGjHKjdBRL+JsTb/fGsqegAWj+oEAzRJ22a0A=;
        b=frgsxno3onvOzP50WsaqH10+UyJk8taNSujqTk2fv3Ppu5mFqZp1T2gyNf4zp+Hu0e
         /+FN3uhVuQcSS2gkuq/P46IXKwFfb01r+cT5taPd9tTsan73ZG/8XtD586syFp2ItscD
         +f9ONjI5XGofVsKoRmObJa3SpLvEuynpJ3z3rwU4l+k4eDcQlBPRK4pWAyF884V5RPJi
         VyJt6USwUWokZAveSZOPWPlwxbOzHcJaJmmG3ZOPyWviseKkfHIWp6eTllIhX3WTduJF
         X31RExWhgb2tl5OQiXcxGr3KdgdEdPReOID4BxVSraLu5tnNU25juxCfq/5v9E4KdtaX
         Pt9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoDMxuxxDAVRuLanVV+hDgJfkQW+tyxffgO0q9xhcGzw5pMQTUBFajYJHUuJiNMN6oJn1CIEuRfY3pfjGXJuqe9Qn4O@vger.kernel.org
X-Gm-Message-State: AOJu0YzB8qaCVPJFquKLdKDsnjWQw6KEVrLmv1XrCWgqP9F2OQ1IqtyE
	iZpeYPXhOwlD+JxuMsCOq3BGavyAN1Z4k2WY5KiPBj7PYLGrzDMoT1x8
X-Gm-Gg: AfdE7cnXvapNsM5pdHDKixRPzY6qGBnLfw4Jo+iwSFKqeBXkP0QVKiGJeCY2EgPskhm
	IUhCQ7poTOTEhsYBG8oKoWyqkHd+24lLejbiW4YsfWcviLKRC7R98JJBVKiLvERll4vRx8EkFCC
	3DtJbcfN12glG8hhexyDazxIan+lvjjjq+2Jb0awV2rva6VifmS8ae3wzVQHba7GXFS1fxCSv8t
	QQyeXoR15Hbuv5aNqWBKdRnnVYe3oGbjq1xPRbuD2a+qbhk/RbXB9jkKYVsJUVo1NhwMFAw6TZA
	6jZXah/jylcyyOV9mxE97PcQUs85OqahXbbFIL+NQBbwTYESS5nIJeQUKhcw85Sf1Qa5hTRlLIY
	Zs/V3T6cAwErYNAiFzbyK8s2vdbucE+aC33vjKbFs9ZYJ5wA9g6SHHDGGfT2Tr0LWLGSlvYir3o
	tWR3v5/vFES80RiP/EAJgMrw0uTkje285OnkejRZ7qFJvkH933wpv/m/cd/X5E/dfDt/nOONZV
X-Received: by 2002:a05:6a00:f08:b0:848:4859:a45 with SMTP id d2e1a72fcca58-848895dc4b9mr7927348b3a.2.1783936419975;
        Mon, 13 Jul 2026 02:53:39 -0700 (PDT)
Received: from ehlo.thunderbird.net (221x252x203x146.ap221.ftth.ucom.ne.jp. [221.252.203.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84870d76ce7sm4796626b3a.55.2026.07.13.02.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:53:39 -0700 (PDT)
Date: Mon, 13 Jul 2026 18:53:36 +0900
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_0/3=5D_firmware=3A_Add_cor?=
 =?US-ASCII?Q?eboot_CFR_firmware_attributes_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260713081317.2954586-1-sean@starlabs.systems>
References: <20260713054526.2902319-1-sean@starlabs.systems> <20260713081317.2954586-1-sean@starlabs.systems>
Message-ID: <32F6BAAE-9BC8-42BA-9F1A-51AB3EADDBE7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 13, 2026 5:13:14 PM GMT+09:00, Sean Rhodes <sean@starlabs=2Esystems=
> wrote:
>Move the firmware attributes class helper out of platform/x86, rename
>the coreboot-table firmware driver directory from google to coreboot, and
>add a coreboot CFR firmware attributes driver=2E
>
>Changes in v6:
>- Move firmware_attributes=2Eh into the sorted Linux include block in eac=
h
>  converted platform/x86 driver=2E
>- Add Derek's Reviewed-by to patch 1=2E
>

Hi Sean,

Generally you will want to give a bit more time between revisions to allow=
 people to review=2E 1-2 days during the work week is usually the acceptabl=
e minimum time between versions=2E Sending too frequently can cause people =
to review older patches without noticing the same issue was already identif=
ied/fixed later and nobody wants to read the same patch 4 times in a row on=
 a Monday=2E

Cheers,
- Derek


>Sean Rhodes (3):
>  firmware: Move firmware attributes class helper
>  firmware: Rename google firmware directory to coreboot
>  firmware: coreboot: Add CFR firmware attributes driver
>
> MAINTAINERS                                   |   18 +-
> drivers/firmware/Kconfig                      |    5 +-
> drivers/firmware/Makefile                     |    3 +-
> drivers/firmware/{google =3D> coreboot}/Kconfig |   19 +-
> =2E=2E=2E/firmware/{google =3D> coreboot}/Makefile    |    1 +
> drivers/firmware/{google =3D> coreboot}/cbmem=2Ec |    0
> drivers/firmware/coreboot/coreboot-cfr=2Ec      | 1065 +++++++++++++++++
> =2E=2E=2E/{google =3D> coreboot}/coreboot_table=2Ec     |    0
> =2E=2E=2E/{google =3D> coreboot}/coreboot_table=2Eh     |    0
> =2E=2E=2E/framebuffer-coreboot=2Ec                    |    0
> drivers/firmware/{google =3D> coreboot}/gsmi=2Ec  |    0
> =2E=2E=2E/memconsole-coreboot=2Ec                     |    0
> =2E=2E=2E/memconsole-x86-legacy=2Ec                   |    0
> =2E=2E=2E/{google =3D> coreboot}/memconsole=2Ec         |    0
> =2E=2E=2E/{google =3D> coreboot}/memconsole=2Eh         |    6 +-
> drivers/firmware/{google =3D> coreboot}/vpd=2Ec   |    0
> =2E=2E=2E/{google =3D> coreboot}/vpd_decode=2Ec         |    0
> =2E=2E=2E/{google =3D> coreboot}/vpd_decode=2Eh         |    0
> =2E=2E=2E/firmware_attributes_class=2Ec               |    2 +-
> drivers/platform/x86/Kconfig                  |    3 -
> drivers/platform/x86/Makefile                 |    2 -
> drivers/platform/x86/asus-armoury=2Ec           |    2 +-
> =2E=2E=2E/x86/dell/dell-wmi-sysman/sysman=2Ec         |    9 +-
> drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec  |    9 +-
> drivers/platform/x86/lenovo/think-lmi=2Ec       |    5 +-
> drivers/platform/x86/lenovo/wmi-other=2Ec       |    2 +-
> drivers/platform/x86/samsung-galaxybook=2Ec     |    3 +-
> =2E=2E=2E/linux/firmware_attributes=2Eh               |    6 +-
> 28 files changed, 1128 insertions(+), 32 deletions(-)
> rename drivers/firmware/{google =3D> coreboot}/Kconfig (83%)
> rename drivers/firmware/{google =3D> coreboot}/Makefile (92%)
> rename drivers/firmware/{google =3D> coreboot}/cbmem=2Ec (100%)
> create mode 100644 drivers/firmware/coreboot/coreboot-cfr=2Ec
> rename drivers/firmware/{google =3D> coreboot}/coreboot_table=2Ec (100%)
> rename drivers/firmware/{google =3D> coreboot}/coreboot_table=2Eh (100%)
> rename drivers/firmware/{google =3D> coreboot}/framebuffer-coreboot=2Ec =
(100%)
> rename drivers/firmware/{google =3D> coreboot}/gsmi=2Ec (100%)
> rename drivers/firmware/{google =3D> coreboot}/memconsole-coreboot=2Ec (=
100%)
> rename drivers/firmware/{google =3D> coreboot}/memconsole-x86-legacy=2Ec=
 (100%)
> rename drivers/firmware/{google =3D> coreboot}/memconsole=2Ec (100%)
> rename drivers/firmware/{google =3D> coreboot}/memconsole=2Eh (82%)
> rename drivers/firmware/{google =3D> coreboot}/vpd=2Ec (100%)
> rename drivers/firmware/{google =3D> coreboot}/vpd_decode=2Ec (100%)
> rename drivers/firmware/{google =3D> coreboot}/vpd_decode=2Eh (100%)
> rename drivers/{platform/x86 =3D> firmware}/firmware_attributes_class=2E=
c (94%)
> rename drivers/platform/x86/firmware_attributes_class=2Eh =3D> include/l=
inux/firmware_attributes=2Eh (60%)
>
>Range-diff against v5:
>1:  4a82d0a07612 ! 1:  02edc6d05059 firmware: Move firmware attributes cl=
ass helper
>    @@ Commit message
>         under platform/x86=2E
>    =20
>         Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>    +    Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>         Signed-off-by: Sean Rhodes <sean@starlabs=2Esystems>
>    =20
>      ## MAINTAINERS ##
>    @@ drivers/platform/x86/Makefile: obj-$(CONFIG_X86_PLATFORM_DRIVERS_H=
P)	+=3D hp/
>      obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps=2Eo
>    =20
>      ## drivers/platform/x86/asus-armoury=2Ec ##
>    +@@
>    + #include <linux/dmi=2Eh>
>    + #include <linux/err=2Eh>
>    + #include <linux/errno=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    + #include <linux/fs=2Eh>
>    + #include <linux/kernel=2Eh>
>    + #include <linux/kmod=2Eh>
>     @@
>      #include <linux/sysfs=2Eh>
>     =20
>      #include "asus-armoury=2Eh"
>     -#include "firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>     =20
>      #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1=
C"
>     =20
>    =20
>      ## drivers/platform/x86/dell/dell-wmi-sysman/sysman=2Ec ##
>     @@
>    + #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>    +=20
>    + #include <linux/align=2Eh>
>    +-#include <linux/fs=2Eh>
>    + #include <linux/dmi=2Eh>
>    +-#include <linux/module=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    ++#include <linux/fs=2Eh>
>    + #include <linux/kernel=2Eh>
>    ++#include <linux/module=2Eh>
>    ++#include <linux/nls=2Eh>
>    + #include <linux/string=2Eh>
>      #include <linux/sysfs=2Eh>
>      #include <linux/wmi=2Eh>
>    ++
>      #include "dell-wmi-sysman=2Eh"
>     -#include "=2E=2E/=2E=2E/firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>     =20
>      #define MAX_TYPES  4
>    - #include <linux/nls=2Eh>
>    +-#include <linux/nls=2Eh>
>    +=20
>    + struct wmi_sysman_priv wmi_priv =3D {
>    + 	=2Emutex =3D __MUTEX_INITIALIZER(wmi_priv=2Emutex),
>    =20
>      ## drivers/platform/x86/hp/hp-bioscfg/bioscfg=2Ec ##
>     @@
>    +=20
>    + #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>    +=20
>    ++#include <linux/errno=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    + #include <linux/fs=2Eh>
>    +-#include <linux/module=2Eh>
>    + #include <linux/kernel=2Eh>
>    ++#include <linux/module=2Eh>
>    ++#include <linux/nls=2Eh>
>    + #include <linux/printk=2Eh>
>      #include <linux/string=2Eh>
>      #include <linux/wmi=2Eh>
>    ++
>      #include "bioscfg=2Eh"
>     -#include "=2E=2E/=2E=2E/firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>    - #include <linux/nls=2Eh>
>    - #include <linux/errno=2Eh>
>    +-#include <linux/nls=2Eh>
>    +-#include <linux/errno=2Eh>
>     =20
>    + MODULE_AUTHOR("Jorge Lopez <jorge=2Elopez2@hp=2Ecom>");
>    + MODULE_DESCRIPTION("HP BIOS Configuration Driver");
>    =20
>      ## drivers/platform/x86/lenovo/think-lmi=2Ec ##
>     @@
>    +=20
>    + #include <linux/acpi=2Eh>
>    + #include <linux/array_size=2Eh>
>    ++#include <linux/dmi=2Eh>
>    + #include <linux/errno=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    + #include <linux/fs=2Eh>
>    + #include <linux/mutex=2Eh>
>    + #include <linux/string_helpers=2Eh>
>      #include <linux/types=2Eh>
>    - #include <linux/dmi=2Eh>
>    +-#include <linux/dmi=2Eh>
>      #include <linux/wmi=2Eh>
>     -#include "=2E=2E/firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>    ++
>      #include "think-lmi=2Eh"
>     =20
>      static bool debug_support;
>    =20
>      ## drivers/platform/x86/lenovo/wmi-other=2Ec ##
>    +@@
>    + #include <linux/container_of=2Eh>
>    + #include <linux/device=2Eh>
>    + #include <linux/export=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    + #include <linux/gfp_types=2Eh>
>    + #include <linux/hwmon=2Eh>
>    + #include <linux/idr=2Eh>
>     @@
>      #include "wmi-capdata=2Eh"
>      #include "wmi-events=2Eh"
>      #include "wmi-helpers=2Eh"
>     -#include "=2E=2E/firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>     =20
>      #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3=
B"
>     =20
>    =20
>      ## drivers/platform/x86/samsung-galaxybook=2Ec ##
>     @@
>    + #include <linux/acpi=2Eh>
>    + #include <linux/bits=2Eh>
>    + #include <linux/err=2Eh>
>    ++#include <linux/firmware_attributes=2Eh>
>    + #include <linux/i8042=2Eh>
>    + #include <linux/init=2Eh>
>    + #include <linux/input=2Eh>
>    +@@
>    + #include <linux/sysfs=2Eh>
>      #include <linux/uuid=2Eh>
>      #include <linux/workqueue=2Eh>
>    ++
>      #include <acpi/battery=2Eh>
>     -#include "firmware_attributes_class=2Eh"
>    -+#include <linux/firmware_attributes=2Eh>
>     =20
>      #define DRIVER_NAME "samsung-galaxybook"
>     =20
>2:  285b33f805dc =3D 2:  d5d3d1334994 firmware: Rename google firmware di=
rectory to coreboot
>3:  ce91f4da5510 =3D 3:  7a65c6b0e631 firmware: coreboot: Add CFR firmwar=
e attributes driver

