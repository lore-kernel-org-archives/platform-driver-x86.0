Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D015D38AC61
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Apr 2026 06:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776234311; cv=pass; b=CJ2rF7b3CdXiG1ZMKtZRIjZE684SsVDKbap14LRH8eV7ILHf93kzeiRAZe7dBpirTjmukwwuspLCAK+1cZN0xHgM2kUC6Vl2Wd9IWdtErVEaDUZjDtYUsfhNphO249xMx1JRslPHJCjmqrS5hjF/sy2Y+k4hqn2AB8BMW604vVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776234311; c=relaxed/simple;
	bh=E+Se1x3KPy4aRVceEvRMs4nij076oklWmGwd5viTUCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSfW+nmAzYUBSVLl50irpx5wPp8UmpN/fhvnYDTIjtPR1BM9pRQjBwrMJyQpHWMhVD08gc0yEFVb87KyXHRnTlRs2Pg033vvg0d9VKWe9bt0SU/I/J3OIjVQ/3RchV2aokNXLg9ktC4N+GHPbu3wYQ+MLcmrvVqr3Gxk5EMgM9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAOztM9l; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAOztM9l"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64eb84d1e37so4937983d50.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Apr 2026 23:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776234309; cv=none;
        d=google.com; s=arc-20240605;
        b=XRsFXqqA0nKU1VeDOx2X/eeMD1Jz/vxYJ/D8Nz9hPn8LapGuHTw3215S0l4il/9k90
         APQh2+u84ueZmpLODVBec8xYkCtf68QuROxnpTqDPK0M70itoQ91D6eYNrMjJTtTES9+
         04fiWhEKVMQ7URI9nWWBSBj1iQnp9hdbDigGDC4RBaFwZnSYe597SZVABbUlVy/gKYB6
         IR2QWPWrB2n/vxxmynOM0WcQVmZH0kK8codDOEKm3S7cU/ZD8+Z+u4+ivE7j3DtkmU4t
         bi4rg/ml473KtjAYbfRzTKKOVvQhHhWL7RjY79fsENkSLk/eWJDi/YDjpsvBltDmEG5v
         fqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jt5grHWKGUvf2j6gaAbli3eUo6Qz3g2Sjs1DrXNwxy8=;
        fh=UIMaPH3u/Vgu0mHmt17Wt5/XJlGWZPhw2RXJKw1GpXs=;
        b=a65Sm4lY66vlZdAWTx43N4dhNAglm/kkJcsJc9qeJurHbZVttwLT+lCFzNFlic7m/F
         oE2NCGFQMi7eIQu23sU3Zi6kVONsAGIqvlDwVfI/pD7C9mfE1c7PxN+wbw6JN/b1b9B8
         p7hIsx6yuHwzYHdQwnIUDvyXGljbF97kl4fXyDmnVKtbpL4tEJdeG1AceJl0+5SCvjCY
         CV26JfvxChZ0CQ3Oek7Ba65YEOXviWCQ2W09mrf9w+IWExaT+88jxZsQPFQS2mVpcwfv
         JrXFyuu/6PD7y07SrLB4Jx4tApXm7Okcyl6jyogjaj3/KRcP/y3me+GSxoAvzXTHE4QV
         O4YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776234309; x=1776839109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jt5grHWKGUvf2j6gaAbli3eUo6Qz3g2Sjs1DrXNwxy8=;
        b=cAOztM9lrZXCqjIUVL4gi0A9zmR8hQ+5H6pG1MhODMv6fFw/v2R3AZoIdAdAelGE3w
         puPmR+WRlRZDfISxH5Vdht05xYDPsfiJ7wVQM8KCD10oEVgBUOFNerL7vreimKVqY4X3
         gjfSTYt3LK+hCN5iy0Ck6x/NkuzdPsARG5pH1PDUOX/Bi3JQ7SvW6D9dUNLKoQol4n32
         KtBDv0i0wi3yhadVxotgqQ3mmNnH9RTF544Z3v4A13zV+7azOVGPytkdnJxgLRhVv76c
         LmoHlkplhNVjfIleCQPKi/cOELlKb+A8rrueO0qORAJs2pZ2v7FvVGdSOG/PIziK4/5/
         GexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776234309; x=1776839109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jt5grHWKGUvf2j6gaAbli3eUo6Qz3g2Sjs1DrXNwxy8=;
        b=L1clslusT+6yrEStInkky39Let3BGGsLv23HuOnlyyDgoVymZ6pNNJ8tyoOWWNl1X2
         imgfDmU8Bxio89bMuI6K0SVC6DT22wMecD3lSUjo6Q6N//OhgJCBNvYSTklggKbQNuAw
         kq7GoasBPbyzm/azG2tNt6qLnAPK4uxO3V9e/0YaGnoVpXEb4FY8anDpF5atjMNwgVg1
         /iat6+Qtdgz6SQ0e3LWk3gqY59uK598q7bk38W7mhiKvmBWVphUhaZ51TNSgm11ZNb39
         Y74t2oiuDyAf20WApVcwluD699SyYcLJvHA8uUJ+PlAPq+P+tsX777UkaeU4L0T4D1Ko
         vvEg==
