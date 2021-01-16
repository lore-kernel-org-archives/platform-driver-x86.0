Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8F5C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:08:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03289224B8
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:08:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbhAPUIx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 15:08:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbhAPUIx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:08:53 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAACC061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:08:12 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id w2so7702659pfc.13
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8EQuOkwz7jw8x39WOKBjjX8/GDsC1LmhaOIHC30Wj60=;
        b=WPOABJS2y+UWtX7vOUT7YaC2CrAkykvdzhvOwL8z7VH//qg/qGmmsZbCoRQuWbnJWn
         XYjYpqjfGhSjIHm0UFsEq7o9dpp51I1JDrTqsG/JAJc7knt1BW/bYf+1uUsBguVU6w0q
         jZSsx15LzIoyPngQh+MN2aYQ3YSYCEefo4j2w7fgx53MrwQ/UOcX+FbIIjXpr2f3sQRC
         Pl8y9kOjVIZbcIa5yaWhdJW/jjOE99Qk3pGmeSsDaSQc/PxCFFhJaoMVfajZdjBKLQyz
         NSSVG4lnhnA8VhRqZijABs3fUBBoBLp9y+mgCD3sgm0SOS3AJdN5Fs8yEml0ilDBFwRT
         A//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8EQuOkwz7jw8x39WOKBjjX8/GDsC1LmhaOIHC30Wj60=;
        b=D3cGmT/CGcnAej/JiVCVPnMaQ/pVXPxAfSYu2fMWkU9hRfOAfVSzSTSwoKMJFfy8vm
         5S4YYCkObWQrfM3qjBHs+lYO4eT6dQmca2IZvizQ6z6ElM8ux8QBatvWm5gmTORk7P9u
         dS0uyt7mGGz0EIiwGCIi1L6B628+VDPALwD34W7ZPsqKSIYRN0zirDWfN/7FGDuP3JcP
         U09uikryVvEcyyD2hkr8G/SbMJG7+dnOiIDdTlU9OTroj/zxkMnZZZB+qja7c+a/CXKI
         2KSqvukhjNy775pGhPohsf5XoceACPc8l0en97kEuUwIhmEi+n45V3La34Nkur763ffe
         c0gg==
X-Gm-Message-State: AOAM532v3lR7cKk0sM8VfICBVBa00sJh83plCCAkGudbrtpjIcPHEYQi
        kGLsBEBMto4b1RYwJxseRrI7qct7VN9japhZGus=
X-Google-Smtp-Source: ABdhPJw5L/ip9UEOszLePbGVIHkyy6vuWHXbE7RgdqzCY5efNKlebiXWluFQAjecwBqO4PgFJ7IBSfbN1712rLSGkXE=
X-Received: by 2002:a63:c04b:: with SMTP id z11mr19070427pgi.74.1610827691688;
 Sat, 16 Jan 2021 12:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-22-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-22-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 22:07:55 +0200
Message-ID: <CAHp75VcSnygW5TgZePcF96uMk9et25doqxmWieMdbtaRb5hS4w@mail.gmail.com>
Subject: Re: [PATCH v2 21/24] platform/x86: ideapad-laptop: add keyboard
 backlight control support
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 13, 2021 at 8:25 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> On certain models it is possible to control/query the keyboard backlight
> via the SALS/HALS ACPI methods. Add support for that, and register an LED
> class device to expose this functionality.
> Tested on: Lenovo YOGA 520-14IKB 80X8

...

> +       struct {
> +               bool initialized;
> +               struct led_classdev led;
> +               unsigned int last_brightness;
> +       } kbd_bl;

Data structure without sense.

...

> +static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
> +{
> +       unsigned long hals;
> +       int err;
> +
> +       err =3D eval_hals(priv->adev->handle, &hals);
> +       if (err)
> +               return err;
> +
> +       return test_bit(HALS_KBD_BL_STATE_BIT, &hals);

On some architectures IIRC it returns long (or unsigned long). Is it a prob=
lem?

> +}

...

> +static int ideapad_kbd_bl_init(struct ideapad_private *priv)
> +{
> +       int err;
> +
> +       if (!priv->features.kbd_bl)
> +               return -ENODEV;
> +
> +       err =3D ideapad_kbd_bl_brightness_get(priv);

> +       if (err < 0)

Just to be sure, what positive code means here?

> +               return err;
> +
> +       priv->kbd_bl.last_brightness =3D err;
> +
> +       priv->kbd_bl.led.name                    =3D "platform::" LED_FUN=
CTION_KBD_BACKLIGHT;
> +       priv->kbd_bl.led.max_brightness          =3D 1;
> +       priv->kbd_bl.led.brightness_get          =3D ideapad_kbd_bl_led_c=
dev_brightness_get;
> +       priv->kbd_bl.led.brightness_set_blocking =3D ideapad_kbd_bl_led_c=
dev_brightness_set;
> +       priv->kbd_bl.led.flags                   =3D LED_BRIGHT_HW_CHANGE=
D;
> +
> +       err =3D led_classdev_register(&priv->platform_device->dev, &priv-=
>kbd_bl.led);
> +       if (err)
> +               return err;
> +
> +       priv->kbd_bl.initialized =3D true;
> +
> +       return 0;
> +}

...

>         if (acpi_has_method(handle, "HALS") && acpi_has_method(handle, "S=
ALS")) {
> -               if (!eval_hals(handle, &val))
> +               if (!eval_hals(handle, &val)) {
>                         if (test_bit(HALS_FNLOCK_SUPPORT_BIT, &val))
>                                 priv->features.fn_lock =3D true;
> +
> +                       if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val))
> +                               priv->features.kbd_bl =3D true;
> +               }

Okay, now I understand which you had separated conditionals (you may
ignore that comment).

--=20
With Best Regards,
Andy Shevchenko
