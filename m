Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766D2EDE990
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Sep 2023 08:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236359AbjINIcH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Sep 2023 04:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235215AbjINIcG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Sep 2023 04:32:06 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579D191
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Sep 2023 01:32:02 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-59bcd927b45so8099127b3.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Sep 2023 01:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694680321; x=1695285121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/f7PUGJTcZo4gRvXha7omFj7WFQCwx9ue2jacqTY10Y=;
        b=tGmlho28soxbfJejqxqHWL8tl9D55vh2yT+NvtLZO+uPqG51xoJLZWfmLoUgRKGqdL
         VPJYUXp3n1eL0oZqhmz2hCa8vayoFWAF9LMbhIzArWyYbjdJOvq4WOn/7Y6R0yy5v9Hf
         LU6nPfs4YVw/9T1vQtYaDdfgUXp5O20+OVowgvpc8XQcedXLBlOy3fPrqKa5I4dEBKXk
         sNWbhnXvAV9PCDrnW2PzBdh2AfNtgTcD80vgUDA8j/bh4c1EhXY8mGIO5YKbmYISYKof
         AS4/RDdN1mfh+10frp+nvY5qKLCezpAviWs1MPUFgF2P4+4+NYhYllwem9kQw0RZ/fYT
         EKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694680321; x=1695285121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/f7PUGJTcZo4gRvXha7omFj7WFQCwx9ue2jacqTY10Y=;
        b=wzdL9b+9it5IvAII79cDFqbghWsBxvtoOHOEH/ZI2SCMbEu0dMsY38wFSmvJrwyQ06
         FQ/DACH1bvvvG1a/ljiCqx4oJsaY71jp+za7ciicAbyEv6jA2thrLb+iSNG1qGg5kvZp
         czkJW7ttDJQvJp6NmuF+W2qtEbMGBequteWOlKyRrXiHvZwgMAkYoP9URCTeR0VU2xZl
         12Wmj/aliFQ78nOy8g8r8lKA/xqS5fSpknVZJvf8VdPRHR9iI9cx6IGaltuftXpak69y
         SmjKwcd5dwZ9PGgcsf2SyaYpzFhz8Ye7yfiewPaOXT6fJnCV9xjhGwinULRT8bj9FcxT
         ssgw==
X-Gm-Message-State: AOJu0Yx24yXC3NzCPdqoL7Ok4q5S7VE+YLoePSzQz5fl8Ii6xJi0QdR5
        izy62qqRzGeE+jsIqYtcZgYCxVc++TE4p008C8Vfdw==
X-Google-Smtp-Source: AGHT+IGge3otYJuN1x0KCIdiXLzKUbPNNkQs8DyMIv7UvmMGiKxCFx+kZRRvM9RVN2cdKaa4LF8eeb7vGkOJrVNORhs=
X-Received: by 2002:a25:b45:0:b0:d63:44e:cbcc with SMTP id 66-20020a250b45000000b00d63044ecbccmr4689080ybl.22.1694680321572;
 Thu, 14 Sep 2023 01:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-4-brgl@bgdev.pl>
 <CACRpkdax-CrB42LeQ1bs3E7VqMncsgEwMs7b_v7J6R5AE+BjAg@mail.gmail.com> <CAMRc=Mdt0wbjzbwBLK5m--VLV2WE5JybgrNYWXtbinPu_c=psw@mail.gmail.com>
In-Reply-To: <CAMRc=Mdt0wbjzbwBLK5m--VLV2WE5JybgrNYWXtbinPu_c=psw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Sep 2023 10:31:48 +0200
Message-ID: <CACRpkdYVGR0Wj9zS9cuS3qa_tNZHE1t95wQ-4MXAEL6s_4jdFQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] mmc: slot-gpio: use gpiod_set_active_[low|high]()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Sep 13, 2023 at 2:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Sep 13, 2023 at 2:24=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > On Wed, Sep 13, 2023 at 1:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > We have new, less cumbersome and clearer interfaces for controlling G=
PIO
> > > polarity. Use them in the MMC code.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > I like the looks of the code better, obviously but this looks like this=
 for
> > a reason unfortunately.
> >
> > See the following from
> > Documentation/devicetree/bindings/mmc/mmc-controller.yaml:
> >
> >   # CD and WP lines can be implemented on the hardware in one of two
> >   # ways: as GPIOs, specified in cd-gpios and wp-gpios properties, or
> >   # as dedicated pins. Polarity of dedicated pins can be specified,
> >   # using *-inverted properties. GPIO polarity can also be specified
> >   # using the GPIO_ACTIVE_LOW flag. This creates an ambiguity in the
> >   # latter case. We choose to use the XOR logic for GPIO CD and WP
> >   # lines.  This means, the two properties are "superimposed," for
> >   # example leaving the GPIO_ACTIVE_LOW flag clear and specifying the
> >   # respective *-inverted property property results in a
> >   # double-inversion and actually means the "normal" line polarity is
> >   # in effect.
> >
>
> I hate it, thanks. :)
>
> > Will you still provide the desired "double inversion" after this patch?
> >
>
> Not in the current form. Would it work to go:
>
> if (override_active_level) {
>     if (!(host->caps2 & MMC_CAP2_CD_ACTIVE_HIGH))
>         gpiod_set_active_high(desc);
>     else
>         gpiod_set_active_low(desc);
> } else {
>     if (host->caps2 & MMC_CAP2_CD_ACTIVE_HIGH)
>         gpiod_set_active_high(desc);
>     else
>         gpiod_set_active_low(desc);
> }
>
> ?

I *think* so but my boolean parser i known to be flawed since I have
screwed up double inversions repeatedly over the years, so it should
not be trusted at all.

> Alternatively we could reimplement the toggle semantics locally in a
> helper function in order to get rid of it from GPIOLIB.

I don't know about that, the flag is inside gpio_desc so we cannot
access it (struct is private to gpiolib...)

Yours,
Linus Walleij
