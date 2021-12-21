Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31C3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Dec 2021 15:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236147AbhLUPlE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Dec 2021 10:41:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236134AbhLUPlD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Dec 2021 10:41:03 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A6B5C061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 07:41:03 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id m12so22046206ljj.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 07:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRNgLQZbMbv53iALETcjKGWkbYez+svWgF+5J0NW6yI=;
        b=JVkuUKtJTmJIMbxYzbbSU4QHwdeH5YIAf9RN7CKlILCwbvWGKoBPwCbRdVGVZJM5yk
         hRZz7NydQ8OinaPDduwIy/FOnYF0eeVtbaj0ebA81wlOoIddhtCt6322oVxFwGRI/Xzf
         5tc4xBFGEdt8cBN6i+OqxNw1/N0j7Eviyzo0yrTAoq72HLj0E1adAwQD6zzLFDAr+c7I
         rftShPSUohf+h1fYczYi09b3WDof98tBA6YKw5uu+GZDN2Jmh/MEQGYxg4rtg4aN6Qhl
         21S8pmpxpFLIKNU5BqOH7D2vDCI6MZAhMAc+QR+ExXQOWi9LMhHyEryoG5RPkURmVVYI
         Elyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRNgLQZbMbv53iALETcjKGWkbYez+svWgF+5J0NW6yI=;
        b=Q2TWxM1P4F14mjh331GFeGUoiTCi4yTX3Pek9cpDxC163STmaQQIkL8zswYjI1LPKj
         cx3fCTlm6AgEuCHE0usHU2t48wrs1tmXL2R2w6s7GaF4XimZStftbJPZ9WDP7iWIiWPo
         Y9sil0/XlyFEfOZwGQhxCW00JeMmFO6flUHAE1SBTNzGd/r8aC12Objvj+ghFMRj1Hzi
         6BPP5vfJCAShrIDPHpvhofCdI/ad/EHB4TjKXyHygqTlMWMCAynXnDZPuesvMw8PiL4H
         0jnKeb8MoApx+8u9RW2n+a4pcz0P8CbZ5K8iij9Dm24JVm+Fv4o9C7wFYGvSdeHPzAQH
         vbJA==
X-Gm-Message-State: AOAM530lg9I+gUxjSng1a2SCUMT8gE1PG7gJrllVg15p10mZ3cGLJjLo
        lQEIuet7Z3c90Eu6ZpWANcyc5q2V7+WzQjL6yTc1ZxAYsRxGKA==
X-Google-Smtp-Source: ABdhPJxJ6yN5EJ0Czc/Tu7GH71jULsXRfSP1CXZpb0AjoXKfy1JpMnXRDQaPp4AmC58eSyBpPd6lMz1pFpL2MoW6m8k=
X-Received: by 2002:a2e:9e11:: with SMTP id e17mr1789379ljk.166.1640101261474;
 Tue, 21 Dec 2021 07:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20211221151243.66216-1-hdegoede@redhat.com> <20211221151243.66216-2-hdegoede@redhat.com>
In-Reply-To: <20211221151243.66216-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Dec 2021 17:39:02 +0200
Message-ID: <CAHp75Ve8NP4FQO1R6tsRV7G4rSmch-dX5ADKCb7E7Q83zqKyew@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: x86-android-tablets: New driver for
 x86 Android tablets
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Dec 21, 2021 at 5:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
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

...

> +config X86_ANDROID_TABLETS
> +       tristate "X86 Android tablet support"
> +       depends on I2C && ACPI
> +       help
> +         X86 tablets which ship with Android as (part of) the factory image
> +         typically have various problems with their DSDTs. The factory kernels
> +         shipped on these devices typically have device addresses and GPIOs
> +         hardcoded in the kernel, rather then specified in their DSDT.

than

> +
> +         With the DSDT containing a random collection of devices which may or
> +         may not actually be present. This driver contains various fixes for
> +         such tablets, including instantiating kernel devices for devices which
> +         are missing from the DSDT.

...

> +static const char * const chuwi_hi8_mount_matrix[] = {
> +       "1", "0", "0",
> +       "0", "-1", "0",
> +       "0", "0", "1"

+ comma?

> +};

...

> +       int ret = 0;

> +       board_info.irq = x86_acpi_irq_helper_get(&client_info->irq_data);
> +       if (board_info.irq < 0) {
> +               ret = board_info.irq;
> +               goto out;
> +       }

Can we rather use
ret = ...
if (ret < 0)
 goto
.irq = ret;

?

...

> +       i2c_clients[idx] = i2c_new_client_device(adap, &board_info);
> +       if (IS_ERR(i2c_clients[idx])) {

> +               ret = PTR_ERR(i2c_clients[idx]);
> +               pr_err("Error creating I2C-client %d: %d\n", idx, ret);

dev_err_probe()? (device of the adapter)

> +       }

...

> +out:

out_put_device: ?

> +       put_device(&adap->dev);
> +       return ret;

...

> +       int i, ret = 0;

Do you need this assignment? See below.

...

> +       for (i = 0; i < dev_info->i2c_client_count; i++) {
> +               ret = x86_instantiate_i2c_client(dev_info, i);
> +               if (ret < 0) {
> +                       x86_android_tablet_cleanup();

> +                       break;

return ret; ?

> +               }
> +       }

> +       return ret;

return 0; ?

-- 
With Best Regards,
Andy Shevchenko
