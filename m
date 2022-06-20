Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00523C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 10:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240137AbiFTKXl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 06:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239832AbiFTKXb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 06:23:31 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9629EDE9A
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 03:23:26 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id g25so20115582ejh.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uIhqG8rynweT8miVo3dh6IEwRt1/361Hdq83cYB6QNo=;
        b=eaa/zPO71GRcPVAE+5muhKhMuHQSJYVHWOUk2QHCtI05ig6NgyHuh8tLBwbeDE68r0
         zRioUUOxh9yGtfTzw/QOUAEiW5CEb9b5G8Ffz7xKmwBUc7AEqGQULF3E1W+jtrncjn/b
         Mbq4j5g7y5sNz1J4pMFXRViwIhcRflqLW7R0t5ya4IN39G+u1GT9hp8R0OB+jH3UEvCU
         /vvHNxPaE7VRpGsSR3Bfv0eCXBtG/UH2Se8nlq81urUkcdaDYS/IAEQ6LcPOHbfShzVa
         zo5Z5agkQO1hWhtBjBDzpBPhHMkbbeUPlmBsexIcGIh6QBkn/Q2Az6wZ5TE3h3d5dQrV
         wEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uIhqG8rynweT8miVo3dh6IEwRt1/361Hdq83cYB6QNo=;
        b=kBRKMfJasTPM9rBpia8HMeA0O2wG2KDtgkhXNEhzwT0EdNHyvnhkSe8mrwc0eTWFUg
         mB5nPBcWH44VjMYdKzAjb2VfttDnbWfNURAIKnNkMNY36ADu5aE75SysrSY6YZCpBjsb
         lJJtUs3846jlpYPwL3o+22rv5e0X19bI60OG69GXih479PFJ9HbnugC9vxr5JbFJpASy
         FUHzaGiLmr+D1/lcQHspMz+aoohgy1CR5vxOnNnskajas0ZanQ1ZsrPNS9K8fDizpdMX
         oFpTUr9XrAFHAl1O/opXYyHfiEYmPHudnxuwGF/bvec4B4rwgJCkMnftluMk+/zChpqG
         Svlg==
X-Gm-Message-State: AJIora8baYWLi7LusrFqIFnLSGPtjtdqENedNY9WFV/7m/2+6QivFdr7
        VAQEjO4P2GhHR12PXxOKh0ldO0XBEJgd6MjWU6WsokqL4JXa5Kdz
X-Google-Smtp-Source: AGRyM1sfgaIEEvFhCWfZ12Bq6bEYqHoCMod8JwNU+ThJSRtaQy2m8fjyK6mue8O0hJDMR/TMDkRJd/aHO8tVowQIT7c=
X-Received: by 2002:a17:907:9721:b0:70c:65e7:2aa5 with SMTP id
 jg33-20020a170907972100b0070c65e72aa5mr20172040ejc.132.1655720605184; Mon, 20
 Jun 2022 03:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220620093637.9429-1-hdegoede@redhat.com> <20220620093637.9429-3-hdegoede@redhat.com>
In-Reply-To: <20220620093637.9429-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Jun 2022 12:22:48 +0200
Message-ID: <CAHp75Vc+ZbspH1Wj5MTCknsfzRaJ7e+U5MABUEp3ZqV+VDb4tg@mail.gmail.com>
Subject: Re: [PATCH 3/3] platform/x86/dell: Kconfig: Remove unnecessary
 "depends on X86_PLATFORM_DEVICES"
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
> platform/x86/dell/Kconfig is only sourced if X86_PLATFORM_DEVICES is set,
> so it does not need to depend on it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/dell/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index fe224a54f24c..25421e061c47 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -5,7 +5,6 @@
>
>  menuconfig X86_PLATFORM_DRIVERS_DELL
>         bool "Dell X86 Platform Specific Device Drivers"
> -       depends on X86_PLATFORM_DEVICES
>         help
>           Say Y here to get to see options for device drivers for various
>           Dell x86 platforms, including vendor-specific laptop extension drivers.
> --
> 2.36.0
>


-- 
With Best Regards,
Andy Shevchenko
