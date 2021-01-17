Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911DDC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 21:05:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C83922475
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 21:05:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730050AbhAQVFB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 16:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729202AbhAQVFA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 16:05:00 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B066C061575
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 13:04:20 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id z21so9692672pgj.4
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 13:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t3S5gZJEavSA/ffgm3qBvjsucxhu0DZFd54r0dqx/CU=;
        b=MKd2AmgQmwr7DKUXgpXZzKZ9Ux7tWAWkTiOY36TfHcTVLrgsc4WvKQEGez8s5m88r8
         lEjIcdH8LhfZxoEsitfIs7NpbYfZ8vzG75Ef1Gb87q60RxhaFofOs46/P4vxpnkMuABd
         Nj9/EpcqEElxKTRDiAXDS/jePUm/n8ginMQt9+DenxwXYAdaD87Cqedz2RuK54+qqPpu
         fQk05bnNwG3gNVsn62m9kKk0lLxo8D5POJYhPgnMjw7HIeyA+tasixBnj1tYKyYHygDq
         p1yDhs7IklNGNUSyBIPmw9+u4774rdeZgtaKROaK4apGknEFMZPUgQ14JeFjrhFHaVh6
         s3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t3S5gZJEavSA/ffgm3qBvjsucxhu0DZFd54r0dqx/CU=;
        b=ulWMOdKv5srJoB60sjswDVj5XZtNFOos27Glv2X+8KAMZuW90jjvEP4vdOeWPaR5Kp
         XfMXkvVsVRr4EltSwFv2nWOwkq+8rJa2QLJrXA2POJVunBb5fhgU145IAcmjXac1P/FC
         w3ZyC1ocNhdWWeCMk+0FOKUb2QshZPkuzE/KOxAJJ0jnl8jK8/q2ypteMdjUPhxLCi8N
         UrPnnq2za/KwcnURhiz+Beu6P/zWqcklsXRdfO1v+/70dogHKRUwgzQPExpdAQYapyk3
         cWxJGyvYu4c+DTkZXMKc9CbN9HlhxLLeg0hrfLgD88PHCDo4U7sdL9syefqGxXhkCd8x
         BL0w==
X-Gm-Message-State: AOAM532KOd2ZTERHMF47fEHEHnpvkZ2kmwV+DroA0ShsojBg/qMIlCem
        dLMBJaBwqwPbj3buuPt5xRgbBuhvQVP9PlA6gH28KBBlw9cKuQ==
X-Google-Smtp-Source: ABdhPJydXXeLbMggVUBnhDT2Aicf8eBhqbIhCQ+bj98x39Dbe2Gk0BLzC3lXavQaXW+Af6nI2vDubzaTnsPaqbGOolo=
X-Received: by 2002:a65:644b:: with SMTP id s11mr6708085pgv.4.1610917460101;
 Sun, 17 Jan 2021 13:04:20 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-9-pobrn@protonmail.com>
 <CAHp75Vf-a4D0u6dmJso6jkHCXyCYGm-MFTgM08y2E_OiMr3qFg@mail.gmail.com>
 <NStEFinV-Kv0jDbXxLVig-6zyCjJmyjZkDDeZR29ZJrg_n4jkTBONiDde-4T1dId-t5HADf_QmVjs8LBQU601IDKwshLrQDKWiLGhAe2XFc=@protonmail.com>
 <CAHp75Vfgyy_awJB2MOvM=8rju6o-ZGLmtPbfsVBC68OowQvNHg@mail.gmail.com> <Y5RyLbh64gBPslboJJ0rxqdIg8lldbVQPqar-uz4zZpWfdrd6F4xxuBCRl3BUiNDjrAyhTVXyUw6ONopRxHkrMw3hN5zJuWaKTrDbMxPUog=@protonmail.com>
In-Reply-To: <Y5RyLbh64gBPslboJJ0rxqdIg8lldbVQPqar-uz4zZpWfdrd6F4xxuBCRl3BUiNDjrAyhTVXyUw6ONopRxHkrMw3hN5zJuWaKTrDbMxPUog=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 17 Jan 2021 23:04:03 +0200
Message-ID: <CAHp75VcD-hYksrJH=6-7uqd_doCAn315omJUEiMs0eF+93L9zg@mail.gmail.com>
Subject: Re: [PATCH v2 08/24] platform/x86: ideapad-laptop: convert ACPI
 helpers to return -EIO in case of failure
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

On Sat, Jan 16, 2021 at 11:28 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail=
.com> wrote:
> 2021. janu=C3=A1r 16., szombat 21:42 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:
> > On Sat, Jan 16, 2021 at 10:28 PM Barnab=C3=A1s P=C5=91cze wrote:

...

> > It has no difference in this patch where to place a line which you have=
 changed.
> >
> >  +       int val, err;
> >          unsigned long int end_jiffies;
> >
> > is the same as
> >
> >          unsigned long int end_jiffies;
> >  +       int val, err;

(1)

> > I don't understand what "few modifications" you mentioned above?
> > [...]
>
> In other commits there were instances where I could've made
> similar changes, but I chose not to, because I wanted to keep
> the "stylistic" and functional changes separate.
> For example, in patch 9:
>
> @@ -353,9 +353,11 @@ static ssize_t show_ideapad_cam(struct device *dev,
>  {
>         unsigned long result;
>         struct ideapad_private *priv =3D dev_get_drvdata(dev);
> +       int err;

(2)

> I did not change the order. Is that OK or do you think it'd be
> preferable to change the order here as well?

I see, The case (1) above is different to this. and actually in (2)
you do right.
And I agree that in latter case (2) the stylistic should be *a
separate* change, which is completely the right thing to do.

--=20
With Best Regards,
Andy Shevchenko
