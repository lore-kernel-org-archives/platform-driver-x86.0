Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD59F24503B
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2026 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776664927; cv=pass; b=h2KhXDbbvVvZ8L8tKJdqutpsuvt8xxaw1pR7vOPOLH0bZSGIaO72Oqt//97ipn52Mp2sFJkkyMfjqzqIjAoKrBpROTkyLp2W5uUbN1EQIzBCiRQcfF59OwEwJ9quEXLIJPM0e57YDuN2UONM0Vslg+OaX5kJZbZLqlFFkbTDef0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776664927; c=relaxed/simple;
	bh=UzHTpTddwj/hdvpQj2SjQ6GztClYQ6YELriA+Nuk2gA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9DiBTu7SicZ5FyNG6SlfrAIYAe2SnJlOCfCfxtacag0Wh8FcbeAzfz9YXNFIuuMEzc0uRrtHTKrDRGACrMFOsRgMHgGylLDwVhTrCnUcPWjXUfW2VXBuuG3C3CImHD0+k+RUAlo9en3+1pfal9WvmN9Wo7I69T/n6fcgN6VgSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5mSTbMA; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5mSTbMA"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-651cfaa21e6so2388702d50.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Apr 2026 23:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776664925; cv=none;
        d=google.com; s=arc-20240605;
        b=ZMF2ZdNdF56iHK4+kvPjjk+xzUKrnWixrzdMjwwWKyxdfo5b908ha1HX9sjkDmbDsY
         Aig3XdoFVrBZpDO1D4cOY6Kd07JTu1SV2zPjGNcKbYnP2zjvZ+IayNJr/HAYqi4qO8Ww
         zSfQOsqWRflC9Wjpnxax1N4ffieftSCv+9emzMP2Ya7DYvIzgtzN34c3QCVz0/jS0+77
         qRsb1cOGBBK91EhPAD29+FB5yb3JjeOpum/DAR5enuugucmKJj28nQmpuxFM8R/1zUK0
         60tUEmHhrVB4hw1TE+XRQBLI5H3PcH1LTtTj0yyXhodNYnRUzrcl5neZj0sGrQ2EL0gi
         hD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FE6YgURx2CHK+Uw2pByOkdwzmr3S1NzIv88TNJhRN2M=;
        fh=UkRIHCwBEA5VR6dEY1e30XynJpGlCEpvmUBbiVDIz7Y=;
        b=KmmGsyuqtMlxKSSVkTeqenBRDxE+5D9YQIhywC0xeT223ufDVNDOlmMGVypwYKBO00
         973L0Nd2Q/HIPcYpV/CfnRdZGnD5Om7uYRsR3Ut3hUbpQquLUFLARFKJoTJj/lPzZiE4
         fdL55RR4VzVshwpWcxLTkn1Yu9H5bo8J3Jz/rFk2wyW3XMXTT/1efS5VVFlJSx0WUcxS
         XV/wkAQn7a+B8IXKkoGpIv/2pinxnJ7fa29Uk7919UN14BXMhjLX4j+7nKHnmo5rx1gm
         tLvUIL3Zr061a2ualgr/5qQXo8lcHX1A+Gzr88XIcPoQ0subASIwTZHQtDJyhPnelGei
         SkgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776664925; x=1777269725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FE6YgURx2CHK+Uw2pByOkdwzmr3S1NzIv88TNJhRN2M=;
        b=l5mSTbMAFK/37r6utnRMdVv37a2Rgfoohw+HFPBmZFY0pgePuISMd1RWIZLIDjGEYp
         VxfoLiM/4ajlP9UAvNTmDuuLkDnGR56QX9yeRCPuziQh8BCOt1CKfALhpx43+hgRr72g
         vo+rRGTYF+AY/0LXFWD7h10i74FRK8riLJaI2fKkE7KCmhlnPm+WuRtzwZERRBgOTiVP
         Q5ewd1upHDFkSyRl0Jbbx7fXqr5/n1nsNZ81VC+GyVXBXMNUsw9WvEssV510k7nSS+Dp
         4ihdfpvXbDabxH2WRU1NLgWGD4ffDpKtLKH5+1EgWn/L0u3YhMrwkqgJfIXmMynCOkBe
         CvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776664925; x=1777269725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FE6YgURx2CHK+Uw2pByOkdwzmr3S1NzIv88TNJhRN2M=;
        b=hPVJXfp4yTcAHoYpn1xgkLJa6+HlxKBzeRCMsYhYackOnZmiNNXZr3q0LPwP2T33uA
         LhvdpJBl2TBsXMGDFCK/pnWbi5KOJZtg9+xEIBSE6/VGfe1b1Nwbkw3+1Un87JtSeIyy
         dktsyabwK+ndayuWZ4W7OLHwdd2tJ1pRQUB17Q+Ab8P56+mC18+9CzU4cpG5cqXHV6s8
         FZULTZgDiAxnrPbFZ9AnT0m/xoTt+0uftDKAqoPR5ieslLYiBs3suGW+v028u7hRq41v
         uLGDJCNa7Umu2ikbhYUhOlOMWYxMIQQJzA+2rUEoFJxSCCxdeE2vaL0qu0QPYGmZiRmh
         n++g==
