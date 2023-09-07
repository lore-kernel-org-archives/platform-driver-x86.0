Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FA7EC873A
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 15:51:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343717AbjIGPve (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345347AbjIGPfa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 11:35:30 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E920C1716
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 08:35:06 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-64bd231c95cso6187056d6.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100902; x=1694705702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXtSDuwLHBAGfIvJXN98Bc/TjY2BpOjtqu3XNPdnEAg=;
        b=w/LZ3rhj8Qh+DO00bxreyoFnDGGTza7zp+/fKQOExXaEFpWLuXw9BHnTrSla+8A+bI
         t8D/n8LxAnmw6EIMZzo53jRan8yKBz+fEX9CccCK5EiiwhcQJBQ0kK5oj6qTlm1vzx/R
         Qz6wmDfeXetLDjkEnasPW7HBNrwEF9Hgmvkz8KIZYhzU2kxSjUqQ69jzcQKvVUZ50xBq
         l0XaFileSV4QCUzKoOl3iyKSiu3b5IPl9iRObPpEan4gk1S2JFwPGPYvVaExqYTMBneV
         jYzia6XrCZeb6zGeBvaV4V2F8XD7sNl3ewaNGrn+mdYD+xelGtKReqQyTxslSp3spLKQ
         NvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100902; x=1694705702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXtSDuwLHBAGfIvJXN98Bc/TjY2BpOjtqu3XNPdnEAg=;
        b=hhf/dOUJt/D7NuNOGLZaSieIbfuub8/F96oFy0XBVVC96qhRopj0nwCm3D1G80cam0
         OmuPY+SOwVztfYjlqAMQ3bdBndNSYufvuAJ6YEGPWzNtYxdvO89ZWIw3X8dXEKHQRCSP
         X1GfsjGiHW8w0tFFKE3I6Fu7rV6dGu4Kcr8twz/F0IXhykyQItDU1PJ2VszHnqsopKpv
         6ARB9slJo40IHM93ln7UOboggVQ28sHtN57iRUU4s8fMbLhd2gm9oB3u3YAiZrKo1M7G
         iTvUIFAGNdf41um1h83JnrUTI562GXI+cD4qj3bIjv6mEjR2dEohVDGPqFvRcDblS8hS
         Xuig==
X-Gm-Message-State: AOJu0YwvtpKEr+vd1d8NKkxxJPYglTmWU5y1+E5raZLsxG7fr4Ib0b73
        EjeAz/jiHxhmJ/wJyvv4oSu15inJVSN/uyxVcQenpPCKXVfL+JZKDCM=
X-Google-Smtp-Source: AGHT+IFBssMxe62b6gjC3N4aS6mxtu2dG9GSPKFawDHtfKqDxWyo3xiYEaVk7D6s0DhtiZ21qOVsU28YZ+Ws9GvtAJ0=
X-Received: by 2002:a5b:791:0:b0:d1f:6886:854a with SMTP id
 b17-20020a5b0791000000b00d1f6886854amr17648637ybq.9.1694071162023; Thu, 07
 Sep 2023 00:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-10-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-10-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:19:09 +0200
Message-ID: <CACRpkdazRyhqHhH+Ock3U0wFRkd_U5QUTZmOeTFoXx-Pe_jCRw@mail.gmail.com>
Subject: Re: [PATCH 09/21] gpiolib: reluctantly provide gpio_device_get_chip()
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
> The process of converting all unauthorized users of struct gpio_chip to
> using dedicated struct gpio_device function will be long so in the
> meantime we must provide a way of retrieving the pointer to struct
> gpio_chip from a GPIO device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Yeah, sigh. Maybe add a notice to drivers/gpio/TODO that this needs
to happen long time.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
