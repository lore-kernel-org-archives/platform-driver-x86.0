Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EB7C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 20:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3920A20793
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 20:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728859AbhAQUxZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 15:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbhAQUxY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 15:53:24 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B54C061573
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 12:52:44 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id x20so3018883pjh.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k7rkxFviIhZZGrYcBNp4fUuXsq1QJ+b6bDAXK1PyWRo=;
        b=kxEVzQNlCfHrcOM7bzsNdR3cnj294RuY9ZPZZX8uTC7IyOMV00MJBeybuXBqrzq3e1
         +7UtqIBViP4lN//mq+Hhn4xSO96mdzVinf+9A+5icKbOJR+EGJ0W+E49QbSfRHuqmLGc
         AexCCoWS1iX0JpT/zdNyP6D0QGSkuFvCVtcPdW9cqlHUNdwPp6OsjQ+BWLfYB9hOwnIa
         SqA5kI9Ba7Nt1b8ES8CtjG4ph5EF40wbeftkBS2TUVBplJJtFI3nM6A1yZQV5vakIChq
         0XRYI0cq31bPJCGeaGmWWCkn8jzjJiTg6v/FZ0tpsP0AF85BaIL5c+Y1tlTWlC2B1rhB
         lOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k7rkxFviIhZZGrYcBNp4fUuXsq1QJ+b6bDAXK1PyWRo=;
        b=EwqegfSWqazkOPeMsnLtmoSCVGqzTGJPH2gKEoj96qEWIbNyI1mCWiIxyae/LbCh7d
         zmNbWq9j8L7j4APm+Sj4RC7MabcPQF8SLrBPBmJuI0K1KEV0do6o7EXeTNhSv2DIQOdZ
         ByJ4PZk37I5+kROVkFiI6MMDmgWTmw/ngTfZKWt6ApZkNk4lPSDN13vsvw6lv6Tl2gR1
         lAZJAj2r5UEfX4CrqOrhWA+43E/62FJEJJWWWu0ioeHsf+42YmcddwRpPe1RGSfiGWpm
         Kdd+Y+l/z1BgkR7AWbM8ReFTLJ6BTgEBdi86pZsdJvMcRFHJR45pPwWWVMbH5uJ6wDN0
         aVEg==
X-Gm-Message-State: AOAM531i3a5Hgemur5aKcncem5nfSf8uOSyhyOZyVUhweNmu5KAsqsAp
        ou0qNKCM+sETxIv3bgLbeWNfPm9GfWDA7DEsPo2CNskNyrxfQA==
X-Google-Smtp-Source: ABdhPJzNpvyowka/xNgDOLbruSvDi727MpAdRDBuBK5fjOzs2iFuBSTYpqptLBnzOsVKM3NRZs/7Q6KPBLe1/e3LZzA=
X-Received: by 2002:a17:90a:6c90:: with SMTP id y16mr23116078pjj.129.1610916763891;
 Sun, 17 Jan 2021 12:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-14-pobrn@protonmail.com>
 <CAHp75VdfTjwN_5CusbzFExPxm=--ePoS7+YrUVSWzP=OqkE6+g@mail.gmail.com> <GFjexByUwomkq1jtqoU26Z0QnimZ4Q_erOtoX0L-oOMW46o28XbGSaMUEi-CPgLigJ-xTbKM6B19KPAczx6Z1OWcnTyqRVKMrXZD7cXVe4o=@protonmail.com>
In-Reply-To: <GFjexByUwomkq1jtqoU26Z0QnimZ4Q_erOtoX0L-oOMW46o28XbGSaMUEi-CPgLigJ-xTbKM6B19KPAczx6Z1OWcnTyqRVKMrXZD7cXVe4o=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 17 Jan 2021 22:52:27 +0200
Message-ID: <CAHp75VfbfJHPEiRSnvFMnB-eD0zWqGM+amc2-k3A0Ta2GkV3bQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] platform/x86: ideapad-laptop: rework
 is_visible() logic
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Jan 17, 2021 at 12:21 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail=
.com> wrote:
> 2021. janu=C3=A1r 16., szombat 20:58 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:
> > On Wed, Jan 13, 2021 at 8:23 PM Barnab=C3=A1s P=C5=91cze wrote:

...

> > > +       struct {
> > > +               bool hw_rfkill_switch     : 1,
> >
> > Does it make sense? Not to me.
> > Why not put all of them (I don't like comma and single occurrence of
> > the type, it may be problematic in the future) as unsigned int, or
> > something like that?
>
> I will add the full declaration for each, with type and semicolon in each
> line. Would you prefer the type to be `unsigned int` instead of `bool`, o=
r
> could you clarify what you mean by the second question?

I have no preference and in my code I can do either depending on the
case. But your below answer is fine, so choose what you prefer in this
case.

> > Also, is it okay to have bit fields (I mean from synchronization p.o.v.=
)?
>
> I am fairly certain it is since this bit-field is only ever written in
> `ideapad_check_features()` which is called from `ideapad_acpi_add()`. Apa=
rt from
> two instances they are only read indirectly by `ideapad_acpi_add()`, and =
even
> in those two cases if the values are read as false instead of their real
> value, it cannot cause significant issues as far as I see.

Okay, then choose what you prefer. Bit fields are beasts when it comes
to synchronization / concurrent access matter, but they will take less
size (when > 4, since bool usually takes 1 byte on some architectures
/ compilers).

> > > +                    fan_mode             : 1,
> > > +                    touchpad_ctrl_via_ec : 1,
> > > +                    conservation_mode    : 1,
> > > +                    fn_lock              : 1;
> > > +       } features;
> > >  };

--=20
With Best Regards,
Andy Shevchenko
