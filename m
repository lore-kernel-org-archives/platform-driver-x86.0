Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734D3C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 10:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbiFTKW6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 06:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233995AbiFTKW5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 06:22:57 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15ACBE92
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 03:22:56 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z7so14416030edm.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 03:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QN+qMNDhiiDb1T3Iw/FErJPCWnGHvJwQcnx5kvpZzcs=;
        b=Vc8o7BESRfshJvucYu6QEL23EPF2hsq4VnDNcO/UiT+BwVySInAzlbdPs30hYopeqJ
         pz/9JOMXntdIWA/JWHkBDDoE7WbcZLYe1t8t7JZLK67b0/wv9O4LHZL4izV0ZWh9kHkh
         BHR8kjKjdZKT4dSvPP6aX1yB3mINeEaKy+NsZyNV8P6p73p9E8awcmxL0pzHZa1pOkls
         ReQ42/1D0N5EmDS0Tx0d59PkgCidRW4dk9BQJsOF1cj2jElH/LVhk1XIFOvnYEvGgtbs
         2MNWhWh3uFzgLqKXC34ldgbEpzFTOJEGeHE08tEhUGhn8SwtkI0BZH+cQhbm6mjqTEtc
         UC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QN+qMNDhiiDb1T3Iw/FErJPCWnGHvJwQcnx5kvpZzcs=;
        b=6byZCL1HKHxeL8tLvX4kxZD4hy+cAlnmE1/cvMyHOj/LCWqELbj6JjiJz5Mu0cT4Ln
         Dlc1ua9SYQRUXUgXxa15CNea1U/HRFil65/RFDyOK0IKATimVIu2S0WzmOviFrTt2oE7
         BEmia+CUEF4jBdWWEoWns3TSpB8MjT3SR/uBg48uei4z/HDppjHJRUegujR23Lly4WTJ
         Ek0GHrfavIMJDZ1RS4/0PIfOz2RZo/OZnhE+YsF81zM0B22fgM44BvznC3AnvKYyhjiU
         pAjjr3M6sCwidQtGrVS5sEWPGl/NBj/jsX8oUWxhrm8VyrCFQZAZ62GJFEYaT3R3TQDX
         5WHQ==
X-Gm-Message-State: AJIora/vjcIyHQjFXYuvt4JoDn2wzI192yNUpN2jRPO4msRDyxF+grTT
        OvViOkZkREVBH+l0nSH2e+tEeb1GhxapAg/yc4s=
X-Google-Smtp-Source: AGRyM1ub6qgfMCxLeCnK3x5I5j0w3VkTntSFwYa0OnwQ1d5IJ1zfz6GjHNEl9iTn1NP0kirgXZ9awxVfmN/+bOlw+Ws=
X-Received: by 2002:a05:6402:4390:b0:42e:b7e:e9ac with SMTP id
 o16-20020a056402439000b0042e0b7ee9acmr28857875edc.97.1655720574660; Mon, 20
 Jun 2022 03:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220620093637.9429-1-hdegoede@redhat.com>
In-Reply-To: <20220620093637.9429-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Jun 2022 12:22:18 +0200
Message-ID: <CAHp75VfbsNupu0o9fwUr1L9VNqM3BkU95ovPbj6idCR9mfGUsg@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform/x86: acer_wmi: Cleanup Kconfig selects
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jun 20, 2022 at 11:36 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> ACER_WMI already depends on ACPI_WMI which depends on ACPI
> so the "depends on ACPI" is unnecessary.
>
> And since ACER_WMI already depends on ACPI adding an "if ACPI"
> to the ACPI_VIDEO select is non-sense.

nonsense

> While at it also group all the selects together.


Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/Kconfig | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 08852a1cd51d..6e22ac916f7a 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -177,17 +177,15 @@ config ACER_WIRELESS
>
>  config ACER_WMI
>         tristate "Acer WMI Laptop Extras"
> -       depends on ACPI
> -       select LEDS_CLASS
> -       select NEW_LEDS
>         depends on BACKLIGHT_CLASS_DEVICE
>         depends on SERIO_I8042
>         depends on INPUT
>         depends on RFKILL || RFKILL = n
>         depends on ACPI_WMI
> +       select ACPI_VIDEO
>         select INPUT_SPARSEKMAP
> -       # Acer WMI depends on ACPI_VIDEO when ACPI is enabled
> -        select ACPI_VIDEO if ACPI
> +       select LEDS_CLASS
> +       select NEW_LEDS
>         help
>           This is a driver for newer Acer (and Wistron) laptops. It adds
>           wireless radio and bluetooth control, and on some laptops,
> --
> 2.36.0
>


-- 
With Best Regards,
Andy Shevchenko
