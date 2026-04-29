Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB98328B77
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777442915; cv=pass; b=ZQNdyKBeUmH0tSqSthpctb4SHpSWO35HCLc+KmfPcMuWvtUH9eIcTac+sve+jumRzPeLnh6auU0CXmpZd5Gt9BgnDQ88qeu9QJoL+fNb65YREE8fiCYRQKR6lVkpqYLzU4gpWx7nXwKHPKTdQN4UEcn5td6StGw+dODf6CAhMQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777442915; c=relaxed/simple;
	bh=3QBLenzDTLtDG1rlQ6GdthWJLrsiO5cnco7lbHMFD4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjCKnd27q16kmAmmhQ+xhSr1ur4CRDPJBs1rox+5VKaGVnyp0401IFWjEupRLV6mM+lKADbXOmkiGJ7uhDO+pzmgr8Os2S886Gwsd9zT1Li/GJSidgm9G3yMkill3HHHfKKJzSbAOexkwH8YTwF3HSjCN+ajWpBCt/Onn4psN2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYr4AXOn; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYr4AXOn"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-65005a8840dso10546934d50.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 23:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777442913; cv=none;
        d=google.com; s=arc-20240605;
        b=aDZvmP2GpNm3mLdfjOALd5kkEF8Utmi03Qa8sSbup9uHDVQSeFa9pIx52C5X0tUCLx
         2ZH4ArsY08i5XbEoMT9cx6vrQLKSw4XtOXF+jy8k8v+4fKKyOkBNxu3bZVE3iDBtq9CG
         iK8nkD5OllNJJbpxwuig+ZDU/XNDU3CgCU282/UA/XklZMdjSyJmPmcELwOWu2Y4jSJA
         MWw4vzRInfE2xTAPk8UljLtGtc2+jEs3XMAIZmuXZ77Vvb0RJWRRI+JXQsjYVO+cmUYg
         nc+WlNMP88fEpAMWUSA6ut8xhry+vOShErI3sgqdEhmuh1w+bin1ZGQAY1e5McGW6mnl
         qkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=scdjX6a3Aoh8xVK+20Zxf4LihILvtIzU1zlLOXt9QS8=;
        fh=/fNoPkmTr4+uNwkBp8RHrZRASiLi5ZehETsPnA8BxW8=;
        b=Zr2G5PQfDpIWq8woPmNNdF0ltai57vZj8vYa0bIQEtftc9pbF1W/lFzUORXO/7qVly
         zqHZbhqxSdjVAtseBygSKD3ZMHbEXe7diCnm30BVi3o1Qs+McMjey85/qlFKQilvpOOk
         F35ViEDdWchUPSjijjpuoYjU306Br1m9m2VRT0NTW/YPNTnoKciFPqix4NaDvPB4kOhm
         qJ9LKdbxnzdLPW2inoQxMqzO+RXPxQw+/3HURulAbcifQZeoyxSf1ZMiOQEEpuZMQCWl
         x66yXW/lJ3ecEiq6XT2D9D1x4uin7GcmoDibDoq6X7F0gTHogTOfTfU5xqwUuqHyDbbF
         dsWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777442913; x=1778047713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scdjX6a3Aoh8xVK+20Zxf4LihILvtIzU1zlLOXt9QS8=;
        b=rYr4AXOn61HbSfCFwTJSzTtLi79jFQEGnRAMvDMuBjmEpITF+am2DEhkv28cmxvoov
         W/JtDopBHcrCPfjRcCtGaALSW1r9+57lsaFmKf7obCQiDgNSmgu8e4h9dHFYXG2KBsSr
         tjcFJZ8zIiu+GU6svVvTNR2mYCCfteaiRgOAjsKxaqTg/q+aEtJF8phAj9TIWSa+clJL
         plhtnummu7t8fKR2ShMjFYiKTRB/njy2BajdArk6zGJFJtVMz6NVnzrrTvt3crm9H4I/
         SeuGbDalz7rdA0LGY7kR3aDQ1TjQKMzhmDfSUN/g5EXJlwxyT8+0C5erUujGPRdQeJqh
         rsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777442913; x=1778047713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scdjX6a3Aoh8xVK+20Zxf4LihILvtIzU1zlLOXt9QS8=;
        b=ssfEDMZBsF3EeV1XxXRkV4HRLOlb2eiVpuzEmqA/8rSQeWuEl2/Gg7Zffl5v7IRWPx
         WFGFQguEcxfImFFkJO2Mwhx2Y+Izn8pwdzTWwOHHzGCAxS64EA9qQshQQzRsahr05zEi
         8U0SDYyk8xHKHHPc9gk7Mf+FLhqdVhJVtpNqB/LHJv+PRbcWpX122X1Gvnu+B7SUad2D
         o+uT8Y9G/+a+spaERBaMOuCEETnjuHTLRbqwE+Tv1Zu91aKU/iDha7NvgRWUKlWgzObu
         voTCDqP3JwyRvgRns96qGFrxSJTbCYE/vrjf2H0Aju24LheM7RQ+xQ9+OBK60I5J5JQL
         svMw==
X-Forwarded-Encrypted: i=1; AFNElJ8dapPk1bUoW4Hut/7brvmrnoVLrclANP9mw61W68suhQ45Zi3gkCXdfiTKubWH8Kzem1lOA94jpgHmJ3Tq356XkHxQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz314lRiMJzJ6UeJ5fOzqLjEqF13VqDNC30Is0D1DWYf/9Jmyq
	br4RXGIsXbNE4b+S05R530p41sxhlHCQUOA8CfB8csI4WsE0ogtY+3ndhvzuHj6IZ6VBjn70O64
	wruBDhn3Ev1jkHjNlLsyqhbZ8cvVYvzc=
