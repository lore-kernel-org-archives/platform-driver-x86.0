Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDB5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Nov 2021 19:47:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349139AbhKYTua (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Nov 2021 14:50:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356806AbhKYTs3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Nov 2021 14:48:29 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD895C0613D7
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Nov 2021 11:43:45 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id w1so29804813edc.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Nov 2021 11:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cHmaYybBkyX/d/8PPduk+3mHjSjdntiodsII1g8n3Rc=;
        b=l4lzwdYraZQIKH//vrm4nNGOMBNyulW+cJtYucLHy3nOVvaY3IuBC9iuRDkkaMskXQ
         ECl+aPQO5kphVr2QYXv6wNozrz0jxgzsZq/ZqEbewxo6y1mYplcAizzvknkMKffeUgNZ
         rQ50jWL5NipGkr2fowWTv1n0yKRgHwjSadYe3Dfwd/aEPRgbz6Q2EXB1fZ1q0U7WpuL+
         vlkx+DndhjzJgXsBcW5/0e+uRN5vXlEAL0rMdyExuEZMJwZ1YB5br59RYBsaPM2FZO/n
         BxcpR+TkyKfLW3chHUY+3kry+mIJ5Lfi1lPNsaZYmLnjuxSEdBEPXWK9ezxTTtluQSRE
         rfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cHmaYybBkyX/d/8PPduk+3mHjSjdntiodsII1g8n3Rc=;
        b=PxRNkC/JfKsMg1MbUyfmxGUqzcVSMLbDVYITJcj2/4W8MkThxZgopABO8qPw1qo5PK
         Xq5cWD/DBe9V/ZUOZE3Jq5B0MXuvL4u9qrNksxY+UxhLOkFLTZOSx/Uffp6kuFfuLXwT
         w+O1kdgPpf4pKL4g+33FrOzT9jRAgekpDglkn8DaocwdjuUMFanm9dQwBymgu24osKK8
         DHInGTvUAzgkXOLsQZyrbMo8y/rU9GOb67zxLk2FKBEPPKfO6w7qyb/Brs6bbcB4Dga5
         oRTUoz0aP/Sehga1b3UxOKMHVeEzDp0in5ZuCs7uJw3/6xn8Oun9E3N1+v0sn5zYgqF9
         oOoQ==
X-Gm-Message-State: AOAM531d1tef7kjD+F5vMuTmjmkt/mPLNbGLp2MuuMQpDZM22e06z3YM
        bkgiIykP9p9gB32Tvf3UeLqJ4U1CEH7ndFFid14=
X-Google-Smtp-Source: ABdhPJzG9kAoRuDxth5G+Rkpow2c3emj4InU13+RWgtzhbPUSFOSvxPfnrnlGecKwYNh3irOu4K8HC+UXZGjTKFuojc=
X-Received: by 2002:a17:906:ecac:: with SMTP id qh12mr33726858ejb.377.1637869424246;
 Thu, 25 Nov 2021 11:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20211125192618.732348-1-hdegoede@redhat.com>
In-Reply-To: <20211125192618.732348-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Nov 2021 21:43:08 +0200
Message-ID: <CAHp75VfBojmmJe-doVt1X8CvzxKh9Ut=kRALr_z3Gmx3ndtL8Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: x86-android-tablets: New driver for x86
 Android tablets
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Nov 25, 2021 at 9:26 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> x86 tablets which ship with Android as (part of) the factory image
> typically have various problems with their DSDTs. The factory kernels
> shipped on these devices typically have device addresses and GPIOs
> hardcoded in the kernel, rather then specified in their DSDT.
>
> With the DSDT containing a random collection of devices which may or
> may not actually be present as well as missing devices which are
> actually present.
>
> This driver, which loads only on affected models based on DMI matching,
> adds DMI based instantiating of kernel devices for devices which are
> missing from the DSDT, fixing e.g. battery monitoring, touchpads and/or
> accelerometers not working.
>
> Note the Kconfig help text also refers to "various fixes" ATM there are
> no such fixes, but there are also known cases where entries are present
> in the DSDT but they contain bugs, such as missing/wrong GPIOs. The plan
> is to also add fixes for things like this here in the future.
>
> This is the least ugly option to get these devices to fully work and to
> do so without adding any extra code to the main kernel image (vmlinuz)
> when built as a module.

The idea is not bad.

...

> +config X86_ANDROID_TABLETS
> +       tristate "X86 Android tablet support"

> +       depends on I2C && ACPI

Why I=C2=B2C dependency? Are you expecting all problematic DSDTs to be
related to I=C2=B2C?

> +       help
> +         X86 tablets which ship with Android as (part of) the factory im=
age
> +         typically have various problems with their DSDTs. The factory k=
ernels
> +         shipped on these devices typically have device addresses and GP=
IOs
> +         hardcoded in the kernel, rather then specified in their DSDT.

than

> +         With the DSDT containing a random collection of devices which m=
ay or
> +         may not actually be present. This driver contains various fixes=
 for
> +         such tablets, including instantiating kernel devices for device=
s which
> +         are missing from the DSDT.
> +
> +         If you have a x86 Android tablet say Y or M here, for a generic=
 x86
> +         distro config say M here.

...

> +#define pr_fmt(fmt) "x86-android-tablet: " fmt

Can we use a predefined module name instead?

...

> +#define IRQ_TYPE_NONE          0
> +#define IRQ_TYPE_APIC          1
> +#define IRQ_TYPE_GPIOINT       2

Is this same / similar to what we have in I=C2=B2C multi-instantiate
driver? Perhaps something in include/linux/platform_data/x86?

...

> +struct x86_i2c_client_info {
> +       struct i2c_board_info board_info;
> +       char *adapter_path;

> +       int irq_type;
> +       int irq_index;
> +       int irq_trigger;
> +       int irq_polarity;

Wondering if these fields are already defined in some structure by IRQ
core or alike. In such case I would rather use more memory and
predefined structure (it it has proper naming, of course).

> +};

...

> +static const struct x86_dev_info chuwi_hi8_info __initconst =3D {
> +       .i2c_client_info =3D chuwi_hi8_i2c_clients,
> +       .i2c_client_count =3D ARRAY_SIZE(chuwi_hi8_i2c_clients),
> +       .gpiod_lookup_table =3D &chuwi_hi8_gpios,
> +};

Okay, looking into the below, I think of better granularity of this
one, by splitting on per device module or so. Does it make sense? (I'm
expecting this one to grow too big to be suitable for everybody)

...

> +/*
> + * On the Xiaomi Mi Pad 2 X86 tablet a bunch of devices are hidden when
> + * the EFI if the tablet does thinks the OS it is booting is Windows

in Windows

> + * (OSID in the DSDT is set to 1); and the EFI code thinks this as soon
> + * as the EFI bootloader is not Xiaomi's own signed Android loader :|
> + *
> + * This takes care of instantiating the hidden devices manually.
> + */
> +static const char * const bq27520_suppliers[] =3D { "bq25890-charger" };
> +
> +static const struct property_entry bq27520_props[] =3D {
> +       PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq27520_suppliers),
> +       { }
> +};

