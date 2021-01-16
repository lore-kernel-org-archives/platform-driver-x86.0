Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D71C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 21:29:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 300E722D50
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 21:29:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbhAPV3D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 16:29:03 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:62465 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbhAPV3D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 16:29:03 -0500
Date:   Sat, 16 Jan 2021 21:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610832500;
        bh=t5pf+tDO5DNq/kFBzCnHvKPgmzLES4hcPkmkniTYLSU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=NyUpyD+LviEclzfsP15GvPKvoaKrd53uEoCiUyoJLuR9L3L5ZNmdoPPImm+ypaZeD
         RDzYs3wQpch40XZ9Q3ygp3v7Rdu7531uYiw8/Bt/jQUcUa2J+iO58V8HKVWeZxvAQU
         VymejuPPG96Xh/tSrh1nbhEAhHpFO+0qF2OIrWEs=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 08/24] platform/x86: ideapad-laptop: convert ACPI helpers to return -EIO in case of failure
Message-ID: <Y5RyLbh64gBPslboJJ0rxqdIg8lldbVQPqar-uz4zZpWfdrd6F4xxuBCRl3BUiNDjrAyhTVXyUw6ONopRxHkrMw3hN5zJuWaKTrDbMxPUog=@protonmail.com>
In-Reply-To: <CAHp75Vfgyy_awJB2MOvM=8rju6o-ZGLmtPbfsVBC68OowQvNHg@mail.gmail.com>
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-9-pobrn@protonmail.com> <CAHp75Vf-a4D0u6dmJso6jkHCXyCYGm-MFTgM08y2E_OiMr3qFg@mail.gmail.com> <NStEFinV-Kv0jDbXxLVig-6zyCjJmyjZkDDeZR29ZJrg_n4jkTBONiDde-4T1dId-t5HADf_QmVjs8LBQU601IDKwshLrQDKWiLGhAe2XFc=@protonmail.com> <CAHp75Vfgyy_awJB2MOvM=8rju6o-ZGLmtPbfsVBC68OowQvNHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. janu=C3=A1r 16., szombat 21:42 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:

> On Sat, Jan 16, 2021 at 10:28 PM Barnab=C3=A1s P=C5=91cze wrote:
> > > On Wed, Jan 13, 2021 at 8:22 PM Barnab=C3=A1s P=C5=91cze wrote:
> > > > ACPI helpers returned -1 in case of failure. Convert these function=
s to
> > > > return appropriate error codes, and convert their users to propagat=
e
> > > > these error codes accordingly.
> > >
> > > ...
> > >
> > > > -       int val;
> > > > +       int val, err;
> > > >         unsigned long int end_jiffies;
> > >
> > > Perhaps in this and other similar cases switch to reversed xmas tree
> > > order at the same time?
> > > [...]
> >
> > Thanks for the review; I intentionally tried to make as few modificatio=
ns
> > as possible in order to achieve what I wanted. I deemed it better to
> > place all "coding style"-related changes in their own patch (19).
> >
> > I would prefer to keep it this way. Do you have any objections?
>
> Yes I have. What you are doing is called ping-pong patch series style,
> which means it introduces / doesn't fix the (side) problem in the code
> it provides.
> It has no difference in this patch where to place a line which you have c=
hanged.
>
>  +       int val, err;
>          unsigned long int end_jiffies;
>
> is the same as
>
>          unsigned long int end_jiffies;
>  +       int val, err;
>

I see what you mean, sorry, please ignore what I said, it has no
relevance here. I'll change the order here and take a look at the
other commits with this in mind.


> I don't understand what "few modifications" you mentioned above?
> [...]

In other commits there were instances where I could've made
similar changes, but I chose not to, because I wanted to keep
the "stylistic" and functional changes separate.
For example, in patch 9:

@@ -353,9 +353,11 @@ static ssize_t show_ideapad_cam(struct device *dev,
 {
 =09unsigned long result;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09int err;

I did not change the order. Is that OK or do you think it'd be
preferable to change the order here as well?


Thanks,
Barnab=C3=A1s P=C5=91cze
