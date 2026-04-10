Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD693446B7
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814080; cv=pass; b=uC7znkRithtQW7kbHWXmW/6BgW8PjFp4twEHH1J/4xrbKBkEco1si8B6tMNcE1BnluT+cKdsph5sAW0goDqC+DSr8NgT6rVUKKXnUGKaLqkeq3Uu6EAP1i88dwzkLMILQhzYR/J2lv8PV9wT6i/GIcqYRNJct2qXYJNkF7GnIYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814080; c=relaxed/simple;
	bh=uQfKJlqpQuvJSFv0/Pb4aEkGdSkB1YUME2B/NiwzfYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l39YjwrjD9yaR/nvd0CLVLUY+G+OyJ4g6BGJK43POmL2YufdtRNbdW2WbED1N6y5UGK2iU3uArDuietvkKYJDHF4tBr19k8NUJlBTzbXSFpWpewkPxmvZDDvmLyqMeiUfPw3EWMgTzljeKg9OKL4lI4a63IKbbX5w5XuzWUmVB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoSl4sWF; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoSl4sWF"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-65003f40a22so1634857d50.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 02:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775814078; cv=none;
        d=google.com; s=arc-20240605;
        b=GSHAPr1BYP7oeZ3dC4EsHjaV3Fl/wdqUNEOmCOS9JnKv9Evww5C/MtDBSouMQiuQ/I
         xdBlYmnbNzo7tHlNevh54flGoomgWfz50Ax4OJWE7Wkpcnopk+FPYkNXVgdTWBZGwZTq
         t0HG/uzPBrkm1vzBmRgPPJ2KeHqdQa+nzlEmbisPxBWeSUtC/VT38NGi1zPrZQVuOiKA
         L2HVuyv/EAbBmXk6rvE+XBrTYSp2n1c13WjNPQjUsYBPAEmLVwKz5ZkI58rvnHRBfHUx
         i9vEr7mB0BE4pp8hRtTpoPS2Vvu/ULWSVQGyuDyKO/2mM9oXzoS6EnF/X34y7sYdRKz1
         BYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pbNJIdFZyx2rbu+GZgRvfoFkL0dxcLSjqZvW26musII=;
        fh=KNWplc12WLLWFhrRrCp+fKtBkFHN/t99Ax6TivVAT7A=;
        b=TNlEfxqrofwXYKOaAcH6ikHdyZraP77a1/mJXW7+mA8Cg9HA8j+60tVR4zTrBn1ULT
         p1/jneEu8pDKb9W+FG+3ROXYaKOq8Vxlpgr/UBdxNimjGvuwCGf9yGiqcSsKvoUHCVFn
         nUN4wNOEUGHZTiY+NgBjBJI/NajNbope4dmA4BteyqhTP5pUWvoG32Qa0Kf61fQF/wks
         G1TpLp6GOOnocuJiY7vZjRCFHsblqxolAmnJApV6PhrDrd+vxSjzNyA5csvlryupMcdY
         DnrGJQtlDBhr/qAj/9maQ4hd19oAwSWhLd+UvB3nTaSTZY/ut80Hz9NHrl9yOhDlJqAM
         dGdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775814078; x=1776418878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbNJIdFZyx2rbu+GZgRvfoFkL0dxcLSjqZvW26musII=;
        b=LoSl4sWFWRCaCklTf15Rm6S0Kpf/6SjlPEfmZ52C1TZH9grx7Odc6UnAeKLCmmTJSz
         pAnn1ishqoIP1K8xtHwf8Q36zc2l+ig5YlxtzuX0mhBj55yAW98c0qSqblDaq3XSQFoi
         wUgWhLPnibJ3ZSeqye/hB1VTJpWhesf+82i6No2z7tFj4GH+gN8Q1TCSlKpTtktdWzwL
         MF8ofjNG4nyLd9dLMQXMdCVRq+ZTOzesUO+Rl5GqgYR1WRcim7gNF/8dqcAL9YrfoT/X
         v98f8PDvqfShP1U2H4k8r8cwdeSC1haJnTWbPF46Jxrivihyks1tP8+jHHv7LR/yX5i5
         efog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775814078; x=1776418878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pbNJIdFZyx2rbu+GZgRvfoFkL0dxcLSjqZvW26musII=;
        b=nTMB2tcNtzP7S1mwAYReTEaje+GoRiCnGI1bFwvOhDoMwdPOAccX+Xe6HRAp8pMkCu
         NTj2s9ws5GsRa1q3ipjMwyxMrowUguitGBd38VLqVICZH5fiJcmgzwPEVLbyH3ifF2LV
         OjYL1Y1XNkmS9xLx1zFVEwQZrdrtJsS8M7hEaqJSG/O7bwJ4nRkiVQGWA2zNpu0o7Cl7
         eG/whAIcHdSWKjE1vKbH5yv9nx43H7cVYYKlPkAy49zZSY2gtIfiUk/wmQOjAfIShr+7
         PUjf8yFtnNG89RbYfZwu278kuMpJ58i47awYe4QrADfTQ7G7VygeDx6qFZGHGDqFRVEp
         he5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTiGMuUthqF8s6AbKcUvL70iXZi/XoNwK9nS3+/7y60qrEJsP2isxA9Eo3VzelZNXs7+WMgecGHB1y18/gKxBf6lOD@vger.kernel.org
