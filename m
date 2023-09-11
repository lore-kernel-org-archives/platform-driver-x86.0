Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFCACA0ECE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:06:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355618AbjIKWBb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237567AbjIKM7x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 08:59:53 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9D9E68
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 05:59:48 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-44d526f96fcso1363776137.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 05:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694437187; x=1695041987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeSQxtav1kBfFjeqACTcKoKw74gowqJrLRYGxNHMnw0=;
        b=YZGQrRMSi3y354ze1F7tvDEBw351AYB/VJdMMaMHIrxRh+LlcTa/m7madmyi5uVm2Q
         juC8+KPPspKorp1tMAPeLQQNrB82EvHJhFeL6lOC922VTlNZReBClDxrdOg6t0o2s5ET
         ypNIVaqx1GzGGqzsZyOoEKSOrk+pVbiVDULh0uB1a2XLbqA9syEzYfwK785o7XFvBFB8
         w5CppFgxFxoxwIEp43wYzwXzHTX7Meg1aB3eghmyHVV49F7jikhdO3R6ez1Gcgc8seV1
         BznYsHb/mEk96s7460gI7fYp2+Us4stFnPYJwbhexZl2ratBybyivy5xYXJoo3jbqI0m
         UW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694437187; x=1695041987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeSQxtav1kBfFjeqACTcKoKw74gowqJrLRYGxNHMnw0=;
        b=k6SLEouagoNxBnrvILE8Kji63nGeWIkXF2HUzheck6CYIHbCFx1Xouj4aUQm3VV35Q
         iRKZ0ISXrYwQdULMiCLA7bsSVuzD88a1MJzy4VB/YwyE8wRhVH8h0z2FCxxNDzS1vpe8
         YzL6N3pvkjpv+8BCBFYr/BftYFpCV1D0lQiet9CSmyH7ugUT84x1IHpa4bZGW7AbTjiZ
         xzYS09uJ7wdaA7BP06dLrSviuWF9kZSv++qsrbCFJOSe+syiHrTX/ujxsAjq+7x2lS9Y
         a8DA7dkwJ7IvpaDBPzv/cCwkehjytTfMWMeJsKnwoZxJLiuId2/u9nStGHO/Ty328fS4
         K78w==
X-Gm-Message-State: AOJu0YwshF3shKzs8YAy4fWTZ2fyuFtvMa4fqARFFoT7pBMqMFGto2gB
        ZNpd4n93Y9mMIVDMrhBjTpLtI52S1Bp3XqProHmd7CPEgcGMAsGb
X-Google-Smtp-Source: AGHT+IE0n8JXf3+DAvbPF9PFOTNkGS9vcxY40uQLrQXaLhJ4zhNZGFloDo3Q1B5xvzQi89I59FTrSQaZkShTMaJ0bF8=
X-Received: by 2002:a67:fe57:0:b0:447:7a6b:2c8b with SMTP id
 m23-20020a67fe57000000b004477a6b2c8bmr5774075vsr.30.1694437187276; Mon, 11
 Sep 2023 05:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230909141816.58358-1-hdegoede@redhat.com> <20230909141816.58358-7-hdegoede@redhat.com>
 <CAHp75Ve888X7xJ0VrQfswaStL8C3SHXjnJV35O2ajZVq6=KfMQ@mail.gmail.com>
 <afda7862-3c36-98d8-43a3-dd67538de923@redhat.com> <CAMRc=MdmzPWeZ7CtFe2b6xZFAges2cD-ckq4vn-+52CG=tVRSA@mail.gmail.com>
 <ZP8OiuhvgLxAzmVE@smile.fi.intel.com>
In-Reply-To: <ZP8OiuhvgLxAzmVE@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 14:59:36 +0200
Message-ID: <CAMRc=McDsAz8VMgLdJQW0RVYZ9PjF3YDS0duO+8QJS5fMbpwqw@mail.gmail.com>
Subject: Re: [PATCH 6/8] platform/x86: x86-android-tablets: Stop using gpiolib
 private APIs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 11, 2023 at 2:56=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 11, 2023 at 02:49:44PM +0200, Bartosz Golaszewski wrote:
> > On Sun, Sep 10, 2023 at 1:26=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:
> > > On 9/10/23 10:24, Andy Shevchenko wrote:
> > > > On Sat, Sep 9, 2023 at 5:18=E2=80=AFPM Hans de Goede <hdegoede@redh=
at.com> wrote:
>
> ...
>
> > > >> +       gpiod =3D devm_gpiod_get(&x86_android_tablet_device->dev, =
con_id, dflags);
>
> ^^^
>
> > > >> -       *desc =3D gpiod;
> > > >> +       if (desc)
> > > >> +               *desc =3D gpiod;
> > > >
> > > > Are we expecting that callers may not want the GPIO descriptor out =
of
> > > > this function?
> > > > Sounds a bit weird if so.
> > >
> > > Yes specifically the Charge-enable and OTG (Vboost enable) pins on th=
e
> > > bq25892 charger on the Lenovo Yoga Tab 3 just need to be set to a fix=
ed
> > > value, so we request the pins with GPIOD_OUT_LOW / _HIGH and then
> > > leave them at that value.
> >
> > You mean you leak the descriptor? It would warrant either a comment or
> > storing the descriptor somewhere and cleaning it up if the device can
> > be unbound (I guess it can since the driver can be built as module).
>
> Note devm_*() above.
>

Ah, nevermind my comment then.

Bart
