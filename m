Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FAAEC873E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237308AbjIGQmA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236726AbjIGQlt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:41:49 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9862351A7
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 09:17:04 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c1e780aa95so8224575ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694103366; x=1694708166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuYVBuRk1qSk/vysKkYAGZLoaF4hP5KwSrbdU9HLCHc=;
        b=etBboQvBV3lKBpXoEL0dWlxfmZQhLCFL2t9+RuiRjigHlHFgG+Qc/LwDGWQzJGkvFS
         4UqhDF7JcevaqGkaODXGDbhM1093Ji9BC3x23UV0SZ0UNYT/pl5+qBRcEw8OXqnChbED
         1AKihS60Qllykou+Mt35nBgEUz+pXI09S27dhbLq8Xv7DnX1YqvzAR5whoiAmHuMVby0
         UvpAAeQL1IcPLB54MtMmJsQ0MT+1MP95j0EL+W6x2RJ7AXVYYPhSFELKI5e/5vV3AEQc
         1thlU4gQrttVtxHs1f2f7iHZRYo08NQsJS3HAAp4QfTp6uvlaALPpoYmDaYHdGI3mYHj
         bZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103366; x=1694708166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuYVBuRk1qSk/vysKkYAGZLoaF4hP5KwSrbdU9HLCHc=;
        b=T/CZIG5pdvfpV4hHNLdb6qF7vpkH/0RaBRwRKSGXhG/TY0OFfGGE3bxW6n7Z9ioyLT
         h5vB3R/Y52ReS7dCJwE6J8JZemlXfZOrXzwz7wvfYrW3ndCa3CIX0HgFtGuv7vMvmPZe
         Em0gTrkW1l1D1TY3wi86lDSGsgo1lNh2IAHaVHIX44nP0jM6i+/NN7m9YDAt1qzLHxXE
         IcrgmSpykbKfzR41naTEO/mU6RqVPjmIr3M7PfNcQZmjWqi3hO9cyG/jtdLKCZdXGHJq
         V4X0x4hrPPQUjaD6YdTvzNzMFJmgRp/xmvPBJbwvsnTaww1GVJr/fNHYPNv0cs4/slLE
         NGjg==
X-Gm-Message-State: AOJu0Ywh9NpM8U5rnPtt6etbYFQNJ8Kp+3/QIGtJ9/03+BBY1AGdmAhy
        4KiXCtEt/T7IhXw5isHqpY+0hhksfm+ME2qU6W99kwWe9DW2APKg
X-Google-Smtp-Source: AGHT+IFH+TTCwwws89F7SNPi0GGOZFWp/OkGv5hkCV0kl2J1CUqPAY/iOB9bwWhCU9n1g7MoTzaR/hVwP1cetSs2hGI=
X-Received: by 2002:a67:ebd9:0:b0:44e:a3e9:68d1 with SMTP id
 y25-20020a67ebd9000000b0044ea3e968d1mr5642709vso.1.1694071890893; Thu, 07 Sep
 2023 00:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-13-brgl@bgdev.pl>
 <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
In-Reply-To: <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Sep 2023 09:31:19 +0200
Message-ID: <CAMRc=MdXU_EiG4iYhHJd7faRPEQ21hXHhRpPAqTa-TiMiraZpw@mail.gmail.com>
Subject: Re: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
To:     Linus Walleij <linus.walleij@linaro.org>,
        Dipen Patel <dipenp@nvidia.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Thu, Sep 7, 2023 at 9:22=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Allow building all HTE modules with COMPILE_TEST Kconfig option enabled=
.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This should be a separate patch should it not?
> Just send it separately to Dipen so he can merge it.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

Dipen,

Can you just pick this up and the other patch addressing a comment in
a HTE driver separately? Would spare a resend to the list and I'd drop
it from the series.

Bart
