Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55BBEC8743
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 17:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243252AbjIGRZi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234340AbjIGRZe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 13:25:34 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5D51997
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 10:25:10 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-49370a7fe6cso1032706e0c.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 10:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694107460; x=1694712260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f20OVJZsVkvgr12m2GLQpGE6nkKLjOApm9F1D76ZYu4=;
        b=whEQbH2LXmNhshkg9DCiO1aTxbi6TQCSPu/6HabqXq4vzIyCA6WLXx+V+0EnXaKzyP
         dXKzj2klCf7z3nlLl7GMuWVRfZoOk4CamdFQpKBWNL7kOVzb/2yRP4Ooo3QlL8C/NLde
         hEvsHWfmq0bBdfOVkP5Rztn/tUEKvktKDImljoAOQ2LJmbRPu92C5hRykGMMoqVEjlLh
         jvzRrfK/9tLUmZA0RuMpOivmALilNeNsWK0ww79irHMtFBCVDw2n66t9c0up+h8ZaX+Z
         x/0bgiH0LNNS0THrkKkxJfu4JT2Tmz7ME0cEsksArehSkdwmiuWIyGrCKGBij5Hf1A3X
         5/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694107460; x=1694712260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f20OVJZsVkvgr12m2GLQpGE6nkKLjOApm9F1D76ZYu4=;
        b=KVFgEETOg+ffOa+G+LTL028K4sB+9pTU7yb2FIO7C1KlGJk32wSXE+jKjkVqOjwJq+
         GPgj31rIRaf8hsXUZ2BpsPLRZLj4XQSciNmrJSNrpWAlvGY3IE6sv0ho/H0d9ORVgiOS
         qpdzylCHb0/iOdMkTbZngRwY5/ywHDs1qMqBfWIIEF5824HqODsNRBlQhq3vq5aTZc1n
         +yvBkJPYAV6QSI9F4pwBQMDR+oa7F+9qFGEljD927+w6MDeYRD5LSwEJA8M32WHCTymn
         a+K/8COaFYKRjhX1pi1TtjAj5TVB+z0jntqouLugBAYgFWOmdc9RjPSQJNmZeFshfe0z
         WECw==
X-Gm-Message-State: AOJu0Yxv2pt2HwBu7Xbr64VlOUtrOMjMXwMzSSiXMfFdBH9m6mV90Nok
        M1paSrgUBKawrX7Lu2wwhoVY8g/fsXEGNkpbQqTc4tAzhHGgncqFEhY=
X-Google-Smtp-Source: AGHT+IHeVaENuEkywllarylsoaxFtkX8+wcxLmOt1RC5WvBdIS3BKktFFG9wSU0jnwmUX/wjU0B+ttekv3ZROcdPEGQ=
X-Received: by 2002:a25:f414:0:b0:d73:ed30:1162 with SMTP id
 q20-20020a25f414000000b00d73ed301162mr1939775ybd.28.1694072320536; Thu, 07
 Sep 2023 00:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-18-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-18-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:38:29 +0200
Message-ID: <CACRpkdZbCjFMytzsF6Sb-6V54J+owk+zJ3oB9ZGCzAdsGwcFOQ@mail.gmail.com>
Subject: Re: [PATCH 17/21] gpio: of: replace gpiochip_find_* with gpio_device_find_*
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

(Sorry for fatfinger reply)

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the OF GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Scoped guards, nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
