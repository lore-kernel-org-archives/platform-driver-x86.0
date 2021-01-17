Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19268C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 21:01:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5B4D22226
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 21:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729970AbhAQVB0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 16:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729755AbhAQVBW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 16:01:22 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A54E1C061573
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 13:00:42 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id p18so9655288pgm.11
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 13:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LXqDtedgTB74RhR8eUV9meKSuPXPVP5VRwUoH19TqI0=;
        b=l6H10H9w6hCRhTkEi2RL7ZVyXDe+ZhHZp003+mYuJ+yzkTiq7PGBW8Ki10mnEGQQyD
         8feCFmhH1TsU+dkfXUUFNiDbcYjQoWEj9BO0Yeki6JWRllENolNjMeH66NNl58ISHsUB
         //IwX6B/3fI7hwjXlw9GRGMDes1pyUKUfnu7HKKElJw7dZHluOMpUiqUJDzdTYkaV3JU
         5feDJYa0Bw2yQGmIX+pD5Q7Vg0Yo4NnP9HfvJ4jPWzMLpE3WkoQWj0AV1X7AEvGMTSQV
         95raayeqwEHamRZl/ruPvoBIz6xF+7cmM/GK8ex5GqFvb4JMWO3513x0Eai0pw536VNU
         419w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LXqDtedgTB74RhR8eUV9meKSuPXPVP5VRwUoH19TqI0=;
        b=B79gk8M3naqruyD88HhaOw83icyV3+2MtmcpPFWWfn//8RFbJMj2Ep6IO1KZ0S9NTL
         P0VZ/wYQgN8WKYAEEKMWMk2d2lHnFibmNIeWPuxJzCGdMjXlk1Zk3p3DcG3DsTlLEcUJ
         C8DBAtvIEeO/J8lib1zA8aNRTfD2zu/Lw0Jjjh+6UfasCLUHo3alYuGq0kNcLq1kOvbe
         F4JxxlckibZAKQz4nWHdCUEBhiodlw2IMaU+50HXbQPogeStAq7zeqRYwj9JEV14hhvc
         K0TEBIx1kYGzQND37PE0ZJqFdcwM/5hGnILUDAo4U9cBJYhfjC0Wk0xLo/SXHZFYB7da
         3QNA==
X-Gm-Message-State: AOAM532M1kz3g57d7UzA92n/bUd0bvY1wqhv1qT+OmgMPGQeMEd5IVLL
        Mnyad0dN/rWVKcTdr54OA0zRz7b1rJlmoP5qwKU=
X-Google-Smtp-Source: ABdhPJz43Ls/HKuGjlmm6pQUKMd42Y49LHI08TemypjpQVWYV5QV3lI41JjH9wBJKk8COwIjnBNqOX/Ongo6YePT+Q8=
X-Received: by 2002:a63:4b16:: with SMTP id y22mr23048736pga.203.1610917242101;
 Sun, 17 Jan 2021 13:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-11-pobrn@protonmail.com>
 <CAHp75VfQHmFT1Oqup_+XvnNTwuMpo75JNWNmorsAf1v-6b2TnA@mail.gmail.com> <UPsRV_eoitiLZOqi6Wtl9WOvpm_3CsWGTvBJBNc_McovSMgkzeCS_2ZxCNj4Ymc8wvp6P4ZvPTSUWhvE-BCoAV9LNjUAzwV7enolECurkUo=@protonmail.com>
In-Reply-To: <UPsRV_eoitiLZOqi6Wtl9WOvpm_3CsWGTvBJBNc_McovSMgkzeCS_2ZxCNj4Ymc8wvp6P4ZvPTSUWhvE-BCoAV9LNjUAzwV7enolECurkUo=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 17 Jan 2021 23:00:26 +0200
Message-ID: <CAHp75VeU1Z4n9Pyoxisjje-1bD0k9cnG+ZN75QNNAaS-mNSUHQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/24] platform/x86: ideapad-laptop: misc. device
 attribute changes
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

On Sat, Jan 16, 2021 at 11:54 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail=
.com> wrote:
> 2021. janu=C3=A1r 16., szombat 20:52 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:
> > On Wed, Jan 13, 2021 at 8:23 PM Barnab=C3=A1s P=C5=91cze wrote:

...

> > > -       if (sscanf(buf, "%i", &state) !=3D 1)
> > > -               return -EINVAL;
> > > +       ret =3D kstrtouint(buf, 0, &state);
> > > +       if (ret)
> > > +               return ret;
> >
> > This seems to me a relaxing case, and should be 10 instead of 0. Am I
> > right about %i?
> > If it's true it's probably minor, but still an ABI breakage.
>
> According to the latest C99 draft[1] (7.19.6.2):
>
>   [The 'i' format specifier] Matches an optionally signed integer, whose =
format
>   is the same as expected for the subject sequence of the strtol function=
 with
>   the value 0 for the base argument. The corresponding argument shall be =
a pointer
>   to signed integer.

> Skimming over `vsscanf()`, I'm fairly sure it implements the same behavio=
ur.
> So '0' as the base is correct, I believe.

Ah, okay, good to know. I assumed that %i is decimal only.
Thanks!

>  But technically it's still an ABI
> breakage since negative numbers are no longer accepted. In the case of
> `store_ideapad_fan()` it changes nothing since there was bounds checking =
in place.
> In the case of `store_ideapad_cam()` negative numbers are now rejected. I=
'm not
> sure if this change should be of great concern, since the the documentati=
on only
> mentions '0' and '1', and I would be surprised if anyone used this interf=
ace
> to send negative numbers to the embedded controller.

If it's only 0 / 1 perhaps you may go further and make it bool
(kstrtobool() API)?

> [1]: https://wg14.link/c99



--=20
With Best Regards,
Andy Shevchenko
