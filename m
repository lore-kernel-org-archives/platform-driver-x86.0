Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF5624B24E;
	Fri, 10 Jan 2025 23:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736551459; cv=none; b=KfcEnaC0VQKZG9AXN0HvvkL6+LB29KfA227Ed8qKyuy+iZiBfyPEGYVB9VT4TMNX1hcWL9stQxWR+OzFdKXp4hEuuRUuf9YN+GcsjLUPO4VEPwCLT0kOud7ZZ0tIujQIITWgGOnY4N2rwiPj7M4n/+Wy0iX/6ZSGLtJ4cPceW6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736551459; c=relaxed/simple;
	bh=BfEiEc0mRiVZVEKvV7EmwhIn9iTScSwMYQwHC5Eeax0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRQ7ChN7vOrDFT7YWsMcVg9eO6/VvEn71Q5hHHHO/u3W1zJzwmKV1r1j118WZaBaNrOMv+xi4xHI1udD2SUL4NEwwyDtHapakk58BdfR+L3yFYSF9DzuFcav8Z8K/H90Mo2pODos7MT04D5eVs0lhfOKSg1h4hqxFKjZn9/ikRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BcQwtmWM; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BcQwtmWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736551436; x=1737156236; i=w_armin@gmx.de;
	bh=wCRNgED61Mlcr/6lN4lALlUtIPpcYZKVWP2jAp9FZ90=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BcQwtmWMdFMWkQMhtkv1dY2CQQvYrSmHj6RpBiCt5ztAwkfpVKG64nOqlIsMDThL
	 zU8HgvAx3VSbQJNPTBCp4GdVV4Uy7A+lwvehOyCBEDAn4FaapetAwvuVN90BhfM00
	 6Tby1cxfoNdjxUwlIu8v6InlwpKOjv78xFKVgBuKPiC2aQsj4DS3Qz0/AFiVM44x2
	 lDreA8RxIf4QdzDQQti4rPIVyaSzc9SV6F9fWmsSDKlUuZyOCU3TgFoPGaYZssZGY
	 qvg84R3eR/Vpr3KTM0p9jBssNTs78cuPb+Rjg7PLdKRd3l+l7ptXSxtfo+FF9l7K5
	 fJYzAXoq5e4drVo6gA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE27-1tqWrw3QOh-00LZay; Sat, 11
 Jan 2025 00:23:56 +0100
