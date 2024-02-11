Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6DA5D8E4;
	Sun, 11 Feb 2024 20:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707684699; cv=none; b=Cq8nSoCb7LXsrbih5pvrbE8KLgpE0BVXuXYVs6sIjvxf6HxX9634g5HknZUjh9DtDmqNuKDohRXaJSEHYvtkID2lGipCf4Cj1hrCQ+THiorHiu2/1XBK2rBqSM9wnOUrZ230TmlyndMkRo7E7SmQilhsH4b51vsEGAMc/AdUWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707684699; c=relaxed/simple;
	bh=CIElKw+z06Pdsu4fkYlY/n6HWaZ+cbA2k98ips1ekVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxBxmEoVXfSF1Cm1JAK3AEUbgAK4B70x76dr5N/JZ+bWXPiahjEURqtSrFtZCSr4/OrYYpLcT+MmOMDtlowoI06+patx+bRVzsm6z2vRCQNPhg6tycJppjwH5cSTNcPwmigljHUkoHz5dNhcsKFN0itaEViBSd6nxnHxEcJ+rSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fV5/4WTL; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fV5/4WTL"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3566c0309fso299719166b.1;
        Sun, 11 Feb 2024 12:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707684696; x=1708289496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vfTY4s1kp8rGWonG5tuUYS2FDi1EQ7SmfmNR8zlibc=;
        b=fV5/4WTLsuKlnur2gVTUzJYShe+AlEX5yTnwsczhBU/PGVVEWoGt/aFEfUfeVTxyBq
         tK3c0aWBvcK9gDIy+z8flMXPF6Yjq9iORwivYMdETttCvuDQFR/IVDsP0wN0K624VIPo
         gm+hijrjaje7R6AI1wopYxLRRoE0R4VAvq1ipS1W9H3eSkdD9sbXq/5wL5CAM4Y9GV+W
         CQ8j27jclaF5y0TmKoPOF0ong+CZAss+V2wlfuSspUOwxHznFh30+/YWWOo3ElMtts/0
         QP1lFTwdAb33kVKb54scNVTnHaHLViK/0bWx8mqVcVHQk/xpW09Alezd5aSPDpxdQWj6
         DsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707684696; x=1708289496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vfTY4s1kp8rGWonG5tuUYS2FDi1EQ7SmfmNR8zlibc=;
        b=VIu5n/bSJpn3YBmsFgosAwGlXrBN/j78UFd2U2lNUz/HpIV6Df2ubXc8V931i1K75c
         4JFMa21Ecynb555zF8DzlE2LY+pyMYQdfaS3sGKX7Nan2lJ0Npk7j2HbiuoZMcSJizoe
         oOc++wlxZ9qEUUXbugFhvGGi5GUz2NjGHCxjO/e5nqAqY2YgopJZrgdnjKE0gtR9JZrZ
         WAiuu7tq5uf61HAhklcRmfJq5ms3vsh06hL7Th47kiTsEtya1hOyn0Pfo67dIoaK39IL
         GhE3oLJbGUB1Ufh5NapEG7F2MfK0Kh0DzKyb8/l+OGNb89YQFczHTzvt5mAPjZvsv5B9
         aQ1A==
X-Gm-Message-State: AOJu0Yy6yl9MECwm39n3fLRfYrEiM9akHxxRkkhIYmVNZT2xg9NQNM9T
	0rW2VW5YHV/P3nBiTyQ4fGmLfPkqxL4sI+ArJCfWTBykuf85rodYUb//FtVl1/ol4UIU5yBwns1
	3jvv2hAndcifNfqpy+Oiu4Ehoh9g=
X-Google-Smtp-Source: AGHT+IF9myHOjHSTslwV9fgXhbqRAJXJKwyk+8mOot5o7L7h3n+3WZY6nrXr175Zc+08NFftlwK+2V17gENXZIaTNbk=
X-Received: by 2002:a17:906:6606:b0:a35:d634:ed71 with SMTP id
 b6-20020a170906660600b00a35d634ed71mr3421555ejp.23.1707684695829; Sun, 11 Feb
 2024 12:51:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240211195307.158956-1-hdegoede@redhat.com>
In-Reply-To: <20240211195307.158956-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 11 Feb 2024 22:50:59 +0200
Message-ID: <CAHp75VdSWwntsEh5xBz3jzXGi_QRuaRhcSs1-MwG3QYHW=wMtQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Add new MeeGoPad ANX7428 Type-C Cross
 Switch driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 11, 2024 at 9:53=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Some MeeGoPad top-set boxes have an ANX7428 Type-C Switch for USB3.1 Gen =
