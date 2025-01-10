Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FD518C03A;
	Fri, 10 Jan 2025 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736544822; cv=none; b=Gzbd3f9JGD9VMsMogAGirL5WIzq6GZ+CR/FhLRx9LWDxQQBAEyClLHAFCu+7q8u7sVvltNQ9HkhYqX+mful+/WAzm1UJuArh8rsMNiSwMIjWtbUGsP2H/4+/Q7qwEEDqpKD1r5B5z1cRszYV3F7OmzaZrXXv2Iuqc7QyJLYJ1Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736544822; c=relaxed/simple;
	bh=inXeULZ1w0Msnw4IlUDySd0AZDO8cxvBoJ3eJZlp6/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rP7myMHzzRi/qiDhIdCQhTkFtZO2w2pBJqJ2z39g8S5OaXOs6XuCjp7+q125AioMN8Ek+NbdRB0f/WP9NTta7Ii5w1FaHwQ53uQcgeDOCx69LgnyJOGYFvVWji1/7JwLoselw+pGOYM1MMiPPQsPSprj2fH5Hgfa6emd10EkAYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFpcL51T; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFpcL51T"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dd0d09215aso18663926d6.2;
        Fri, 10 Jan 2025 13:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736544819; x=1737149619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvFlA9+8hxa+cMTRMwjtfADxuuRRIWT3G8YdGP29eN8=;
        b=bFpcL51TyEqtcJoNEaep9EuAFVKnEOD9EsGDzKIsUDDVd6PvvhsI/kqb5dLhSiMxnp
         wvYn6S30KK2k/TCJRhvuaAs3zqmy31D6Xb3G7uia8S2rReuhDmSnqz3N+mhvhprR5NA4
         NQI+uHtnFWGT8Xu3sFjI7kdnotOd1yVFiG3FQQQe38lJBg2E6e0sk7YcykhsxEakgfzo
         3PgXo5aobmR1EBsO6g0to2eenbKE71Rn+nIxnfwhNKZlp6CTBTtBT3VbWwQiceTL2SqR
         jXg+Vk9VcJ9dvbqOa4kO9uNSb9WSfRc5FQ12Ejnb927ZUHJY9MPHHZ3cIQNLwoT8H38N
         cduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736544819; x=1737149619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvFlA9+8hxa+cMTRMwjtfADxuuRRIWT3G8YdGP29eN8=;
        b=O4yNfNlCsunpQKOpIBE2J6XfPFlYu9tI/AJpReQh0WVFbzjvbXO+j7D/vd8iZ3uuvb
         KlcZzF6Qp5NuJZffvl04KGhPFq0mHjsYiBxtdz7szQ538VR+CKtS2dTFcwafCmfMzi9l
         2J6XGEIz7N+nrKaBWdaMrXZ3fY2YDTpuRFw91tBW1BZT/EkI9WVr1e3AXQY2H05x+Wec
         IGSu3rrYL4Ml1ipjtbQoVZpL5OsDkU5r8Qa1bqhJu+gOE8sBYJI69gokgTz3REm+wshb
         J+4wfvCoyal7ml3qXAR8SUu0cRKJgdH02YweDclXJtSqk6MkRn/zk3i3UqVjGzQ4XTcU
         oqlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrZ/m+QC36bim4bOc9YJyBA3e+iJACDJf1wb69MbIPNP/Z1m73Y97+OeA7y+f5S7GJGYHuMdWNtLM=@vger.kernel.org, AJvYcCVxIIrv/WZkA7fHz4OGuERRilyHgeExFpwpXWqsVNSbl4wVmo0+n95ADw29qOmJ4oS/StMzt6XI6UOxrFV7@vger.kernel.org, AJvYcCXavYvLVx6KIw1IEehp3hLtOzmSO3jJJtkvA8cFZNUgdn+0zrV138NIg/s8+YVwOL47xL7kHpiOERe+9n2FVSHh3hT8Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo1s4k7E2X5AaRBF3zZs0fXTOuDjO4XHwxRVKtpaZ2U0r27U+m
	SgN88wPrEA1s3Rom8/OtCGHkBCmrq7ReAiHoCPKBu/nuvgMF227rlQkY1HQPdsxoZDntpXvWOuY
	PPX+j17rhhNAx0mn5UCuaIkJ8qZU=