Message-ID: <5c248a52-84e9-4900-aabe-43251c53f542@gmx.de>
Date: Sat, 11 Jan 2025 00:23:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] platform/x86: Add Lenovo GameZone WMI Driver
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-3-derekjohn.clark@gmail.com>
 <32a788aa-ddf0-4ae1-a51f-0c15de2056c9@gmx.de>
 <CAFqHKT=hehh9xorpbYA=9JjBCyoP=LkiTccALCFb3kBv_6ybtQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKT=hehh9xorpbYA=9JjBCyoP=LkiTccALCFb3kBv_6ybtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Cpwj77s2ogNE7nsybWj3vsbYvBMLI9S7bRuKe/pRtkiJHQ2mRWt
 2CQ4Bf07rXZh7cCGn4EK+xdMbZJf+pa5v5PE0wk8RH5Ood0hKRCjE7sqOqn+wVv4TUQgbiG
 xcr3ly82x/hmYEjRDLwE1AVJRdkutq1FsV/ROgn7XsdUWOeIztZu35zWQa/978mvy+clHBG
 xK661qq5KzI3d8tCDYAig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/OPwCLmXys8=;deRHmQIb/TlvomQvQEezk21amSz
 EbLwq7GeRUD56naT/wEX8FCLVUfB/14ziPZEJpEPEgIaZf+qlcvYEUp+BwzQ1ROXlr9F9VqrS
 o3uQ1EPFSSwqbQzJ/9eyV5VNQVCTD5jbj6bKPrEzl/rIMqZiPXzu2ytMrcZOuYKri1NDljXDA
 nXBo83YKMTtlUCyZDMvjleJeCfjApkv9s/zx95afjiax7YIMQFKTrGgR6pUnXI2xIC4g8iPUS
 iYcs9JSSAuAl1jHUNNsZviNf+RV8imZ/vMNX+Ba5ff78QsKl+eugGoKJvYM/KeMyz+TrMXHNz
 VoZc/Z3glRBawYSxBl428yc46VQs71c45oU+ZPu0z6cJIig+8g3Be4EMaTGOQqkOAKoZ5UbLr
 Fj2MgfQFYbq5oly1Dq9pmbVWOI1mDJks4PYJx2pil/tK8D1Awin1dQ/Le+oKNuWoKHPUm099V
 2ap5FTCsJMcAKSEfwT8IAPG+YB/U6rJ0L0j5hV1NQNHvCq3ISQDUtoOao6LbV7ovhBm/l6ELk
 HikH78hPZxDuTTo0nizllpliB6TS3d0ekzcKaxcsofTWQLVxqJovglLdEknbAkf6v0VeQERCe
 yUiI7/LPfWytDRnWX5At4lV+tP7S4f2LzCUrlvoXkSH/rZYBf1gSsT5755nm6W6RSUDUFZhnT
 zfr9E4z4kY4KmDVQYgjDOH3GHZ38S+hskFe19FfaMV+f/FEgZZr+mowUCeme8b3jmMBZ1Ja6n
 ZsTOX8q1DI1rF5FWujMkx+7AEAJZXYRB+6W8aWE1OXOXJAF3kXtrk8er88In/jAMJPU/47tte
 IVAcnHuY2dCtO6koCzuJCxAWChaV2mmtuRZzYgo11OkKDL17hRk+4hWAukEp3FpJ6yqLsE4xV
 JffkU9q2GTMPDaDZ1UoHX15WEFnnr6AjXWFCr3joODbokASnlgiR06IaJGwjQBCDeGmZ4cX8v
 MTYPN0SbPSKO6A/nMN0IVdVCIY2u+vZD98U6xtdm1h/MIzmvZD0KOT4isFYRqVzHflgy6DB8e
 HVsjUPNIamgW+7puAJ3HiTHCZoaM50+ZoXVSQGPCncqdVcHX8bMKM88D2D0CfvCA7J2UGVqkS
 cfH8QdqQ1NfUBGkxHUuA7FUz2Dst/0

Am 10.01.25 um 22:33 schrieb Derek John Clark:

> On Thu, Jan 9, 2025 at 2:12=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
>> Am 02.01.25 um 01:47 schrieb Derek J. Clark:
>>
>>> Adds lenovo-wmi-gamezone.c which provides a driver for the Lenovo
>>> GameZone WMI interface that comes on Lenovo "Gaming Series" hardware.
>>> Provides ACPI platform profiles over WMI.
>>>
>>> v2:
>>> - Use devm_kzalloc to ensure driver can be instanced, remove global
>>>     reference.
>>> - Ensure reverse Christmas tree for all variable declarations.
>>> - Remove extra whitespace.
>>> - Use guard(mutex) in all mutex instances, global mutex.
>>> - Use pr_fmt instead of adding the driver name to each pr_err.
>>> - Remove noisy pr_info usage.
>>> - Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
>>> - Remove GZ_WMI symbol exporting.
>>>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>>    MAINTAINERS                                |   7 +
>>>    drivers/platform/x86/Kconfig               |  11 ++
>>>    drivers/platform/x86/Makefile              |   1 +
>>>    drivers/platform/x86/lenovo-wmi-gamezone.c | 203 ++++++++++++++++++=
+++
>>>    drivers/platform/x86/lenovo-wmi.h          | 105 +++++++++++
>>>    5 files changed, 327 insertions(+)
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index baf0eeb9a355..8f8a6aec6b92 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -13034,6 +13034,13 @@ S:   Maintained
>>>    W:  http://legousb.sourceforge.net/
>>>    F:  drivers/usb/misc/legousbtower.c
>>>
>>> +LENOVO WMI drivers
>>> +M:   Derek J. Clark <derekjohn.clark@gmail.com>
>>> +L:   platform-driver-x86@vger.kernel.org
>>> +S:   Maintained
>>> +F:   drivers/platform/x86/lenovo-wmi-gamezone.c
>>> +F:   drivers/platform/x86/lenovo-wmi.h
>>> +
>>>    LETSKETCH HID TABLET DRIVER
>>>    M:  Hans de Goede <hdegoede@redhat.com>
>>>    L:  linux-input@vger.kernel.org
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconf=
ig
>>> index 0258dd879d64..9a6ac7fdec9f 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -459,6 +459,17 @@ config IBM_RTL
>>>         state =3D 0 (BIOS SMIs on)
>>>         state =3D 1 (BIOS SMIs off)
>>>
>>> +config LENOVO_WMI_GAMEZONE
>>> +     tristate "Lenovo GameZone WMI Driver"
>>> +     depends on ACPI_WMI
>>> +     select ACPI_PLATFORM_PROFILE
>>> +     help
>>> +       Say Y here if you have a WMI aware Lenovo Legion device and wo=
uld like to use the
>>> +       platform-profile firmware interface.
>>> +
>>> +       To compile this driver as a module, choose M here: the module =
will
>>> +       be called lenovo_wmi_gamezone.
>> Could it be that the resulting kernel module is actually named lenovo-w=
mi-gamezone?.
>> If yes then please adjust the config description.
>>
> the .o/.ko are named as you described with -, but lsmod lists them
> with _ which is how most would interact with the driver if manually
> loading or blocking it. I'll put whichever you think is most
> appropriate.