1
> and DisplayPort over Type-C alternate mode support.
>
> The ANX7428 has a microcontroller which takes care of the PD negotiation
> and automatically sets the builtin Crosspoint Switch to send the right
> signal to the 4 highspeed pairs of the Type-C connector. It also takes
> care of HPD and AUX channel routing for DP alternate mode.
>
> IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
> things look like there simple is a USB-3 Type-A connector and a
> separate DipslayPort connector. Except that the BIOS does not

DisplayPort

> power on the ANX7428 at boot (meh).
>
> Add a driver to power on the ANX7428. This driver is added under
> drivers/platform/x86 rather then under drivers/usb/typec for 2 reasons:

than

> 1. This driver is specificly written to work with how the ANX7428 is

specifically

> described in the ACPI tables of the MeeGoPad x86 (Cherry Trail) devices.
>
> 2. This driver only powers on the ANX7428 and does not do anything wrt
> its Type-C functionality. It should be possible to tell the controller
> which data- and/or power-role to negotiate and to swap the role(s) after
> negotiation but the MeeGoPad top-set boxes always draw their power from
> a separate power-connector and they only support USB host-mode. So this
> functionality is unnecessary and due to lack of documenation this

documentation

> is tricky to support.

...

> +/*
> + * meegopad_anx7428.c - Driver to power on the Analogix ANX7428

Keeping a filename inside the file is a burden in case the file gets
renamed in the future.

> + * USB Type-C crosspoint switch on MeeGoPad top-set boxes.
> + *
> + * The MeeGoPad T8 and T9 are Cherry Trail top-set boxes which
> + * use an ANX7428 to provide a Type-C port with USB3.1 Gen 1 and
> + * DisplayPort over Type-C alternate mode support.
> + *
> + * The ANX7428 has a microcontroller which takes care of the PD
> + * negotiation and automatically sets the builtin Crosspoint Switch
> + * to send the right signal to the 4 highspeed pairs of the Type-C
> + * connector. It also takes care of HPD and AUX channel routing for
> + * DP alternate mode.
> + *
> + * IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
> + * things look like there simple is a USB-3 Type-A connector and a
> + * separate DipslayPort connector. Except that the BIOS does not

DisplayPort

> + * power on the ANX7428 at boot. This driver takes care of powering
> + * on the ANX7428.
> + *
> + * It should be possible to tell the micro-controller which data- and/or
> + * power-role to negotiate and to swap the role(s) after negotiation
> + * but the MeeGoPad top-set boxes always draw their power from a separat=
e
> + * power-connector and they only support USB host-mode. So this function=
ality
> + * is unnecessary and due to lack of documenation this is tricky to supp=
ort.

documentation

> + * For a more complete ANX7428 driver see drivers/usb/misc/anx7418/ of
> + * the LineageOS kernel for the LG G5 (International) aka the LG H850:
> + * https://github.com/LineageOS/android_kernel_lge_msm8996/
> + *
> + * (C) Copyright 2024 Hans de Goede <hansg@kernel.org>
> + */
> +
> +#include <linux/acpi.h>

+ bits.h

> +#include <linux/delay.h>
> +#include <linux/dmi.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>

...

> +#define VENDOR_ID_L                    0x00
> +#define VENDOR_ID_H                    0x01
> +#define DEVICE_ID_L                    0x02
> +#define DEVICE_ID_H                    0x03

You use word (16-bit) access, why do we need to know these?
Just define them without suffixes (and if you want add a comment that
they are 16-bit LE).

...

> +       usleep_range(10000, 15000);

fsleep() ?

...

> +       /* Wait for the OCM (On Chip Microcontroller) to start */
> +       for (i =3D 0; i < max_tries; i++) {
> +               usleep_range(5000, 10000);
> +
> +               ret =3D i2c_smbus_read_byte_data(client, TX_STATUS);
> +               if (ret < 0)
> +                       dev_err_probe(dev, ret, "reading status register\=
n");
> +               else if (ret & OCM_STARTUP)
> +                       break;
> +       }
> +       if (i =3D=3D max_tries)
> +               return dev_err_probe(dev, -EIO,
> +                                    "On Chip Microcontroller did not sta=
rt, status: 0x%02x\n",
> +                                    ret);

Why not use read_poll_timeout() / readx_poll_timeout() (whichever suits bet=
ter)?

...

> +static struct i2c_driver anx7428_driver =3D {
> +       .driver =3D {
> +               .name =3D KBUILD_MODNAME,

Strictly speaking this is an ABI and we don't want it to be changed in
case of filename change. Personally I _always_ prefer it be open
coded.

> +               .acpi_match_table =3D anx7428_acpi_match,
> +       },
> +       .probe =3D anx7428_probe,
> +};

--=20
With Best Regards,
Andy Shevchenko