X-Forwarded-Encrypted: i=1; AFNElJ8UU+EAnKrrjv/UFPRWZYG0qzDNN4VxkXcV2k0yILpVaPnYS2S9yoJqditp5Id802dP5HPeRZMRnTYrWidnEWTojLe0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhtc3y1rd/k7CpIbHXwhjhfjckpSdBu3yH8ljF0pMjRuGV63S6
	z7c2gpXCn/44bqo4H3HuU22iTKJ7MYB3Tf7a5qmuO9HcdDaYrpEuibBNEnvUnEyoZljv1cc/7AK
	jDV5TUoH7CNUeO3ay/XZ0Vqk+yjY1UnU=
X-Gm-Gg: AeBDiesCKZ4aKhgXOf7+xjTp4o7xwvPAPeSyeVi5sFH3YdS3KYi8qdVZGgnxncY6h+9
	eMWQGYOfAZfIIMQLbm474OGg5Xo6+13l3tOn7NZBLzD50sR5EYMMyM+S/3N9zRVU9X6P+IosuWj
	V5aRJMYGbNhq8y3EicyfAEc6qDAdfwgeTCHhY0cBg2/QIrt+5tN640ByJNcYVxIkTPe3o3eBJxM
	73KPzG0uqDio23AZ3iVkROZb/JS63An53rQgPkUTCrPnr/oeCiB/WRgR/LediUmaOdZaar9Qd42
	RHYP3Wqs9DPZJdInXL9E+zWMSAAJLmhFVnkpFtT8pCiqaA0kExMhkd3t4RflZA==
X-Received: by 2002:a05:690e:4012:b0:650:327f:4ff0 with SMTP id
 956f58d0204a3-653119490c3mr8979491d50.12.1776664924713; Sun, 19 Apr 2026
 23:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415062255.1615337-1-jackbb_wu@compal.com> <1b234e48-b41f-9c81-ce25-a0fe00f654d3@linux.intel.com>
In-Reply-To: <1b234e48-b41f-9c81-ce25-a0fe00f654d3@linux.intel.com>
From: =?UTF-8?B?5ZCz6YC86YC8?= <wojackbb@gmail.com>
Date: Mon, 20 Apr 2026 14:01:53 +0800
X-Gm-Features: AQROBzCJ1JyUVSwr6QTUEXpuNEjHKX4tRgclJFMzbVSnH6M89fnl1Azc21Rj7zo
Message-ID: <CAAQ7Y6YYzvNpKD9ifxJK-s+3Jy+DobL4Nj7yAbDyaKm5ZvfbOg@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: dell-dw5826e: Add reset driver for DW5826e
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have corrected them in version 4.

Thank you.

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> =E6=96=BC 2026=E5=B9=B44=
=E6=9C=8815=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:43=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Wed, 15 Apr 2026, Jack Wu wrote:
>
>
>
> > If the DW5826e is in a frozen state and unable to receive USB commands,
> > this driver provides a method for the user to reset the DW5826e via ACP=
I.
> >
> > E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset
> >
> > Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> > ---
> > v3:
> >   - Rename sysfs attribute from "pldr" to "wwan_reset" for clarity
> >   - Add ABI documentation for the wwan_reset sysfs interface
> >   - Validate _DSM method availability in probe using acpi_check_dsm()
> > v2:
> >   - Remove extra empty line
> >   - Add missing includes and Remove unnecessary includes, sort includes=
 alphabetically