I would prefer if you use the .ko names.

>>> +
>>>    config IDEAPAD_LAPTOP
>>>        tristate "Lenovo IdeaPad Laptop Extras"
>>>        depends on ACPI
>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Make=
file
>>> index e1b142947067..7cb29a480ed2 100644
>>> --- a/drivers/platform/x86/Makefile
>>> +++ b/drivers/platform/x86/Makefile
>>> @@ -68,6 +68,7 @@ obj-$(CONFIG_THINKPAD_LMI)  +=3D think-lmi.o
>>>    obj-$(CONFIG_YOGABOOK)              +=3D lenovo-yogabook.o
>>>    obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga-tab2-pro-1380-=
fastcharger.o
>>>    obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
>>> +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)    +=3D lenovo-wmi-gamezone.o
>>>
>>>    # Intel
>>>    obj-y                               +=3D intel/
>>> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/plat=
form/x86/lenovo-wmi-gamezone.c
>>> new file mode 100644
>>> index 000000000000..da5e2bc41f39
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
>>> @@ -0,0 +1,203 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Lenovo GameZone WMI interface driver. The GameZone WMI interface p=
rovides
>>> + * platform profile and fan curve settings for devices that fall unde=
r the
>>> + * "Gaming Series" of Lenovo Legion devices.
>>> + *
>>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>>> + */
>>> +
>>> +#include <linux/platform_profile.h>
>>> +#include "lenovo-wmi.h"
>> Please add the necessary includes here and do not rely on the header fi=
le to pull them in.
>>
> Ack
>
>>> +
>>> +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
>>> +
>>> +/* Method IDs */
>>> +#define WMI_METHOD_ID_SMARTFAN_SUPP 43 /* IsSupportSmartFan */
>>> +#define WMI_METHOD_ID_SMARTFAN_SET 44 /* SetSmartFanMode */
>>> +#define WMI_METHOD_ID_SMARTFAN_GET 45 /* GetSmartFanMode */
>>> +
>>> +static DEFINE_MUTEX(call_mutex);
>>> +
>>> +static const struct wmi_device_id lenovo_wmi_gamezone_id_table[] =3D =
{
>>> +     { LENOVO_GAMEZONE_GUID, NULL }, /* LENOVO_GAMEZONE_DATA */
>>> +     {}
>>> +};
>> Please move those device IDs closer to the driver struct which uses the=
m.
>>
> Ack
>
>>> +
>>> +struct lenovo_wmi_gz_priv {
>>> +     struct wmi_device *wdev;
>>> +     enum platform_profile_option current_profile;
>>> +     struct platform_profile_handler pprof;
>>> +     bool platform_profile_support;
>>> +};
>>> +
>>> +/* Platform Profile Methods */
>>> +static int lenovo_wmi_gamezone_platform_profile_supported(
>>> +     struct platform_profile_handler *pprof, int *supported)
>> Please use ./scripts/checkpatch --strict to catch any coding style viol=
ations like this one.
>>
> Ack. Sorry about that.
>
>>> +{
>>> +     struct lenovo_wmi_gz_priv *priv;
>>> +
>>> +     priv =3D container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
>> Is there a reason why you are not passing priv as an argument? If no th=
en please pass priv
>> as an argument so you can avoid having to use container_of().
>>
>>> +
>>> +     guard(mutex)(&call_mutex);
>> Is there a technical reason why you have to use a mutex for WMI method =
access? If no then please remove
>> this mutex.
>>
> We weren't sure and figured you would know best practice. I'll remove th=
em.
>
>>> +     return lenovo_wmidev_evaluate_method_1(
>>> +             priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SUPP, 0, support=
ed);
>>> +}
>>> +
>>> +static int
>>> +lenovo_wmi_gamezone_profile_get(struct platform_profile_handler *ppro=
f,
>>> +                             enum platform_profile_option *profile)
>>> +{
>>> +     struct lenovo_wmi_gz_priv *priv;
>>> +     int sel_prof;
>>> +     int err;
>>> +
>>> +     priv =3D container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
>>> +
>>> +     guard(mutex)(&call_mutex);
>>> +     err =3D lenovo_wmidev_evaluate_method_1(
>>> +             priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_GET, 0, &sel_pro=
f);
>>> +     if (err) {
>>> +             pr_err("Error getting fan profile from WMI interface: %d=
\n",
>>> +                    err);
>> Please just return here without printing anything, userspace does not b=
enefit from such
>> an error message which only states the obvious.
>>
> Ack all debug return messages.
>
>>> +             return err;
>>> +     }
>>> +
>>> +     switch (sel_prof) {
>>> +     case SMARTFAN_MODE_QUIET:
>>> +             *profile =3D PLATFORM_PROFILE_QUIET;
>>> +             break;
>>> +     case SMARTFAN_MODE_BALANCED:
>>> +             *profile =3D PLATFORM_PROFILE_BALANCED;
>>> +             break;
>>> +     case SMARTFAN_MODE_PERFORMANCE:
>>> +             *profile =3D PLATFORM_PROFILE_PERFORMANCE;
>>> +             break;
>>> +     case SMARTFAN_MODE_CUSTOM:
>>> +             *profile =3D PLATFORM_PROFILE_CUSTOM;
>>> +             break;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +     priv->current_profile =3D *profile;
>> Please remove this unused variable from priv.
>>
> Ack
>
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int
>>> +lenovo_wmi_gamezone_profile_set(struct platform_profile_handler *ppro=
f,
>>> +                             enum platform_profile_option profile)
>>> +{
>>> +     struct lenovo_wmi_gz_priv *priv;
>>> +     int sel_prof;
>>> +     int err;
>>> +
>>> +     switch (profile) {
>>> +     case PLATFORM_PROFILE_QUIET:
>>> +             sel_prof =3D SMARTFAN_MODE_QUIET;
>>> +             break;
>>> +     case PLATFORM_PROFILE_BALANCED:
>>> +             sel_prof =3D SMARTFAN_MODE_BALANCED;
>>> +             break;
>>> +     case PLATFORM_PROFILE_PERFORMANCE:
>>> +             sel_prof =3D SMARTFAN_MODE_PERFORMANCE;
>>> +             break;
>>> +     case PLATFORM_PROFILE_CUSTOM:
>>> +             sel_prof =3D SMARTFAN_MODE_CUSTOM;
>>> +             break;
>>> +     default:
>>> +             return -EOPNOTSUPP;
>>> +     }
>>> +
>>> +     priv =3D container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
>> Please assign priv during declaration.
>>
> Ack
>
>>> +
>>> +     guard(mutex)(&call_mutex);
>>> +     err =3D lenovo_wmidev_evaluate_method_1(
>>> +             priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SET, sel_prof, N=
ULL);
>>> +     if (err) {
>>> +             pr_err("Error setting fan profile on WMI interface: %u\n=
", err);
>> Again, this error message only states the obvious, please remove it.
>>
>>> +             return err;
>>> +     }
>>> +
>>> +     priv->current_profile =3D profile;
>>> +     return 0;
>>> +}
>>> +
>>> +/* Driver Setup */
>>> +static int platform_profile_setup(struct lenovo_wmi_gz_priv *priv)
>>> +{
>>> +     int supported;
>>> +     int err;
>>> +
>>> +     err =3D lenovo_wmi_gamezone_platform_profile_supported(&priv->pp=
rof,
>>> +                                                          &supported)=
;
>>> +     if (err) {
>>> +             pr_err("Error checking platform profile support: %d\n", =
err);
>>> +             return err;
>> Please use dev_err() here.
> Ack
>
>>> +     }
>>> +
>>> +     priv->platform_profile_support =3D supported;
>> The value of platform_profile_support is not used anywhere, please remo=
ve it.
>>
>>> +
>>> +     if (!supported)
>>> +             return -EOPNOTSUPP;
>> IMHO returning -ENODEV would make more sense here.
>>
> Ack
>
>>> +
>>> +     priv->pprof.name =3D "lenovo-wmi-gamezone";
>>> +     priv->pprof.profile_get =3D lenovo_wmi_gamezone_profile_get;
>>> +     priv->pprof.profile_set =3D lenovo_wmi_gamezone_profile_set;
>>> +
>>> +     set_bit(PLATFORM_PROFILE_QUIET, priv->pprof.choices);
>>> +     set_bit(PLATFORM_PROFILE_BALANCED, priv->pprof.choices);
>>> +     set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pprof.choices);
>>> +     set_bit(PLATFORM_PROFILE_CUSTOM, priv->pprof.choices);
>>> +
>>> +     err =3D lenovo_wmi_gamezone_profile_get(&priv->pprof,
>>> +                                           &priv->current_profile);
>>> +     if (err) {
>>> +             pr_err("Error getting current platform profile: %d\n", e=
rr);
>>> +             return err;
>>> +     }
>> Is there a technical reason for reading the current platform profile du=
ring device
>> initialization(? If no then please remove this call.
>>
> There isn't, just a misconception on my part. WIll remove.
>
>>> +
>>> +     guard(mutex)(&call_mutex);
>>> +     err =3D platform_profile_register(&priv->pprof);
>> Using devm_platform_profile_register() would make sense here. This func=
tion was added very recently
>> so you have to base your patch series onto the for-next branch.
>>
> Ack
>
>>> +     if (err) {
>>> +             pr_err("Error registering platform profile: %d\n", err);
>>> +             return err;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int lenovo_wmi_gamezone_probe(struct wmi_device *wdev,
>>> +                                  const void *context)
>>> +{
>>> +     struct lenovo_wmi_gz_priv *priv;
>>> +
>>> +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>> +     if (!priv)
>>> +             return -ENOMEM;
>>> +
>>> +     priv->wdev =3D wdev;
>> Since you are using dev_get_drvdata(), you also need to use dev_set_drv=
data() here, otherwise
>> dev_get_drvdata() will return no valid value.
>>
> Ack
>
>>> +     return platform_profile_setup(priv);
>>> +}
>>> +
>>> +static void lenovo_wmi_gamezone_remove(struct wmi_device *wdev)
>>> +{
>>> +     struct lenovo_wmi_gz_priv *priv =3D dev_get_drvdata(&wdev->dev);
>>> +
>>> +     guard(mutex)(&call_mutex);
>>> +     platform_profile_remove(&priv->pprof);
>>> +}
>>> +
>>> +static struct wmi_driver lenovo_wmi_gamezone_driver =3D {
>>> +     .driver =3D { .name =3D "lenovo_wmi_gamezone" },
>> Please set ".probe_type =3D PROBE_PREFER_ASYNCHRONOUS" here.
>>
> Ack
>
>> Also does the selected fan profile remain the same after suspending or =
hibernating?
>> If no then please add the necessary PM callbacks to save/restore the fa=
n profile
>> before suspend/after resume if necessary.
>>
> It remains the same after suspend, hibernate, reboot, and shutdown.

Nice, so no special pm handling is necessary here :).

Thanks,
Armin Wolf

>
>>> +     .id_table =3D lenovo_wmi_gamezone_id_table,
>>> +     .probe =3D lenovo_wmi_gamezone_probe,
>>> +     .remove =3D lenovo_wmi_gamezone_remove,
>> Please set ".no_singleton =3D true" here.
>>
> Ack
>
>>> +};
>>> +
>>> +module_wmi_driver(lenovo_wmi_gamezone_driver);
>>> +
>>> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_gamezone_id_table);
>>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>> +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/=
lenovo-wmi.h
>>> new file mode 100644
>>> index 000000000000..8a302c6c47cb
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi.h
>>> @@ -0,0 +1,105 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later
>>> + *
>>> + * Lenovo Legion WMI interface driver. The Lenovo Legion WMI interfac=
e is
>>> + * broken up into multiple GUID interfaces that require cross-referen=
ces
>>> + * between GUID's for some functionality. The "Custom Mode" interface=
 is a
>>> + * legacy interface for managing and displaying CPU & GPU power and h=
wmon
>>> + * settings and readings. The "Other Mode" interface is a modern inte=
rface
>>> + * that replaces or extends the "Custom Mode" interface methods. The
>>> + * "GameZone" interface adds advanced features such as fan profiles a=
nd
>>> + * overclocking. The "Lighting" interface adds control of various sta=
tus
>>> + * lights related to different hardware components. "Other Method" us=
es
>>> + * the data structs LENOVO_CAPABILITY_DATA_00, LENOVO_CAPABILITY_DATA=
_01
>>> + * and LENOVO_CAPABILITY_DATA_02 structs for capability information.
>>> + *
>>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>>> + *
>>> + */
>>> +
>>> +#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
>>> +
>>> +#ifndef _LENOVO_WMI_H_
>>> +#define _LENOVO_WMI_H_
>>> +
>>> +#include <linux/mutex.h>
>>> +#include <linux/types.h>
>>> +#include <linux/wmi.h>
>>> +
>>> +/* Platform Profile Modes */
>>> +#define SMARTFAN_MODE_QUIET 0x01
>>> +#define SMARTFAN_MODE_BALANCED 0x02
>>> +#define SMARTFAN_MODE_PERFORMANCE 0x03
>>> +#define SMARTFAN_MODE_CUSTOM 0xFF
>>> +
>>> +struct wmi_method_args {
>>> +     u32 arg0;
>>> +     u32 arg1;
>>> +};
>>> +
>>> +/* General Use functions */
>>> +static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u8 =
instance,
>>> +                                      u32 method_id, struct acpi_buff=
er *in,
>>> +                                      struct acpi_buffer *out)
>>> +{
>>> +     acpi_status status;
>>> +
>>> +     status =3D wmidev_evaluate_method(wdev, instance, method_id, in,=
 out);
>>> +
>>> +     if (ACPI_FAILURE(status))
>>> +             return -EIO;
>>> +
>>> +     return 0;
>>> +};
>>> +
>>> +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 insta=
nce,
>>> +                                 u32 method_id, u32 arg0, u32 arg1,
>>> +                                 u32 *retval);
>>> +
>>> +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 insta=
nce,
>>> +                                 u32 method_id, u32 arg0, u32 arg1,
>>> +                                 u32 *retval)
>>> +{
>>> +     struct wmi_method_args args =3D { arg0, arg1 };
>>> +     struct acpi_buffer input =3D { (acpi_size)sizeof(args), &args };
>>> +     struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>>> +     union acpi_object *ret_obj =3D NULL;
>>> +     int err;
>> Please order the variable declarations in reverse XMAS tree order.
>>
> Ack
>
>>> +
>>> +     err =3D lenovo_wmidev_evaluate_method(wdev, instance, method_id,=
 &input,
>>> +                                         &output);
>>> +
>>> +     if (err) {
>>> +             pr_err("Attempt to get method value failed.\n");
>> Please remove any error messages in this part of the code, printing err=
or messages should
>> ideally happen at the higher layers of the driver if necessary.
>>
>>> +             return err;
>>> +     }
>>> +
>>> +     if (retval) {
>>> +             ret_obj =3D (union acpi_object *)output.pointer;
>>> +             if (!ret_obj) {
>>> +                     pr_err("Failed to get valid ACPI object from WMI=
 interface\n");
>>> +                     return -EIO;
>> -ENODATA.
>>
> Ack
>
>>> +             }
>>> +             if (ret_obj->type !=3D ACPI_TYPE_INTEGER) {
>>> +                     pr_err("WMI query returnd ACPI object with wrong=
 type.\n");
>>> +                     kfree(ret_obj);
>>> +                     return -EIO;
>> -ENXIO.
>>
> Ack
>
>>> +             }
>>> +             *retval =3D (u32)ret_obj->integer.value;
>>> +     }
>>> +
>>> +     kfree(ret_obj);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 insta=
nce,
>>> +                                 u32 method_id, u32 arg0, u32 *retval=
);
>>> +
>>> +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 insta=
nce,
>>> +                                 u32 method_id, u32 arg0, u32 *retval=
)
>>> +{
>>> +     return lenovo_wmidev_evaluate_method_2(wdev, instance, method_id=
, arg0,
>>> +                                            0, retval);
>>> +}
>>> +
>>> +#endif /* !_LENOVO_WMI_H_ */
> Thanks Armin,
> Derek
