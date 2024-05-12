Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274421E49B
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 May 2024 19:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715542571; cv=none; b=BsQMKAWb4AEVHtvxbUgeZRhb8eqG7mB+LCxdaLhdQjpyBep8YG4xqTzE0ih+3LKbxqcHvk/b8LZx0qX3K1JC9J0TCEzKMd6RK7Hzr4wiJVgwvuX7KLNvg7F3dRk5/DDPiLvq8xNCmbgUznTfk19ziKuvb09Q+/+i9nTpIDkeA14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715542571; c=relaxed/simple;
	bh=2eILFuajflMHfXUL3t/MENRcTA2Rc23w5VBI9sZRHko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNpfZE5nvCLbvyfGtrsjeHNvAOjyKnbL4oCPdAU/Qguxt4sv0h1tL4fTnRh9y9YrvrQCWxtrWu606Y+bzDtom+MgjDj8kx2YHuV7aYxI1ceAVZL629YFwsz28clTeOqldkafwn9F1bAie7MiMXNDOQ/K+H9+Xfs4e6xp89s833o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPhpBz9f; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPhpBz9f"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5a5cb0e6b7so140318866b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 May 2024 12:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715542567; x=1716147367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbsFuHpoKnLNKDg9T9p0TcWVacVLu1ZlFOhi2dDrwa0=;
        b=bPhpBz9fj8aBBdYj+VZwcu/+p2CdXD1cD22ku0kWMppMZ8KhNR004Gua/Pn9N2BRTz
         hmtMYdJ6vzcZzf3unAul6VD1vHM6jZ39lPa7JHTLcW2onHfYVR726SfEoD0XUlK9T/N5
         mToROD6tIa1p3dJhzTnPpmFW49ZAYyyI04se4Ai8HnN77ME99SepflqbBoPevqvYilag
         vFe4kfbJ+51iLbEqq/KwPi1UGuW5MSgUm37xOeS+ejxVZ8qx/RSbVaPZxxENynLwtoci
         15IF5Ll+7JbCVcVlT7yAVfPh/FvSnVQzzQeiZa83C7QbfranZH6jX9C3iLA0lMWF0gRX
         xCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715542567; x=1716147367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbsFuHpoKnLNKDg9T9p0TcWVacVLu1ZlFOhi2dDrwa0=;
        b=oUiiF2LmG0MmaBDcvxMI6QLxjrdf4bN7t1VMaUXbpmIcI/Iq8HRigsVZ3Xe2JKUVhB
         2ZLTi70Zss+kgxIz2eG0/KWrOxkWq4TBv3T0VVEbXPAJrz9KUD7ppuVx4+KPcF5ZRdqC
         7C6xu8remAyY/nEf74cBWG7GDWirJn3g9Pc1AhBuNCVhPzanlEJkNkuuYRlap7+65Q6n
         QD+UCEb6sRYoFa0KnWYnWubByTthUG6f60PGA+jO18uFWUYFHv8YAqkcCqRM6Ppetqfb
         7mTAxjnyKHPmhUyBV8pKhVFVBFHixj/tvOr7e7j6wV0WMjaYulaumR2KKpgiqQTIPRvY
         rGyw==
X-Forwarded-Encrypted: i=1; AJvYcCXhMmULg7J27/0WVuoqLy3AW0D1B/MEqIfQSARtu2h9FnRXWi5pk+uEFBpkzvfrZFQ26P9uDnGtCgCSjZVSr2PPzdpYiwwlD88AgiOre5hPys/+mA==
X-Gm-Message-State: AOJu0YyTc5XjS144rHdcxkFxaFxrouyeVibPoYKJ9PfR63PKeDso4Pmy
	mS2OOZis5SVQqJh0BvMa3dbywzcD4nWeVSe5TKY44iskxWTDpwuq0p5PlSQWWiP4PtRDdDpgq+e
	GV5sEzF0KEntZSfZTQz9jPXwtYRc=
X-Google-Smtp-Source: AGHT+IHYDqJTEot6oXtzY2eUKwwZWnDBPMa81xRN2DMuxHKU4Sr7trbSE2rUG171x3cU/xrR5uSanMJ0rIxhi/WGf0c=
X-Received: by 2002:a17:906:3b50:b0:a5a:7a1:5d9c with SMTP id
 a640c23a62f3a-a5a2d66879bmr478757166b.62.1715542567473; Sun, 12 May 2024
 12:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240512162353.46693-1-hdegoede@redhat.com> <20240512162353.46693-2-hdegoede@redhat.com>