...

> +               if (ret < 0) {

> +                       pr_err("Error getting APIC IRQ %d: %d\n",
> +                              client_info->irq_index, ret);

One line?

> +                       goto out;
> +               }

...

> +       ret =3D 0;
> +       i2c_clients[idx] =3D i2c_new_client_device(adap, &board_info);
> +       if (IS_ERR(i2c_clients[idx])) {
> +               ret =3D PTR_ERR(i2c_clients[idx]);
> +               pr_err("Error creating I2C-client %d: %d\n", idx, ret);
> +       }

Ah, can we actually use i2c-multi-instantiate as a driver here?

...

> +       if (dev_info->gpiod_lookup_table)

Perhaps it makes sense to move this to the GPIO library? AFAIR I saw a
few more cases like this.

> +               gpiod_add_lookup_table(dev_info->gpiod_lookup_table);

...

> +       if (dev_info->gpiod_lookup_table)

This is not needed. (Yes, now I checked it carefully)

> +               gpiod_remove_lookup_table(dev_info->gpiod_lookup_table);

...


> +
> +module_init(x86_android_tablet_init);
> +module_exit(x86_android_tablet_cleanup);

I would prefer to see them attached to the methods and without an
additional blank line (but it's minor thingy).

--=20
With Best Regards,
Andy Shevchenko
