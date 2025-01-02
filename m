Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881091B4250;
	Thu,  2 Jan 2025 18:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843515; cv=none; b=lyJm7daytM4+CEO3MEVfImrCo07eTpycIOFns0iqiEPy7vbxfL2EXWniOZ97Wk0xbz0Udfbd87v2wrgO7LbQJooqSG4Hpm+tq7hiZob0n9hI7fruykk4nrKA3Q+FBhiVs06m3Kr+GB5ekuyD7EA+80y2Sm61AVJZurXekp5QkvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843515; c=relaxed/simple;
	bh=7JvmCKxhH4I1zqLAp7YScRcJo3g8APCAbrUJU9829po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0U2tDqLr9zUUxkSCWMqdN5rBQudqMXW7dr8PvQdf4U0IKpjKrwTgO0xRB9wEb5EI8deoNnQu4ej9EtIN4p5/XOAiGI3GmpqBjJV48+VugENNWWg3Qqu+iyV4AH1tH/SpBWJJS6pOeSOIy5mh8qkzmTBwXoTY9cdbw0rT2Vnt6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFlAZMV+; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFlAZMV+"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dcf63155b0so51986646d6.1;
        Thu, 02 Jan 2025 10:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735843509; x=1736448309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyG1SawkLsr2B+Wyaxjn2+8g0CyNN8zK93X+S5zHeA0=;
        b=QFlAZMV+Sr1br7flwP2mb8VWPrlWupZtqstRRdoqBRbicEMpuA478V8A+SXVdjL5lR
         raGyuzPJ9gf7O8F466tbl6idi3SRA/7BS3YcTaobKcWbAobXnFzFF1k5WGYATjjtk4V/
         vD4boUOPFXqP5XJRN41ajr+NdH2Li7txAA7auviR2deZSJw6aHdz8YpAP27A34UJ9YpO
         Hmk2saZ58TZtr8oDUOZdlPqatU82sxuOeIOVruYuelRxtEYQB+lTMPlGDqUSM6ytKAy5
         sKI6QQqscSFZGfwueURGd/U6hQcmD4dNmh+2+ULrMMI1MhWI13jhFjmknWgXTdDK3A2u
         olbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843509; x=1736448309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyG1SawkLsr2B+Wyaxjn2+8g0CyNN8zK93X+S5zHeA0=;
        b=ki0cnLRXSJ6wmoMW7sL64IuA1RXKH/+yU0/TCdBeukMDmAlDIE+fhfoRGd0o+C4/9t
         sYyubI6XELkicEbOm71Edg9rRNvdveRoyTcfEv2VLYcTsCEfmvuk5fMipjM3SC/ufdxK
         SRtwegBtjnEEWrX/FG2aS1/NZe1N2iVeJiPyCfIQlpQiGlqbb2osrOWAoyVJeN2SNozo
         zK9dA+3ABRDsMiq/Zb2jyfz8O7rO83nvVGzUs2jRchg0iOTmCOEAjREUTbsGxXIx9aqK
         cxAFyMojhhAG9JCb89wJbeASh3yVUL38QalnxOgkY6eWs/OmOZQ0ww/XMuFKwltSAHPG
         sf3g==
X-Forwarded-Encrypted: i=1; AJvYcCUJJNyw5WfexUYfKN1ZD3r98hh5iEWTjm3khIWKdguDaYo16XCHf13coMg1mDgb+343ht6hsPVCRAg=@vger.kernel.org, AJvYcCVWYWcpSrr2qm68IOfEyOK8CGuOEGRPIBTdaeg2SHdGdt0pcS4UCJtA7azYvVU1jEH/4uhemx7GYambBuxx@vger.kernel.org, AJvYcCWcKu/pLwY8/rZ0miH6CKQBru/Ic3QQjvPg+jqgstw8KfUHwZwZQQ6E3HmoUvDwLc+3iHV5MqyCTDwb+PutwkNhbkMzyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/01S88DRdv8AfW2FWooyfaEQkND+LjlPXxYTOGrvIyTzUO9q
	ocB6JA0GmNLoiN7K6JBBbau5BJfMmmP6GUS11qWujs7Nu+2W7I3etIV+HkBUxZh8f0d0fKO7tFA
	LewDvjOKq2u8YIfkXDVY0HUXctm4=
X-Gm-Gg: ASbGncvgooUxKNuE5oWic2xa5GIlQcN1N6CyM/1TG3cm2ieE9dHexG/81V0GLLDtEhU
	B03x9uF9sz7+ODsRmGDA6Psg9qt4Uj6RUYHrIbZQ=
