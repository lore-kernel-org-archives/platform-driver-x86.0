Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3E13A5E89
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 07:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692671; cv=pass; b=Pl2GdPlB4yZld9WW9OBnOGdcjOSEriaFQOHTrhvbhyLfHUvV5n0/YBxY+aX+WTKDwJO3AmHPjnelQL8km7jUuscBIQ+EPzHP9lXdMmE9RhD9UtCOY1PdjzmaRLzEZbJYDPNbKxkrZmVdzgDcr1PLp5SzlrfmALFxlZ0O06BQQ78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692671; c=relaxed/simple;
	bh=ZJ1FkvzI6zza8xyC6FxOr6OHEAYI5qXy09pnrFMbKRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCAsOVr2gWk5Ziu/BboV0i8kEBHYxwkmubfAy90yIxaeEin36/5Gbw9QeHSKdMIWdagxhoTLPXXMx5DWq3zkev7IRZuXMvIn7qnk7nl85KyWV56LhyPGsqWxuB5uY13FMnij1ybfB652ZGv6tM4expSUG1kQGyYD7kvGZKy42DI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF8lOKpz; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF8lOKpz"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c477a3278so9372271d50.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 00:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779692666; cv=none;
        d=google.com; s=arc-20240605;
        b=bVN27HXiskHEsnrj+EpxZc6Xi809CHeIM5FfJY1APuabv5tm/81MaE/215lZmux5uM
         T7aJDQgU1K5w9ttQqHqgdhmPDeskFwRhxv/vmEoPoB0466qI2EaZxfZNwk5z9Qwo3E1+
         r0vphCr9bpEUnvH++kJf5dMC5Wu8kjuOvpD+Pm1SZt6Weyfw4+DGDw7RZcCG3hIyddGF
         jRGDADHZtRP1GBRizXtn2YPQ2RggucJpf9lDMNAJf46TH8XBy5ed74QIDZDiNGNXhJDG
         woiCtou2fviDcyOSZT++kxo7tBjXlxWfESSDEjwB1d920Kj1eSSsp0B8WQHdx7Sysakv
         WSMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6gDM58kAG5/Qqd/yVoUzv246r2dG8/4aBEwTYq29I6U=;
        fh=Ybp8jKvnu+2o5D6tE01lIxaYHwpaksnsa1nyDE4exPs=;
        b=bfmoQkc5WRO3EsN6yDO6EALVtj5Ijzs4MUEFTnyw7dAg5DvzW5v0sO3ciRCyn5KYHB
         hPcXTEqmefFSiL/5Ok2ebZJfDmmGSpkA38h4Q9aaFMnKhiJmmHqnkEfYdkDAtLIxLWyC
         47SOTKagnKaT+a4ZY6/UX/gaJipX/fPRWTtv4pLR8P42oKCJloMDek5xsYWsyDV5xNTj
         /aPmoWfjDVHLDpjDP4aJuI3Cf1S+rWPE+YzvcxjLm7AJNu6xOJk0UxNkO0lJqfRJAXMf
         jovoRXEXzO+K3whHs4W6EbH999Iz1CJuRbzC0j9PY6CJWH/hu2nxgXeF3idQAnkr58Fw
         +u4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779692666; x=1780297466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gDM58kAG5/Qqd/yVoUzv246r2dG8/4aBEwTYq29I6U=;
        b=JF8lOKpzFPJZHmfGLeUlztahCR2Bg0HosG8PRSaXPb5MI3XOyNH4/s2++v6EtzbtWv
         yTX3LqoxDIDsl5q2mmWRzUZdOEUqbEHHDYECqdUNI5AQSEYyafO5vPxG/Q6MWUOFQ5IK
         338J2EbuF6i1TlwEw+D0fvl3CJCkOHTGqyAUUsQiGYA3/R11GpLS0IJhoOHbS67eBYf2
         LO7DIncIyUO6mBeCy+V/91FC+bnmkkmQjq5cFm8QUwIO8uobe5asNRf5yMJDSj1wbiRk
         cbX/Za1qkvclutUffM5yNeGmxcGWu6+VV5lTp82Xj1R7ytp6hxlrcWDHt+S8Ho7p8Xfj
         Oj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779692666; x=1780297466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6gDM58kAG5/Qqd/yVoUzv246r2dG8/4aBEwTYq29I6U=;
        b=KmnZU5+yaIacAsE0kU9Ms6IZfwe5jLs5qAtF0WQJpp/sE/mryxcaq5SaQhIIdJuXZh
         THXEZj4IQ8HpgsW3bJOjy9iXmQ8EijkyF3A2cuiwAkFV4m3O4pkRLnfTTVcU9XQU0iY3
         sD6J8yBa+70dkIcfuW5Up1T/3rnTJoDs6QxNkuYnWFDGAYlP3QFrUtcZlzQm6CGooSO6
         BmqF+UHZpdyPBwr+0zp3QGTJNnn033Xq4DPAbGnZsZT9BllCssMqZhytZpVIXp8ntF3I
         jActZ8ZfRa01eYKodX+yhKPwdTA8QWCwlT/l6te3KNs3lTsRGmcgXVVGfJsOUdoRuyrZ
         XUXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yCHuKDoVcuE2XAIKY3mo9nhPpnTGiUYFig+kDI6QmI6goaxI6dW8ZBdaTUuANdWPFyZjY2UxvBqkVRjNKA/hRp9ra@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/XO6aAMg5Vt8Joep6y4kTrPuMtBD/+oj5ZKwJZzBnjgSGl3kW
	zYJBUKlfhCc1URIRu2mCk3SOUCz/763ldrzqYPj7SzJULpS58BDjJ1OhqmV2kTM2XvibldwZEou
	s031mLtmhI8WAyo9WnEtSq/F4ZHrh9d4=