X-Gm-Gg: ASbGnct4CUh5lWL/fKNytUxQLP/jjnxnLh0C99uKhWEe+lSYOOB1t7WptxZTA1Dtrhu
	8lDqeiaH5MZXwoXhYV0GULzGnohXAv6S0G7r1oPo=
X-Google-Smtp-Source: AGHT+IHSDeGYXK6AEu3jugyL9gYqIGvWqoTI28QxOxH3obzlLLBeNcBUv2m7NRpDVYcrjwJup6mdCUShhKWWMYgvnbY=
X-Received: by 2002:a05:6214:449f:b0:6d8:9677:fbe4 with SMTP id
 6a1803df08f44-6df9b1f6f51mr226866826d6.9.1736544819086; Fri, 10 Jan 2025
 13:33:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-3-derekjohn.clark@gmail.com> <32a788aa-ddf0-4ae1-a51f-0c15de2056c9@gmx.de>
In-Reply-To: <32a788aa-ddf0-4ae1-a51f-0c15de2056c9@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 10 Jan 2025 13:33:28 -0800
X-Gm-Features: AbW1kvaA9Ovj9ySXeOjU2fQve4NPYv7PnaqRVldl6XSpNxYLTPwnYfA1r97f5uY
Message-ID: <CAFqHKT=hehh9xorpbYA=9JjBCyoP=LkiTccALCFb3kBv_6ybtQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] platform/x86: Add Lenovo GameZone WMI Driver
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>, 
	Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 2:12=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 02.01.25 um 01:47 schrieb Derek J. Clark:
>
> > Adds lenovo-wmi-gamezone.c which provides a driver for the Lenovo
> > GameZone WMI interface that comes on Lenovo "Gaming Series" hardware.
> > Provides ACPI platform profiles over WMI.
> >
> > v2:
> > - Use devm_kzalloc to ensure driver can be instanced, remove global
> >    reference.
> > - Ensure reverse Christmas tree for all variable declarations.
> > - Remove extra whitespace.
> > - Use guard(mutex) in all mutex instances, global mutex.
> > - Use pr_fmt instead of adding the driver name to each pr_err.
> > - Remove noisy pr_info usage.
> > - Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
> > - Remove GZ_WMI symbol exporting.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> >   MAINTAINERS                                |   7 +
> >   drivers/platform/x86/Kconfig               |  11 ++
> >   drivers/platform/x86/Makefile              |   1 +
> >   drivers/platform/x86/lenovo-wmi-gamezone.c | 203 ++++++++++++++++++++=
+
> >   drivers/platform/x86/lenovo-wmi.h          | 105 +++++++++++
> >   5 files changed, 327 insertions(+)
> >   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
> >   create mode 100644 drivers/platform/x86/lenovo-wmi.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index baf0eeb9a355..8f8a6aec6b92 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13034,6 +13034,13 @@ S:   Maintained
> >   W:  http://legousb.sourceforge.net/
> >   F:  drivers/usb/misc/legousbtower.c
> >
> > +LENOVO WMI drivers
> > +M:   Derek J. Clark <derekjohn.clark@gmail.com>
> > +L:   platform-driver-x86@vger.kernel.org
> > +S:   Maintained
> > +F:   drivers/platform/x86/lenovo-wmi-gamezone.c
> > +F:   drivers/platform/x86/lenovo-wmi.h
> > +
> >   LETSKETCH HID TABLET DRIVER
> >   M:  Hans de Goede <hdegoede@redhat.com>
> >   L:  linux-input@vger.kernel.org
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
> > index 0258dd879d64..9a6ac7fdec9f 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -459,6 +459,17 @@ config IBM_RTL
> >        state =3D 0 (BIOS SMIs on)
> >        state =3D 1 (BIOS SMIs off)
> >
> > +config LENOVO_WMI_GAMEZONE
> > +     tristate "Lenovo GameZone WMI Driver"
> > +     depends on ACPI_WMI
> > +     select ACPI_PLATFORM_PROFILE
> > +     help
> > +       Say Y here if you have a WMI aware Lenovo Legion device and wou=
ld like to use the
> > +       platform-profile firmware interface.
> > +
> > +       To compile this driver as a module, choose M here: the module w=
ill
> > +       be called lenovo_wmi_gamezone.
>
> Could it be that the resulting kernel module is actually named lenovo-wmi=
-gamezone?.
> If yes then please adjust the config description.
>

