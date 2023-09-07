Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B47EC874C
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 18:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343896AbjIGSUC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 14:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343851AbjIGSUA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 14:20:00 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1D81700
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 11:19:32 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bf7a6509deso9529885ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 11:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694110771; x=1694715571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13mPF61qHFznELBakOuaBROvGPz0+u+UN1db/TtYWeY=;
        b=sNasrLwV+H2gRI1faEcaAAzwhSpIk31QnBiHf+kYNoH7mvllMDKF6NQDXfsdMFtcvZ
         hTFH0j0rzd8cuoK5k4XFoYBbtvVH2NB7SPvDPEeYtZSoZq/qZkfoXltoxRoRADv+5Vzq
         jxqlgWvk0F0pq/kdtndxAF1Jb6MGz9O18f2gzUWBQ2Byx9e/ZTdi2FUOZ6LMCOmx4yN0
         Cv27c94PBWj2p8t2czDE1Ky5AfFYCBBla2dAfX6miYQtRtKesUQMFtoznhga25Dts+a9
         GD4akBvHeh29GHDW0TqlZUxn2jzpKJB11tbbH3lkHtJU779Y421hz64/qw1Dfis/xPtn
         ZWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694110771; x=1694715571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13mPF61qHFznELBakOuaBROvGPz0+u+UN1db/TtYWeY=;
        b=wqJH094gs5Iw7WqWpm5TLsC82MUYvVg5o/DNnXA+KIIvebPFceO6cAglcOrSWX2IWJ
         1xa3zpwlcezG3PVH/M2HGed72EvMafkkET9bXoiCn1ay+JfJkTaZkPpwEBg34ZHJA40G
         soL/XyLOZxpnsUGXj5PU+6VCf/So/LPq7hM2Wjb34g/aLeqK0696jaGcvuzLWuOd2ew8
         LJnufRPIoutE+J/bPTspZpJy6abSWuAUvuvvXcab/0ixYhObUIhI/+K7N5JKB21Hsdzh
         K5w5Yai506z/Y9Z5633vlNYg42I+mxHWEVqd1++M4SHdQPKjxHlS+PSKW4eu652RMD+K
         eQWg==
X-Gm-Message-State: AOJu0YxoZ1C0lR6skvr7yRBCKqC5nlu01xLOjbsbX/4NtVYx+cPhmULm
        EMpd7x6vuJEIM/xX21irjA3lZDvO8YJVtqLUNJCyKlb3+fe+G/msmaQ=
X-Google-Smtp-Source: AGHT+IEb93BSLJ6ys0EYsaB8W8EpvBdYT15JIdt6VJnTL5yTIvHPIi3k4AVOKcoqpkbYj81EENL5j+za7CaCpwJcXlw=
X-Received: by 2002:a25:d783:0:b0:d0e:b924:8e20 with SMTP id
 o125-20020a25d783000000b00d0eb9248e20mr19000067ybg.22.1694072539775; Thu, 07
 Sep 2023 00:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-22-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-22-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:42:08 +0200
Message-ID: <CACRpkdZBa7SY=3vykMSOxcQ=z8=igru5uFmyVw0zmTBvAWZTBQ@mail.gmail.com>
Subject: Re: [PATCH 21/21] gpiolib: remove gpiochip_find()
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
> With all users of gpiochip_find() converted to using gpio_device_find(),
> we can now remove this function from the kernel.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is so much cleaner, and introducing some scoped guards
along the way it's a clear win.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
