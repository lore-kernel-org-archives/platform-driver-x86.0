Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A8FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 10:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237604AbiFHKuY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 06:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237581AbiFHKuQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 06:50:16 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEA81E2898
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 03:50:10 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id gl15so26787261ejb.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jfc8kkHUj6X+kcdR3qECvQ1mToHw6MBWNYBHCSJWmcE=;
        b=fMu1UpaNzDZ0hq7oGoBCsYVeT3Ujmtyhj1//++5yLnjks3/UzqTzipDICzC0dJ3nAA
         8i4HTk6VqyoNOD6R82P918yfUTdxAHTYUzWIN9xNIyw/enehJ2RoUbbQM4ds4WT77/HR
         med6vzSEMITfXNTPI05v01l0zcePIQMBrnlWH9gQh6jDeZZHLmo1WZuI3P6ROB0YCJco
         2EyXloEY8PSmmJnvBz2GEl8RFxnaDgK23aWQXHdCR2x3axtcG13rhkYUoCApnAHQ2gR8
         qBZ4WtsXINcpWIjizHTkbPegwSFlq0gI+Gf/K7Ub0UZQmOTA6HTnVXTgMGp2e8/tTXBA
         1mEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jfc8kkHUj6X+kcdR3qECvQ1mToHw6MBWNYBHCSJWmcE=;
        b=fXcEulCFHQq+gXKxbyTiTUkEw3Mt9/GOt7GevPT5uiZp64cfVjFI2Y+sa6zdinL2pY
         W/2q/yuX/KoJXsbeyBW9sfqD9pbCHY65M2SgMjh/T5AIXOy00RA/ZjGNsLfK8up2RP7w
         EEW6pJSxhVn1zXN5AaAS+H4KLokTe8+kcbHZVfwcApgkPx/AULaJXhsVq12RLIlxvviB
         KY8xPUHbYFThjGaftGTYuxAQz1ME9ZP83T29WfPMyOHPAX+ApVxBCOOwMVC1TzoE8jFS
         WvdbTI9Xy3W9K+HkCQMOdxrSxQ6BQFAvX9vEpBbyymZ4s4yyRsaNzEw1OnepagHQE2yh
         inpw==
X-Gm-Message-State: AOAM530P/Df+DrefJHyBB+5mUh/s6pI+8BhMGVikG0KZdQEro+Wzvb3Y
        JvoVSBIhJ2g/sLUsgGMI/ts4QodGa/VgOPRd+70=
X-Google-Smtp-Source: ABdhPJwsGZaY0Mc7cmHHCgOaFmirh7nEd8HDXY4THyyXMhyd9Pz0LF9uBW7GJduwV3+IP7s5YROfgsQft5fHuYBNhWE=
X-Received: by 2002:a17:906:1193:b0:70d:cf39:a4db with SMTP id
 n19-20020a170906119300b0070dcf39a4dbmr25505742eja.44.1654685408873; Wed, 08
 Jun 2022 03:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220607213654.5567-1-krnhotwings@gmail.com>
In-Reply-To: <20220607213654.5567-1-krnhotwings@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jun 2022 12:49:32 +0200
Message-ID: <CAHp75Vfzd+sWWffUHkAbXo-tU8rBnq1f+VUeDFWPtu46sxF=DQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/intel: hid: Add Surface Go to VGBS allow list
To:     Duke Lee <krnhotwings@gmail.com>
Cc:     Alex Hung <alex.hung@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 8, 2022 at 7:48 AM Duke Lee <krnhotwings@gmail.com> wrote:
>
> The Surface Go reports Chassis Type 9 (Laptop,) so the device needs to be
> added to dmi_vgbs_allow_list to enable tablet mode when an attached Type
> Cover is folded back.

> Relevant bug report and discussion:
> https://github.com/linux-surface/linux-surface/issues/837

It can be a BugLink tag instead.

>

BugLink: https://github.com/linux-surface/linux-surface/issues/837
> Signed-off-by: Duke Lee <krnhotwings@gmail.com>

I believe Hans can tweak this on the fly, so
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> ---
>  drivers/platform/x86/intel/hid.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 216d31e3403d..79cff1fc675c 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -122,6 +122,12 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Convertible 15-df0xxx"),
>                 },
>         },
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go"),
> +               },
> +       },
>         { }
>  };
>
> --
> 2.36.1
>


-- 
With Best Regards,
Andy Shevchenko