the .o/.ko are named as you described with -, but lsmod lists them
with _ which is how most would interact with the driver if manually
loading or blocking it. I'll put whichever you think is most
appropriate.

> > +
> >   config IDEAPAD_LAPTOP
> >       tristate "Lenovo IdeaPad Laptop Extras"
> >       depends on ACPI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
> > index e1b142947067..7cb29a480ed2 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -68,6 +68,7 @@ obj-$(CONFIG_THINKPAD_LMI)  +=3D think-lmi.o
> >   obj-$(CONFIG_YOGABOOK)              +=3D lenovo-yogabook.o
> >   obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga-tab2-pro-1380-fa=
stcharger.o
> >   obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
> > +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)    +=3D lenovo-wmi-gamezone.o
> >
> >   # Intel
> >   obj-y                               +=3D intel/
> > diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platf=
orm/x86/lenovo-wmi-gamezone.c
> > new file mode 100644
> > index 000000000000..da5e2bc41f39
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> > @@ -0,0 +1,203 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Lenovo GameZone WMI interface driver. The GameZone WMI interface pr=
ovides
> > + * platform profile and fan curve settings for devices that fall under=
 the
> > + * "Gaming Series" of Lenovo Legion devices.
> > + *
> > + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> > + */
> > +
> > +#include <linux/platform_profile.h>
> > +#include "lenovo-wmi.h"
>
> Please add the necessary includes here and do not rely on the header file=
 to pull them in.
>

Ack

> > +
> > +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> > +
> > +/* Method IDs */
> > +#define WMI_METHOD_ID_SMARTFAN_SUPP 43 /* IsSupportSmartFan */
> > +#define WMI_METHOD_ID_SMARTFAN_SET 44 /* SetSmartFanMode */
> > +#define WMI_METHOD_ID_SMARTFAN_GET 45 /* GetSmartFanMode */
> > +
> > +static DEFINE_MUTEX(call_mutex);
> > +
> > +static const struct wmi_device_id lenovo_wmi_gamezone_id_table[] =3D {
> > +     { LENOVO_GAMEZONE_GUID, NULL }, /* LENOVO_GAMEZONE_DATA */
> > +     {}
> > +};
>
> Please move those device IDs closer to the driver struct which uses them.
>

Ack

> > +
> > +struct lenovo_wmi_gz_priv {
> > +     struct wmi_device *wdev;
> > +     enum platform_profile_option current_profile;
> > +     struct platform_profile_handler pprof;
> > +     bool platform_profile_support;
> > +};
> > +
> > +/* Platform Profile Methods */
> > +static int lenovo_wmi_gamezone_platform_profile_supported(
> > +     struct platform_profile_handler *pprof, int *supported)
>
> Please use ./scripts/checkpatch --strict to catch any coding style violat=
ions like this one.
>

Ack. Sorry about that.

