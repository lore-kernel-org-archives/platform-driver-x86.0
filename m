Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFB3EC873A
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 15:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjIGPbr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbjIGPWN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 11:22:13 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295C81716
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 08:21:41 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-79a10807b4fso434664241.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 08:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100100; x=1694704900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBdELFiF0kNq2P4ovxPr1G/v1B3B5Z0Pa4x1EdUn7xY=;
        b=dEoTJuW9aOfRn6zEbKIOclm5/nDwx0G2VqpEfeKODimcZj0FDCJj2kkscteEoJGK4z
         0Y8rvYlck/Eek6gHuwn2jIUvoreE5b8A2cFJX7M39hxdhwJnGMwMufhrPNs+QqYA/CYB
         UNRnEvoix9sv6T3FLIojsec0mSkBJJTlCZm6PwXy3ppDw7sEhi7BjKf+GvdKIXceCqLu
         9QHv1OiBsHYq5bjQinZWDzmq5BrHiZWqGQo3HxiqJPF8oqMGbKjKcAWY3h5DQ5DyOJh9
         KmucKQ8t4yVcC+dlvZLMExVPSy/VZEvo7P81RqK2GvKE7mu9FWqrqGi8QPg7wHFO22xW
         mLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100100; x=1694704900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBdELFiF0kNq2P4ovxPr1G/v1B3B5Z0Pa4x1EdUn7xY=;
        b=KiLWqGYnKotkIx451FUg8bHC6yrafwxbNbb6q1zn04/DzYXKlyGuBOjEZsJJKe2zjQ
         pO99CdgWUD4El5qtXwH3OfDG5v6beCxw6aRxzXfKFP26GtpnE6Rdo18o5gof4Tg/R5iK
         7rdE78MJQ+rfIYncg3vb8ln70+sVv/AGxSd/bkEVGKkf1J/jVgPSaXJoDSIMtRqBoPmM
         En0C9L7H5bpaLj7YBoReHGWgy+v3T9gC33qqhGlefQ5Mx3+/w7KLZXd76PT2IL0zpcTF
         U8CwtK4EbFNB7LX94Q9lX5KNHNi/HrNjbDZzZAlQj9+3hpe19qLdAR2Z2WF6uiAwCQBr
         uACA==
X-Gm-Message-State: AOJu0YwsxQGa3NrBUNWmEBcdg6QPqIfp1u2iUqYYOCs8SuiCv3Wt0yF1
        HuhCyyY91NpvzVaE62nbfC28lQodsK69Te7KOllkNH3oQM2ZnKWrih8=
X-Google-Smtp-Source: AGHT+IGquAMmj4BV1IgcH+0hlmwrCPO8RvK5dDPIHBFPHMvw3mBi9yKQYdiyjPsOt1CRLSecOSiNHyNGSnbycipPFpA=
X-Received: by 2002:a25:4057:0:b0:d7f:1ef3:66a9 with SMTP id
 n84-20020a254057000000b00d7f1ef366a9mr10826771yba.15.1694071032928; Thu, 07
 Sep 2023 00:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-8-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-8-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:17:01 +0200
Message-ID: <CACRpkdbdcPv1LHL2W-enKBJ2OARpduoOJkQ64oL6GSOfmmD3qQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] gpiolib: provide gpio_device_get_base()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Let's start adding getters for the opaque struct gpio_device. Start with
> a function allowing to retrieve the base GPIO number.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I guess you have a solid usecase for drivers needing to do this
crazy thing, because I suppose you feel as much as me that
this should rather be gpiolib-internal and confined to
drivers/gpio/gpiolib.h?

If you add a valid reason for making this globally visible outside
of drivers/[gpio|pinctrl] to the commit message I guess I can live
with it because we need to think of the bigger picture:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

It brings to mind the now confusing "base" inside of
struct gpio_chip. We all know it should go away, but since it
is never used during the lifetime of the gpio_chip - or SHOULD
never be used - it should rather be an argument to
[devm_]gpiochip_add_data( .... int base);...

Maybe something we should add to our TODO file.

Yours,
Linus Walleij