In-Reply-To: <20240512162353.46693-2-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 May 2024 22:35:31 +0300
Message-ID: <CAHp75VeMT+Pcvf-T9-iVqchSx1tppaeORWMmFhP66ZMg-ybmPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: Add new Dell UART backlight driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2024 at 7:24=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Dell All In One (AIO) models released after 2017 use a backlight controll=
er
> board connected to an UART.
>
> In DSDT this uart port will be defined as:
>
>    Name (_HID, "DELL0501")
>    Name (_CID, EisaId ("PNP0501")
>
> Instead of having a separate ACPI device with an UartSerialBusV2() resour=
ce
> to model the backlight-controller, which would be the standard way to do
> this.
>
> The acpi_quirk_skip_serdev_enumeration() has special handling for this
> and it will make the serial port code create a serdev controller device
> for the UART instead of a /dev/ttyS0 char-dev. It will also create
> a dell-uart-backlight driver platform device for this driver to bind too.
>
> This new kernel module contains 2 drivers for this:
>
> 1. A simple platform driver which creates the actual serdev device
>    (with the serdev controller device as parent)
>
> 2. A serdev driver for the created serdev device which exports
>    the backlight functionality uses a standard backlight class device.

...

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

How is this being used?

...

> +#include <linux/acpi.h>

+ array_size.h

> +#include <linux/backlight.h>
> +#include <linux/delay.h>

+ device.h // devm_kzalloc(), dev_err() et al.

+ err.h

> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/serdev.h>

+ string.h
+ types.h

> +#include <linux/wait.h>

> +/* The backlight controller must respond within 1 second */
> +#define DELL_BL_TIMEOUT                msecs_to_jiffies(1000)

...

> +static int dell_uart_get_brightness(struct dell_uart_backlight *dell_bl)
> +{
> +       /*
> +        * Get Brightness level: Application uses this command to get bri=
ghtness.
> +        * Command: 0x6A 0x0C 0x89 (Length:3 Type:0x0A Cmd:0x0C Checksum:=
0x89)
> +        * Return data: 0x04 0x0C Data Checksum
> +        *              (Length:4 Cmd:0x0C Data:<brightness level>
> +        *               Checksum: SUM(Length and Cmd and Data) xor 0xFF)
> +        *              <brightness level> ranges from 0~100.
> +        */
> +       const u8 get_brightness[] =3D { 0x6A, 0x0C, 0x89 };
> +       u8 resp[4];
> +       int ret;
> +
> +       ret =3D dell_uart_bl_command(dell_bl, get_brightness, ARRAY_SIZE(=
get_brightness),
> +                                  resp, ARRAY_SIZE(resp));
> +       if (ret)
> +               return ret;
> +
> +       if (resp[0] !=3D 4) {

ARRAY_SIZE() as you used it in many other similar places.

> +               dev_err(dell_bl->dev, "Unexpected get brightness response=
 length: %d\n", resp[0]);
> +               return -EIO;
> +       }

> +       if (resp[2] > 100) {

(see also below about this number)

> +               dev_err(dell_bl->dev, "Unexpected get brightness response=
: %d\n", resp[2]);
> +               return -EIO;
> +       }
> +
> +       return resp[2];
> +}
> +
> +static int dell_uart_set_bl_power(struct dell_uart_backlight *dell_bl, i=
nt power)
> +{
> +       /*
> +        * Screen ON/OFF Control: Application uses this command to contro=
l screen ON or OFF.
> +        * Command: 0x8A 0x0E Data Checksum (Length:4 Type:0x0A Cmd:0x0E)=
 where
> +        *          Data=3D0 to turn OFF the screen.
> +        *          Data=3D1 to turn ON the screen.
> +        *          Other value of Data is reserved and invalid.

values
are reserved

> +        * Return data: 0x03 0x0E 0xEE (Length:3 Cmd:0x0E Checksum:0xEE)
> +        */
> +       u8 set_power[] =3D { 0x8A, 0x0E, 0x00, 0x00 };
> +       u8 resp[3];
> +       int ret;
> +
> +       set_power[2] =3D (power =3D=3D FB_BLANK_UNBLANK) ? 1 : 0;
> +       set_power[3] =3D dell_uart_checksum(set_power, 3);
> +
> +       ret =3D dell_uart_bl_command(dell_bl, set_power, ARRAY_SIZE(set_p=
ower),
> +                                  resp, ARRAY_SIZE(resp));
> +       if (ret)
> +               return ret;
> +
> +       dell_bl->power =3D power;
> +       return 0;
> +}

...

> +static int dell_uart_update_status(struct backlight_device *bd)
> +{
> +       struct dell_uart_backlight *dell_bl =3D bl_get_data(bd);
> +       int ret;
> +
> +       ret =3D dell_uart_set_brightness(dell_bl, bd->props.brightness);
> +       if (ret)
> +               return ret;
> +
> +       if (bd->props.power !=3D dell_uart_get_bl_power(dell_bl))
> +               ret =3D dell_uart_set_bl_power(dell_bl, bd->props.power);

    return ...;

> +       return ret;

  return 0;

?

> +}

...

> +       props.max_brightness =3D 100;

Isn't it the same number (semantically) that is used in one of the
above functions? Perhaps define it?

...

> +       if (IS_ERR(dell_bl->bl))
> +               return PTR_ERR(dell_bl->bl);
> +
> +       return 0;

  return PTR_ERR_OR_ZERO(...);

...

Haven't noticed MODULE_DEVICE_TABLE(). Is it supposed to be
autoloaded? If so, how would it happen? Ah, okay, you are using
MODULE_ALIAS().

--
With Best Regards,
Andy Shevchenko