X-Gm-Message-State: AOJu0YyD5Ub+LDTQ0EFGnt7bfoi3xcldxT/sAcJ0RYjLWoR8Ocxzba//
	Bhblmm6phi+qtaibRzrNfnnjD6GWuzlqGZFZnciK8yn1eaEpi4zHnSPl6B0fufwR7ra+6PpI9QP
	sp9NKh3dgK3QOPLC+P1h4lMK5msJv9V9jh3x7
X-Gm-Gg: AeBDietrQZv0824Mt2XIY58Og2tHytdb2NqTB82Z34RqcRz1HfCULBtmdvU1WpOQk+E
	wyLKQM6ArHHrYyl44Wds7qrbx39Aazb+umwJGiKuB3nN0iJUkzpiR/lGyvur+y4DBNQj+6Ftco9
	aGEgz9kHWnTDMgvQnjheVO+hCj2qwpBCKAhMXk1uPg9KB1IoYfObmmidX3PTH84a75prDlIe36c
	tGO1kAJXi2aIMTexPCVdVcJKBBLAgOkPiN5aMzW8zWPlaWDkDp7zMPhAS1B56FneuKj5asLGvm4
	XX//YlICNCn4RI6+mwpqM4oUiI4c1ROp+Kafn872
X-Received: by 2002:a53:4c09:0:b0:650:323f:38ab with SMTP id
 956f58d0204a3-65198b46eb5mr1530924d50.34.1775814077787; Fri, 10 Apr 2026
 02:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408111738.232040-1-jackbb_wu@compal.com> <cffd3116-fbf3-06f4-430d-7924b43b3737@linux.intel.com>
In-Reply-To: <cffd3116-fbf3-06f4-430d-7924b43b3737@linux.intel.com>
From: =?UTF-8?B?5ZCz6YC86YC8?= <wojackbb@gmail.com>
Date: Fri, 10 Apr 2026 17:41:06 +0800
X-Gm-Features: AQROBzAi9dn4G4RglmPnEoa8nKZ3g96zDp12rXoTNrkXeMfbbJG9_MDpR9VjBN8
Message-ID: <CAAQ7Y6YGX-pycHrVAi6mLvAHAjizU8aQ22gC-ivWPsfpsxNXKg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: dell-dw5826e: Add reset driver for DW5826e
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

About good place:

drivers/reset/ is for the reset controller subsystem
(reset_controller_dev), which provides reset signals consumed by other
subsystem drivers.

This driver doesn't fit that model =E2=80=94 it exposes a Dell
platform-specific ACPI _DSM method (PALC0001) to userspace for
triggering a PLDR reset on the DW5826e WWAN module. Since this is a
Dell-specific ACPI interface that only exists on Dell laptops,
drivers/platform/x86/dell/ is the appropriate location, consistent
with other Dell platform drivers

About other issue:
I fixed them in v2 and upload It