X-Google-Smtp-Source: AGHT+IHfFXmY610jD3qo+3MZ5iRgzpmBgVAs4nzDm+BV7DA8/PRgQ1mPb4ZxZ976BW/6M42KnjPSdUkTOyu/5AhYuJo=
X-Received: by 2002:a05:6214:23cb:b0:6d1:87f7:2924 with SMTP id
 6a1803df08f44-6dd233ada50mr853340086d6.47.1735843509417; Thu, 02 Jan 2025
 10:45:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-3-derekjohn.clark@gmail.com> <e738cf05-6fa6-4ca7-ba18-7f90bd316473@kernel.org>
In-Reply-To: <e738cf05-6fa6-4ca7-ba18-7f90bd316473@kernel.org>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 2 Jan 2025 10:44:58 -0800
Message-ID: <CAFqHKTnnZYkT_RzdGFQ_HbCY-AzZF7CZhbAn-DyusgAEBDMpqA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] platform/x86: Add Lenovo GameZone WMI Driver
To: Mario Limonciello <superm1@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 1, 2025 at 8:09=E2=80=AFPM Mario Limonciello <superm1@kernel.or=
g> wrote:
>
>
>
> On 1/1/25 18:47, Derek J. Clark wrote:
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
> > +{
> > +     struct lenovo_wmi_gz_priv *priv;
> > +
> > +     priv =3D container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
> > +
> > +     guard(mutex)(&call_mutex);
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
> > +
> > +     guard(mutex)(&call_mutex);
> > +     err =3D lenovo_wmidev_evaluate_method_1(
> > +             priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SET, sel_prof, NU=
LL);
> > +     if (err) {
> > +             pr_err("Error setting fan profile on WMI interface: %u\n"=
, err);
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
> > +     }
> > +
> > +     priv->platform_profile_support =3D supported;
> > +
> > +     if (!supported)
> > +             return -EOPNOTSUPP;
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
> > +
> > +     guard(mutex)(&call_mutex);
> > +     err =3D platform_profile_register(&priv->pprof);
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
> > +     .id_table =3D lenovo_wmi_gamezone_id_table,
> > +     .probe =3D lenovo_wmi_gamezone_probe,
> > +     .remove =3D lenovo_wmi_gamezone_remove,
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
>
> You can't go and put a static function in a header.  It needs to be in
> it's own source file.
>
> > +
> > +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 instan=
ce,
> > +                                 u32 method_id, u32 arg0, u32 arg1,
> > +                                 u32 *retval);
>  > +> +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8
> instance,
> > +                                 u32 method_id, u32 arg0, u32 arg1,
> > +                                 u32 *retval)
> > +{
>
> Likewise you can't put this here even if it's used by multiple drivers.
>
> You can leave the prototypes here, but the implementation needs to be
> moved to a C source file and the symbol needs to be exported from one
> driver and used by all the others that need it (maybe a "common" one?)
>

Simple fix. lenovo-wmi.c or lenovo-wmi-common.c is preferred?

> > +     struct wmi_method_args args =3D { arg0, arg1 };
> > +     struct acpi_buffer input =3D { (acpi_size)sizeof(args), &args };
> > +     struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > +     union acpi_object *ret_obj =3D NULL;
> > +     int err;
> > +
> > +     err =3D lenovo_wmidev_evaluate_method(wdev, instance, method_id, =
&input,
> > +                                         &output);
> > +
> > +     if (err) {
> > +             pr_err("Attempt to get method value failed.\n");
> > +             return err;
> > +     }
> > +
> > +     if (retval) {
> > +             ret_obj =3D (union acpi_object *)output.pointer;
> > +             if (!ret_obj) {
> > +                     pr_err("Failed to get valid ACPI object from WMI =
interface\n");
> > +                     return -EIO;
> > +             }
> > +             if (ret_obj->type !=3D ACPI_TYPE_INTEGER) {
> > +                     pr_err("WMI query returnd ACPI object with wrong =
type.\n");
> > +                     kfree(ret_obj);
> > +                     return -EIO;
> > +             }
> > +             *retval =3D (u32)ret_obj->integer.value;
> > +     }
> > +
> > +     kfree(ret_obj);
>
> Can you use __free on the acpi_object so you don't need to worry about
> cleanup in the error paths?
>

Acked.

> > +
> > +     return 0;
> > +}
> > +
> > +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instan=
ce,
> > +                                 u32 method_id, u32 arg0, u32 *retval)=
;
> > +
>  > +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8
> instance,> +                                u32 method_id, u32 arg0, u32 =
*retval)
> > +{
> > +     return lenovo_wmidev_evaluate_method_2(wdev, instance, method_id,=
 arg0,
> > +                                            0, retval);
>
> Same comment as above about source code in the headers.
>
> > +}
> > +
> > +#endif /* !_LENOVO_WMI_H_ */
>