X-Gm-Gg: Acq92OH5WKwINOuQ/UD/hLEXOLw+y/6gXTF2vPvCfyn1aa0raRmcPd3b5dYEgR9o8Kf
	ktzTOSn4Qm5InuqcgKf2mj27I4Tcio+xDrcBBiZXR9O3BVy5a1Yt+LRWZnYodO5xYSaZHEB5sWI
	z0j0oY8dsMRnk3H8DwhBcRuS87b8+dBsTdoXVfAB6q8FhYSZNDGVowiilyRpqmsVVSr3/18ABCI
	9w9Amo8JdpFVJmBMZUsokWXCzK02u0hd7VfsqTZ1tMWifcoEGR1FnYzANP6/vOrMfJVUm2jzYl0
	YevsrR0=
X-Received: by 2002:a53:d054:0:20b0:650:789b:a3c with SMTP id
 956f58d0204a3-65ec98aac63mr10266428d50.35.1779692665953; Mon, 25 May 2026
 00:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504013243.2445940-1-jackbb_wu@compal.com> <8269a3d8-abac-8837-e89d-11b9a14aaed1@linux.intel.com>
In-Reply-To: <8269a3d8-abac-8837-e89d-11b9a14aaed1@linux.intel.com>
From: =?UTF-8?B?5ZCz6YC86YC8?= <wojackbb@gmail.com>
Date: Mon, 25 May 2026 15:04:14 +0800
X-Gm-Features: AVHnY4IHiv-JgLtY4qVkcT2SFYca7TGDlLqgHfYCNI8qeZ1s8c53LUWe0yUynwE
Message-ID: <CAAQ7Y6a2-EsJ9b0ZL=+3EB+C-=Vf93+4YhRdotLzYYzvjHbQww@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] platform/x86: dell-dw5826e: Add reset driver for DW5826e
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <superm1@kernel.org>, 
	Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've fixed it in v7.

Thank you.

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> =E6=96=BC 2026=E5=B9=B45=
=E6=9C=8819=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:20=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Mon, 4 May 2026, Jack Wu wrote:
>
> > If the DW5826e is in a frozen state and unable to receive USB commands,
> > this driver provides a method for the user to reset the DW5826e via ACP=
I.
> >
> > E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset
> >
> > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> > ---
> > v6:
> >   - Use same define for the DSM check
> > v5:
> >   - Use BIT() for the DSM method
> > v4:
> >   - Fix version of the ABI documentation to 7.2
> >   - Add include linux/types.h
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
> >  .../platform/x86/dell/dell-dw5826e-reset.c    | 93 +++++++++++++++++++
> >  4 files changed, 110 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e=
-reset
> >  create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
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
>
> It's already May, and 7.2 won't be out even in May.
>
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
> > index 000000000000..d37c6a66c4c3
> > --- /dev/null
> > +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> > @@ -0,0 +1,93 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> > + *
> > + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/bits.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/types.h>
> > +#include <linux/uuid.h>
> > +
> > +#define PALC_DSM_FN_TRIGGER_PLDR    1
>
> Place BIT() into the define instead (I think I mentioned this already
> earlier), it's used by all sites so there's no good reason to keep in
> inline with the code (AFAICT):
>
> > +     obj =3D acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM=
_FN_TRIGGER_PLDR), NULL);
>
> > +     if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM_FN_TR=
IGGER_PLDR)))
>
>
> --
>  i.
>