X-Gm-Gg: AeBDiesKYxg115zzrE9xDcZjK+fN5AZ0/nO6bOGn9YoQQAdnQKRjV381xZKt14JAHvZ
	Olz6/utO17lfFF+yf03TYRv6jTi9RMoHO70oxZ/Z9J91A8tlyUegbjhX5YDMywd9HqDHv52Fdl0
	i0wNiQ/iZEBbIqZZSZTpQOL7uqNOyoae/YUOT8eWNvje7rItHmH1uw+37gPZG7dPiQyC4eNpdAg
	Z/gEIF5tPB2WjUBrbQv3AxAkLbSIRS3+WgfINEb7gq7T1CxBfntB415gPE798yCfcMNZc3NX11p
	OgcuNYct12JrsVD68/i1bqcrKc7gIQ==
X-Received: by 2002:a05:690e:4842:b0:651:cf77:f7d3 with SMTP id
 956f58d0204a3-65beee43e5emr3964617d50.37.1777442912730; Tue, 28 Apr 2026
 23:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420060029.1754854-1-jackbb_wu@compal.com> <dd9114dc-2bf7-4167-8697-445974daee49@gmx.de>
In-Reply-To: <dd9114dc-2bf7-4167-8697-445974daee49@gmx.de>
From: =?UTF-8?B?5ZCz6YC86YC8?= <wojackbb@gmail.com>
Date: Wed, 29 Apr 2026 14:08:19 +0800
X-Gm-Features: AVHnY4L6MW9NQqjm-OhKTFwPNAK8z6FrXYJwiaakZ5trjgaJXojWRInBvFQ6BAQ
Message-ID: <CAAQ7Y6ZM8UWEzDC+Z6A=oYH_pXjTfH8QDna06kJ_9z8k8vWa_Q@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: dell-dw5826e: Add reset driver for DW5826e
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have corrected it in version 5.

Thank you.

Armin Wolf <W_Armin@gmx.de> =E6=96=BC 2026=E5=B9=B44=E6=9C=8829=E6=97=A5=E9=
=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=885:16=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Am 20.04.26 um 08:00 schrieb Jack Wu:
>
> > If the DW5826e is in a frozen state and unable to receive USB commands,
> > this driver provides a method for the user to reset the DW5826e via ACP=
I.
> >
> > E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset
> >
> > Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> > ---
> > v4:
> >    - Fix version of the ABI documentation to 7.2
> >    - Add include linux/types.h
> > v3:
> >    - Rename sysfs attribute from "pldr" to "wwan_reset" for clarity
> >    - Add ABI documentation for the wwan_reset sysfs interface
> >    - Validate _DSM method availability in probe using acpi_check_dsm()
> > v2:
> >    - Remove extra empty line
> >    - Add missing includes and Remove unnecessary includes, sort include=
s alphabetically
> >    - Remove noisy dev_info()
> >    - Handle obj->type !=3D ACPI_TYPE_BUFFER as error with proper return=
 code
> >    - Replace miscdevice/file_operations with sysfs attribute (DEVICE_AT=
TR_WO) to reduce boilerplate
> >    - Propagate trigger_palc_pldr() return code to userspace
> >    - Convert from acpi_driver to platform_driver
> > ---
> > ---
> >   .../testing/sysfs-driver-dell-dw5826e-reset   |  9 ++
> >   drivers/platform/x86/dell/Kconfig             |  6 ++
> >   drivers/platform/x86/dell/Makefile            |  2 +
> >   .../platform/x86/dell/dell-dw5826e-reset.c    | 90 ++++++++++++++++++=
+
> >   4 files changed, 107 insertions(+)
> >   create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826=
e-reset
> >   create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
> >
> > diff --git a/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset =
b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> > new file mode 100644
> > index 000000000000..a665e265633f
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> > @@ -0,0 +1,9 @@
> > +What:                /sys/bus/platform/devices/<PALC0001 device>/wwan_=
reset
> > +Date:                April 2026
> > +KernelVersion:       7.2
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
> >   endif # X86_PLATFORM_DRIVERS_DELL
> > diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/=
dell/Makefile
> > index c7501c25e627..8150283cfd1d 100644
> > --- a/drivers/platform/x86/dell/Makefile
> > +++ b/drivers/platform/x86/dell/Makefile
> > @@ -28,3 +28,5 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)           +=3D dell=
-wmi-descriptor.o
> >   obj-$(CONFIG_DELL_WMI_DDV)                  +=3D dell-wmi-ddv.o
> >   obj-$(CONFIG_DELL_WMI_LED)                  +=3D dell-wmi-led.o
> >   obj-$(CONFIG_DELL_WMI_SYSMAN)                       +=3D dell-wmi-sys=
man/
> > +obj-$(CONFIG_DELL_DW5826E_RESET)             +=3D dell-dw5826e-reset.o
> > +
> > diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/p=
latform/x86/dell/dell-dw5826e-reset.c
> > new file mode 100644
> > index 000000000000..4e0d64535abb
> > --- /dev/null
> > +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> > @@ -0,0 +1,90 @@
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
> > +#include <linux/types.h>
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
>
> Please use BIT() for the DSM method here. Also consider using a define fo=
r the
> DSM method index.
>
> With that being fixed:
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
> > +     if (!obj) {
> > +             dev_err(dev, "Failed to evaluate _DSM\n");
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