> >   - Remove noisy dev_info()
> >   - Handle obj->type !=3D ACPI_TYPE_BUFFER as error with proper return =
code
> >   - Replace miscdevice/file_operations with sysfs attribute (DEVICE_ATT=
R_WO) to reduce boilerplate
> >   - Propagate trigger_palc_pldr() return code to userspace
> >   - Convert from acpi_driver to platform_driver
> > ---
> > ---
> >  .../testing/sysfs-driver-dell-dw5826e-reset   |  9 ++
> >  drivers/platform/x86/dell/Kconfig             |  6 ++
> >  drivers/platform/x86/dell/Makefile            |  2 +
> >  .../platform/x86/dell/dell-dw5826e-reset.c    | 89 +++++++++++++++++++
> >  4 files changed, 106 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e=
-reset
> >  create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
> >
> > diff --git a/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset =
b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> > new file mode 100644
> > index 000000000000..88286191caa6
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> > @@ -0,0 +1,9 @@
> > +What:                /sys/bus/platform/devices/<PALC0001 device>/wwan_=
reset
> > +Date:                April 2026
> > +KernelVersion:       7.0
>
> This ship has sailed long ago. ATM, you're targetting 7.2.
>
> > +Contact:     Jackbb Wu <jackbb.wu@compal.com>
> > +Description:
> > +             Writing to this file triggers a Platform Level Device Res=
et
> > +             (PLDR) of the Dell DW5826e WWAN module via an ACPI _DSM
> > +             method. This can be used to recover the modem when it is =
in
> > +             a frozen state and unable to respond to USB commands.
> > diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/d=
ell/Kconfig
> > index 738c108c2163..c4540c837a88 100644
> > --- a/drivers/platform/x86/dell/Kconfig
> > +++ b/drivers/platform/x86/dell/Kconfig
> > @@ -276,4 +276,10 @@ config DELL_WMI_SYSMAN
> >         To compile this driver as a module, choose M here: the module w=
ill
> >         be called dell-wmi-sysman.
> >
> > +config DELL_DW5826E_RESET
> > +     tristate "Dell DW5826e PLDR reset support"
> > +     default m
> > +     depends on ACPI
> > +     help
> > +       This adds support for the Dell DW5826e PLDR reset via ACPI
> >  endif # X86_PLATFORM_DRIVERS_DELL
> > diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/=
dell/Makefile
> > index c7501c25e627..8150283cfd1d 100644
> > --- a/drivers/platform/x86/dell/Makefile
> > +++ b/drivers/platform/x86/dell/Makefile
> > @@ -28,3 +28,5 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)           +=3D dell=
-wmi-descriptor.o
> >  obj-$(CONFIG_DELL_WMI_DDV)                   +=3D dell-wmi-ddv.o
> >  obj-$(CONFIG_DELL_WMI_LED)                   +=3D dell-wmi-led.o
> >  obj-$(CONFIG_DELL_WMI_SYSMAN)                        +=3D dell-wmi-sys=
man/
> > +obj-$(CONFIG_DELL_DW5826E_RESET)             +=3D dell-dw5826e-reset.o
> > +
> > diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/p=
latform/x86/dell/dell-dw5826e-reset.c
> > new file mode 100644
> > index 000000000000..98c5b68c8746
> > --- /dev/null
> > +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> > @@ -0,0 +1,89 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> > + *
> > + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/uuid.h>
> > +
> > +static guid_t palc_dsm_guid =3D
> > +     GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd=
8, 0xfd, 0xfe, 0x59);
> > +
> > +static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
> > +{
> > +     union acpi_object *obj;
> > +     int ret =3D 0;
> > +
> > +     obj =3D acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, 1, NULL);
> > +     if (!obj) {
> > +             dev_err(dev, "Failed to evaluate _DSM\n");
>
> Missing include.
>
> > +             return -EIO;
> > +     }
> > +
> > +     if (obj->type !=3D ACPI_TYPE_BUFFER) {
> > +             dev_err(dev, "Unexpected _DSM return type: %d\n", obj->ty=
pe);
> > +             ret =3D -EINVAL;
> > +     }
> > +
> > +     ACPI_FREE(obj);
> > +     return ret;
> > +}
> > +
> > +static ssize_t wwan_reset_store(struct device *dev, struct device_attr=
ibute *attr,
>
> Please also add linux/types.h for ssize_t.
>
> > +                             const char *buf, size_t count)
> > +{
> > +     acpi_handle handle =3D ACPI_HANDLE(dev);
> > +     int ret;
> > +
> > +     ret =3D trigger_palc_pldr(dev, handle);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return count;
> > +}
> > +static DEVICE_ATTR_WO(wwan_reset);
> > +
> > +static struct attribute *palc_attrs[] =3D {
> > +     &dev_attr_wwan_reset.attr,
> > +     NULL
> > +};
> > +ATTRIBUTE_GROUPS(palc);
> > +
> > +static int palc_probe(struct platform_device *pdev)
> > +{
> > +     acpi_handle handle;
> > +
> > +     handle =3D ACPI_HANDLE(&pdev->dev);
> > +     if (!handle)
> > +             return -ENODEV;
> > +
> > +     if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(1)))
> > +             return -ENODEV;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct acpi_device_id palc_acpi_ids[] =3D {
> > +     { "PALC0001", 0 },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
> > +
> > +static struct platform_driver palc_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "dell-dw5826e-reset",
> > +             .acpi_match_table =3D palc_acpi_ids,
> > +             .dev_groups =3D palc_groups,
> > +     },
> > +     .probe  =3D palc_probe,
> > +};
> > +module_platform_driver(palc_driver);
> > +
> > +MODULE_DESCRIPTION("Dell DW5826e reset driver");
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("JackBB Wu");
> >
>
> --
>  i.
>