X-Forwarded-Encrypted: i=1; AFNElJ9j7aTKbJLkuhQAshFym1K7/mzNn9ZgSbt4wEZNt8MdiW+cY2TLKIlFvU+4UrIch/9PFoC5iywQqICtTtRz86zKVfe/@vger.kernel.org
X-Gm-Message-State: AOJu0YxQYTJEoFMEUSn6dHbxcDmGdU8uceqZORRsEixNFIQ8x97mnLUy
	NC2fFBhAKI/OlD/eYVDJ27DAYhZwJ+/dWA+5PP3rD3c+jK1JwLu9Cy/Wm+WSUmgLvSz8X4nPvQU
	5dWlTufZK+hT6eUJoCBMDidDpH1z7Hos=
X-Gm-Gg: AeBDiespypHfYfCGla4+ZyY30tyj6hipYOLNbHk2h8V28JkF4vQ6N29h1hNPGodPfhJ
	zsUXENFLEYyXSj7McCNCFPNCqlbitxNor5j+1Zt9dEaDefQUAeBqaEqifMS98zHvwSSYFWiRh1D
	GltmmWg+1rhuueLty3XnZmUauOJ+CSxr4DLqbWiMvWDvPTSg1B7hPOR5copVjih3OzSrY1hh61M
	HOilL3GY4QVctcFnbAKCE2h0D2gvP2vD0XqRVOH+lDfL+74+MmqYYKVhIldGPBpwMLOwMDVLXsP
	nPrypQEDcXYLRb/QCMCzgHeyuQ5GVNuPWXmKauQ=
X-Received: by 2002:a05:690e:150c:b0:651:d2e3:394 with SMTP id
 956f58d0204a3-651d9b53e9cmr6612187d50.34.1776234308876; Tue, 14 Apr 2026
 23:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410093752.298067-1-jackbb_wu@compal.com> <fd2d0fd7-b6ca-42e9-81cd-eb41b6b857ce@gmx.de>
In-Reply-To: <fd2d0fd7-b6ca-42e9-81cd-eb41b6b857ce@gmx.de>
From: =?UTF-8?B?5ZCz6YC86YC8?= <wojackbb@gmail.com>
Date: Wed, 15 Apr 2026 14:24:54 +0800
X-Gm-Features: AQROBzB_8j2l0egujvmI-rdPkM5TNavMyP73oCCgsy5HYAMxHzGBFtULASnfS6E
Message-ID: <CAAQ7Y6ZvDyeJjUYbd+UasUhPcGK=pVHTNszRBwtZgKw2NaUFNA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: dell-dw5826e: Add reset driver for DW5826e
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. I add the sysfs ABI documentation in
Documentation/ABI/testing/ and fix other issue. they include it in the
v3 version of the patch.

Armin Wolf <W_Armin@gmx.de> =E6=96=BC 2026=E5=B9=B44=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Am 10.04.26 um 11:37 schrieb Jack Wu:
> > If the DW5826e is in a frozen state and unable to receive USB commands,
> > this driver provides a method for the user to reset the DW5826e via ACP=
I.
> >
> > E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/pldr
> >
> > Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> > ---
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
> >   drivers/platform/x86/dell/Kconfig             |  6 ++
> >   drivers/platform/x86/dell/Makefile            |  2 +
> >   .../platform/x86/dell/dell-dw5826e-reset.c    | 83 ++++++++++++++++++=
+
> >   3 files changed, 91 insertions(+)
> >   create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
> >
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
> > index 000000000000..52002578ed68
> > --- /dev/null
> > +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> > @@ -0,0 +1,83 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> > + *
> > + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/device.h>
> > +#include <linux/uuid.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
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
> > +static ssize_t pldr_store(struct device *dev, struct device_attribute =
*attr,
> > +                       const char *buf, size_t count)
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
> > +static DEVICE_ATTR_WO(pldr);
> > +
> > +static struct attribute *palc_attrs[] =3D {
> > +     &dev_attr_pldr.attr,
> > +     NULL
> > +};
> > +ATTRIBUTE_GROUPS(palc);
> > +
> > +static int palc_probe(struct platform_device *pdev)
> > +{
> > +     if (!ACPI_HANDLE(&pdev->dev))
> > +             return -ENODEV;
> > +
>
> Hi, please check here if the _DSM method exists using acpi_check_dsm().
>
> Thanks,
> Armin Wolf
>
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
>
