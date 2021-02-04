Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFD4C43381
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 10:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A692964E0A
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 10:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235594AbhBDKhV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 05:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235515AbhBDKhQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 05:37:16 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180F6C061786
        for <platform-driver-x86@vger.kernel.org>; Thu,  4 Feb 2021 02:36:36 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id m7so3162064oiw.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VwdkegGeppc78dF2PFU6pSDmQfAtNSqd3Duj9DFoqr8=;
        b=f5k5VV21T0eHtIsE/JIjtzqo9tONCWAK9IKXqDwemmArJ4XNMjmiBMcQawzbRrnw0K
         YTiI8dvTWlk7wqWJ0idBIFmZiYOqtJiomc1CLXd7d+Vfpt3lfOTZ/Fgmk6npx6SDl6z4
         xgBDZACVLLFmvyZS2d2UTScH/IrGlFlvMZH60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VwdkegGeppc78dF2PFU6pSDmQfAtNSqd3Duj9DFoqr8=;
        b=gbCsU4DDJSf99TmdPrb8mac50OSnmeUaksKHSa3bTUYKdg9ZK1JTUgxUHxNyesqXfs
         m98R2kiMFy2uP7Fg/Qslt8Ey5p1yMly+GuehzeaTTG/FUy1gnkwIuXEpQom+sGMKO3/V
         0uaLQX8p/R75aWNlZvgMViilrxtJCKMu1yE3WTU1Y/TQzrurX185PE9MISbpvPFlamJR
         PdbFR1YuM+MBnzkq2a+qSLNVUvVzusLky8SxJOFc4TbkwjveIexdGubXzf9jRhewoVHu
         0KD3I6Q78wi9gcukEa4z0nNKtnxGDlxOchHL5xdci+5igyF4+/jNec7H+giYfge5rc53
         tjtg==
X-Gm-Message-State: AOAM531sOc8tlmS+1rxLANaezdcSgLCOL00i2M0CsOHqGLQaiT+5JOTx
        Ccsb7xst7OXuWVFWM7eTcSfcEp/6No6U3obev2k5og==
X-Google-Smtp-Source: ABdhPJwgzZ9kTem2s5DLPzCB4a5HVBFtTEcRM0YmzS/9yA8rya4DMJj9dUJa7RU7vqMUj0nMDTxqlj1goL3lY4CWp+g=
X-Received: by 2002:aca:df42:: with SMTP id w63mr4831731oig.128.1612434995408;
 Thu, 04 Feb 2021 02:36:35 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com> <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com> <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
In-Reply-To: <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 4 Feb 2021 11:36:24 +0100
Message-ID: <CAKMK7uEBaWMz-AjuJO3vvUBvacqMHuevOhMhQ0a+r5TtyDpwuQ@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Feb 4, 2021 at 11:19 AM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Wed, Feb 3, 2021 at 1:00 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> > > On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > Hi guys,
> > > >
> > > > This is first part of Intel MID outdated platforms removal. It's collected into
> > > > immutable branch with a given tag, please pull to yours subsystems.
> > >
> > > Hi Andy,
> > > Do you plan on eventually removing X86_INTEL_MID completely? If so,
> > > then I should probably start looking at removing the corresponding
> > > parts in GMA500.
> >
> > I have noticed new commits in DRM against GMA500 and it seems now in a
> > conflict with my immutable branch. Are you sure you don't forget to
> > pull it?
>
> Hi Andy, sorry I missed pulling the immutable branch before taking the
> gma500 medfield removal. I was unsure how to do that through drm-misc
> and it's tools so I got sidetracked. What would be the correct way to
> fix this?

Imo Linus can resolve this, it's pretty trivial, as long as both pull
requests point it out to him.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