> > +{
> > +     struct lenovo_wmi_gz_priv *priv;
> > +
> > +     priv =3D container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
>
> Is there a reason why you are not passing priv as an argument? If no then=
 please pass priv
> as an argument so you can avoid having to use container_of().
>
> > +
> > +     guard(mutex)(&call_mutex);
>
> Is there a technical reason why you have to use a mutex for WMI method ac=
cess? If no then please remove
> this mutex.
>

We weren't sure and figured you would know best practice. I'll remove them.

> > +     return lenovo_wmidev_evaluate_method_1(
> > +             priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SUPP, 0, supporte=
d);
> > +}
> > +
> > +static int
> > +lenovo_wmi_gamezone_profile_get(struct platform_profile_handler *pprof=
,
> > +                             enum platform_profile_option *profile)
> > +{
> > +     struct lenovo_wmi_gz_priv *priv;
> > +     int sel_prof;
> > +     int err;
> > +
> > +     priv =3D container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
> > +
> > +     guard(mutex)(&call_mutex);
> > +     err =3D lenovo_wmidev_evaluate_method_1(
> > +             priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_GET, 0, &sel_prof=
);
> > +     if (err) {
> > +             pr_err("Error getting fan profile from WMI interface: %d\=
n",
> > +                    err);
>
> Please just return here without printing anything, userspace does not ben=
efit from such
> an error message which only states the obvious.
>

Ack all debug return messages.

> > +             return err;
> > +     }
> > +
> > +     switch (sel_prof) {
> > +     case SMARTFAN_MODE_QUIET:
> > +             *profile =3D PLATFORM_PROFILE_QUIET;
> > +             break;
> > +     case SMARTFAN_MODE_BALANCED:
> > +             *profile =3D PLATFORM_PROFILE_BALANCED;
> > +             break;
> > +     case SMARTFAN_MODE_PERFORMANCE:
> > +             *profile =3D PLATFORM_PROFILE_PERFORMANCE;
> > +             break;
> > +     case SMARTFAN_MODE_CUSTOM:
> > +             *profile =3D PLATFORM_PROFILE_CUSTOM;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +     priv->current_profile =3D *profile;
>
> Please remove this unused variable from priv.
>

Ack

> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +lenovo_wmi_gamezone_profile_set(struct platform_profile_handler *pprof=
,
> > +                             enum platform_profile_option profile)
> > +{
> > +     struct lenovo_wmi_gz_priv *priv;
> > +     int sel_prof;
> > +     int err;
> > +
> > +     switch (profile) {
> > +     case PLATFORM_PROFILE_QUIET:
> > +             sel_prof =3D SMARTFAN_MODE_QUIET;
> > +             break;
> > +     case PLATFORM_PROFILE_BALANCED:
> > +             sel_prof =3D SMARTFAN_MODE_BALANCED;
> > +             break;
> > +     case PLATFORM_PROFILE_PERFORMANCE:
> > +             sel_prof =3D SMARTFAN_MODE_PERFORMANCE;
> > +             break;
> > +     case PLATFORM_PROFILE_CUSTOM:
> > +             sel_prof =3D SMARTFAN_MODE_CUSTOM;
> > +             break;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     priv =3D container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
>
> Please assign priv during declaration.
>

Ack

> > +
> > +     guard(mutex)(&call_mutex);
> > +     err =3D lenovo_wmidev_evaluate_method_1(
> > +             priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SET, sel_prof, NU=
LL);
> > +     if (err) {
> > +             pr_err("Error setting fan profile on WMI interface: %u\n"=
, err);
>
> Again, this error message only states the obvious, please remove it.
>
> > +             return err;
> > +     }
> > +
> > +     priv->current_profile =3D profile;
> > +     return 0;
> > +}
> > +
> > +/* Driver Setup */
> > +static int platform_profile_setup(struct lenovo_wmi_gz_priv *priv)
> > +{
> > +     int supported;
> > +     int err;
> > +
> > +     err =3D lenovo_wmi_gamezone_platform_profile_supported(&priv->ppr=
of,
> > +                                                          &supported);
> > +     if (err) {
> > +             pr_err("Error checking platform profile support: %d\n", e=
rr);
> > +             return err;
>
> Please use dev_err() here.

Ack

> > +     }
> > +
> > +     priv->platform_profile_support =3D supported;
>
> The value of platform_profile_support is not used anywhere, please remove=
 it.
>
> > +
> > +     if (!supported)
> > +             return -EOPNOTSUPP;
>
> IMHO returning -ENODEV would make more sense here.
>

Ack

> > +
> > +     priv->pprof.name =3D "lenovo-wmi-gamezone";
> > +     priv->pprof.profile_get =3D lenovo_wmi_gamezone_profile_get;
> > +     priv->pprof.profile_set =3D lenovo_wmi_gamezone_profile_set;
> > +
> > +     set_bit(PLATFORM_PROFILE_QUIET, priv->pprof.choices);
> > +     set_bit(PLATFORM_PROFILE_BALANCED, priv->pprof.choices);
> > +     set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pprof.choices);
> > +     set_bit(PLATFORM_PROFILE_CUSTOM, priv->pprof.choices);
> > +
> > +     err =3D lenovo_wmi_gamezone_profile_get(&priv->pprof,
> > +                                           &priv->current_profile);
> > +     if (err) {
> > +             pr_err("Error getting current platform profile: %d\n", er=
r);
> > +             return err;
> > +     }
>
> Is there a technical reason for reading the current platform profile duri=
ng device
> initialization(? If no then please remove this call.
>

There isn't, just a misconception on my part. WIll remove.

> > +
> > +     guard(mutex)(&call_mutex);
> > +     err =3D platform_profile_register(&priv->pprof);
>
> Using devm_platform_profile_register() would make sense here. This functi=
on was added very recently
> so you have to base your patch series onto the for-next branch.
>

Ack

> > +     if (err) {
> > +             pr_err("Error registering platform profile: %d\n", err);
> > +             return err;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int lenovo_wmi_gamezone_probe(struct wmi_device *wdev,
> > +                                  const void *context)
> > +{
> > +     struct lenovo_wmi_gz_priv *priv;
> > +
> > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->wdev =3D wdev;
>
> Since you are using dev_get_drvdata(), you also need to use dev_set_drvda=
ta() here, otherwise
> dev_get_drvdata() will return no valid value.
>

Ack

> > +     return platform_profile_setup(priv);
> > +}
> > +
> > +static void lenovo_wmi_gamezone_remove(struct wmi_device *wdev)
> > +{
> > +     struct lenovo_wmi_gz_priv *priv =3D dev_get_drvdata(&wdev->dev);
> > +
> > +     guard(mutex)(&call_mutex);
> > +     platform_profile_remove(&priv->pprof);
> > +}
> > +
> > +static struct wmi_driver lenovo_wmi_gamezone_driver =3D {
> > +     .driver =3D { .name =3D "lenovo_wmi_gamezone" },
>
> Please set ".probe_type =3D PROBE_PREFER_ASYNCHRONOUS" here.
>

Ack

> Also does the selected fan profile remain the same after suspending or hi=
bernating?
> If no then please add the necessary PM callbacks to save/restore the fan =
profile
> before suspend/after resume if necessary.
>

It remains the same after suspend, hibernate, reboot, and shutdown.

> > +     .id_table =3D lenovo_wmi_gamezone_id_table,
> > +     .probe =3D lenovo_wmi_gamezone_probe,
> > +     .remove =3D lenovo_wmi_gamezone_remove,
>
> Please set ".no_singleton =3D true" here.
>

Ack

> > +};
> > +
> > +module_wmi_driver(lenovo_wmi_gamezone_driver);
> > +
> > +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_gamezone_id_table);
> > +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/l=
enovo-wmi.h
> > new file mode 100644
> > index 000000000000..8a302c6c47cb
> > --- /dev/null
> > +++ b/drivers/platform/x86/lenovo-wmi.h
> > @@ -0,0 +1,105 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * Lenovo Legion WMI interface driver. The Lenovo Legion WMI interface=
 is
> > + * broken up into multiple GUID interfaces that require cross-referenc=
es
> > + * between GUID's for some functionality. The "Custom Mode" interface =
is a
> > + * legacy interface for managing and displaying CPU & GPU power and hw=
mon
> > + * settings and readings. The "Other Mode" interface is a modern inter=
face
> > + * that replaces or extends the "Custom Mode" interface methods. The
> > + * "GameZone" interface adds advanced features such as fan profiles an=
d
> > + * overclocking. The "Lighting" interface adds control of various stat=
us
> > + * lights related to different hardware components. "Other Method" use=
s
> > + * the data structs LENOVO_CAPABILITY_DATA_00, LENOVO_CAPABILITY_DATA_=
01
> > + * and LENOVO_CAPABILITY_DATA_02 structs for capability information.
> > + *
> > + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> > + *
> > + */
> > +
> > +#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> > +
> > +#ifndef _LENOVO_WMI_H_
> > +#define _LENOVO_WMI_H_
> > +
> > +#include <linux/mutex.h>
> > +#include <linux/types.h>
> > +#include <linux/wmi.h>
> > +
> > +/* Platform Profile Modes */
> > +#define SMARTFAN_MODE_QUIET 0x01
> > +#define SMARTFAN_MODE_BALANCED 0x02
> > +#define SMARTFAN_MODE_PERFORMANCE 0x03
> > +#define SMARTFAN_MODE_CUSTOM 0xFF
> > +
> > +struct wmi_method_args {
> > +     u32 arg0;
> > +     u32 arg1;
> > +};
> > +
> > +/* General Use functions */
> > +static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u8 i=
nstance,
> > +                                      u32 method_id, struct acpi_buffe=
r *in,
> > +                                      struct acpi_buffer *out)
> > +{
> > +     acpi_status status;
> > +
> > +     status =3D wmidev_evaluate_method(wdev, instance, method_id, in, =
out);
> > +
> > +     if (ACPI_FAILURE(status))
> > +             return -EIO;
> > +
> > +     return 0;
> > +};
> > +
> > +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 instan=
ce,
> > +                                 u32 method_id, u32 arg0, u32 arg1,
> > +                                 u32 *retval);
> > +
> > +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 instan=
ce,
> > +                                 u32 method_id, u32 arg0, u32 arg1,
> > +                                 u32 *retval)
> > +{
> > +     struct wmi_method_args args =3D { arg0, arg1 };
> > +     struct acpi_buffer input =3D { (acpi_size)sizeof(args), &args };
> > +     struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > +     union acpi_object *ret_obj =3D NULL;
> > +     int err;
>
> Please order the variable declarations in reverse XMAS tree order.
>

Ack

> > +
> > +     err =3D lenovo_wmidev_evaluate_method(wdev, instance, method_id, =
&input,
> > +                                         &output);
> > +
> > +     if (err) {
> > +             pr_err("Attempt to get method value failed.\n");
>
> Please remove any error messages in this part of the code, printing error=
 messages should
> ideally happen at the higher layers of the driver if necessary.
>
> > +             return err;
> > +     }
> > +
> > +     if (retval) {
> > +             ret_obj =3D (union acpi_object *)output.pointer;
> > +             if (!ret_obj) {
> > +                     pr_err("Failed to get valid ACPI object from WMI =
interface\n");
> > +                     return -EIO;
>
> -ENODATA.
>

Ack

> > +             }
> > +             if (ret_obj->type !=3D ACPI_TYPE_INTEGER) {
> > +                     pr_err("WMI query returnd ACPI object with wrong =
type.\n");
> > +                     kfree(ret_obj);
> > +                     return -EIO;
>
> -ENXIO.
>

Ack

> > +             }
> > +             *retval =3D (u32)ret_obj->integer.value;
> > +     }
> > +
> > +     kfree(ret_obj);
> > +
> > +     return 0;
> > +}
> > +
> > +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instan=
ce,
> > +                                 u32 method_id, u32 arg0, u32 *retval)=
;
> > +
> > +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instan=
ce,
> > +                                 u32 method_id, u32 arg0, u32 *retval)
> > +{
> > +     return lenovo_wmidev_evaluate_method_2(wdev, instance, method_id,=
 arg0,
> > +                                            0, retval);
> > +}
> > +
> > +#endif /* !_LENOVO_WMI_H_ */

Thanks Armin,
Derek