Thanks.

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> =E6=96=BC 2026=E5=B9=B44=
=E6=9C=888=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:46=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On Wed, 8 Apr 2026, Jack Wu wrote:
>
> > If the DW5826e is in a frozen state and unable to receive USB commands,
> > this driver provides a method for the user to reset the DW5826e via ACP=
I.
> >
> > Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> > ---
> >  drivers/platform/x86/dell/Kconfig             |   6 +
> >  drivers/platform/x86/dell/Makefile            |   2 +
> >  .../platform/x86/dell/dell-dw5826e-reset.c    | 120 ++++++++++++++++++
> >  3 files changed, 128 insertions(+)
> >  create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
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
>
> Another thing,
>
> I wonder if this is good place for this, as kernel also has drivers/reset=
/.
>
> --
>  i.
>
> > +
> > diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/p=
latform/x86/dell/dell-dw5826e-reset.c
> > new file mode 100644
> > index 000000000000..28865a123c63
> > --- /dev/null
> > +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> > @@ -0,0 +1,120 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> > + *
> > + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> > + *
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/acpi.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/fs.h>
> > +#include <linux/uaccess.h>
> > +
> > +static guid_t palc_dsm_guid =3D
> > +     GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd=
8, 0xfd, 0xfe, 0x59);
> > +
> > +struct palc_dev {
> > +     struct device *dev;
> > +     acpi_handle handle;
> > +     struct miscdevice miscdev;
> > +};
> > +
> > +static int trigger_palc_pldr(struct palc_dev *palc)
> > +{
> > +     union acpi_object *obj;
> > +
> > +     dev_info(palc->dev, "Triggering PLDR via ACPI _DSM Function 1...\=
n");
> > +
> > +     obj =3D acpi_evaluate_dsm(palc->handle, &palc_dsm_guid, 1, 1, NUL=
L);
> > +
> > +     if (!obj) {
> > +             dev_err(palc->dev, "Failed to evaluate _DSM\n");
> > +             return -EIO;
> > +     }
> > +
> > +     if (obj->type =3D=3D ACPI_TYPE_BUFFER)
> > +             dev_info(palc->dev, "PLDR _DSM executed successfully\n");
> > +
> > +     ACPI_FREE(obj);
> > +     return 0;
> > +}
> > +
> > +static ssize_t palc_write(struct file *filp, const char __user *buf, s=
ize_t count, loff_t *ppos)
> > +{
> > +     struct palc_dev *palc =3D filp->private_data;
> > +
> > +     trigger_palc_pldr(palc);
> > +
> > +     return count;
> > +}
> > +
> > +static int palc_open(struct inode *inode, struct file *filp)
> > +{
> > +     struct palc_dev *palc =3D container_of(filp->private_data, struct=
 palc_dev, miscdev);
> > +
> > +     filp->private_data =3D palc;
> > +     return 0;
> > +}
> > +
> > +static const struct file_operations palc_fops =3D {
> > +     .owner  =3D THIS_MODULE,
> > +     .open   =3D palc_open,
> > +     .write  =3D palc_write,
> > +};
> > +
> > +static int palc_acpi_probe(struct acpi_device *adev)
> > +{
> > +     struct palc_dev *palc;
> > +
> > +     palc =3D devm_kzalloc(&adev->dev, sizeof(*palc), GFP_KERNEL);
> > +     if (!palc)
> > +             return -ENOMEM;
> > +
> > +     palc->dev    =3D &adev->dev;
> > +     palc->handle =3D adev->handle;
> > +
> > +     palc->miscdev.minor  =3D MISC_DYNAMIC_MINOR;
> > +     palc->miscdev.name   =3D "reset_palc";
> > +     palc->miscdev.fops   =3D &palc_fops;
> > +     palc->miscdev.parent =3D &adev->dev;
> > +
> > +     if (misc_register(&palc->miscdev))
> > +             return -EINVAL;
> > +
> > +     dev_set_drvdata(&adev->dev, palc);
> > +
> > +     dev_info(&adev->dev, "DW5826e Reset Device (PALC0001) Driver Load=
ed\n");
> > +     return 0;
> > +}
> > +
> > +static void palc_acpi_remove(struct acpi_device *adev)
> > +{
> > +     struct palc_dev *palc =3D dev_get_drvdata(&adev->dev);
> > +
> > +     if (palc)
> > +             misc_deregister(&palc->miscdev);
> > +}
> > +
> > +static const struct acpi_device_id palc_acpi_ids[] =3D {
> > +     { "PALC0001", 0 },
> > +     { "", 0 }
> > +};
> > +
> > +static struct acpi_driver palc_acpi_driver =3D {
> > +     .name  =3D "palc_reset",
> > +     .ids   =3D palc_acpi_ids,
> > +     .ops =3D {
> > +             .add    =3D palc_acpi_probe,
> > +             .remove =3D palc_acpi_remove,
> > +     },
> > +};
> > +
> > +MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
> > +module_acpi_driver(palc_acpi_driver);
> > +
> > +MODULE_DESCRIPTION("Dell DW5826e reset driver");
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("JackBB Wu");
> >
>
