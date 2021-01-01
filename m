Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5496C433E0
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Jan 2021 17:10:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 670DB2223E
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Jan 2021 17:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbhAARKZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 1 Jan 2021 12:10:25 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:64298 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbhAARKZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Jan 2021 12:10:25 -0500
Date:   Fri, 01 Jan 2021 17:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609520982;
        bh=9nDRhWVbIPYa9jXCnHS9eZKqREOFmvqW3WxHDbQpUz8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Me/rkEAWLroKi11cO6Y1g2VONn89e/Da43ZQSt5zJMmJ+VLglSlXjPlBzlJDK+hbp
         wnxj7FrCxc4pD9XBg+6UWX7OLOC4+Jkmc3tbBQMv9ONj1HIAE4TOq6eh4yV6NGc83A
         gZ/JFFlZ3Vj60AVKKzfuyXPYCKp1UG6jL8tCZIWg=
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Ike Panhc <ike.pan@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add has_touchpad_switch
Message-ID: <XVSpzJf9TdCi-rg53vfxB7yLg8VJQsQVbqoC1Fu1L7tL5mPKCpMABkedQNatITMiUy7pvBC7g0Cqd30-zqc0bCsSSoy5YXp_gJLTLM0odTg=@protonmail.com>
In-Reply-To: <bcb3bc76-da83-4ee1-8c2d-0453d359ae37@www.fastmail.com>
References: <20210101061140.27547-1-jiaxun.yang@flygoat.com> <_kQDaYPt7vh_mQfPr1tLJV2IP-p40OBPcU5zk-1xHhF9XJsm8Y-efANBgiRdWU-J2QTtOjmrfE0Tw6UrZpm6uG-zZGlfpaVOp9FuoKAbjzA=@protonmail.com> <bcb3bc76-da83-4ee1-8c2d-0453d359ae37@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. janu=C3=A1r 1., p=C3=A9ntek 17:08 keltez=C3=A9ssel, Jiaxun Yang =
=C3=ADrta:

> [...]
> > > @@ -1006,6 +1018,10 @@ static int ideapad_acpi_add(struct platform_de=
vice *pdev)
> > >  =09if (!priv->has_hw_rfkill_switch)
> > >  =09=09write_ec_cmd(priv->adev->handle, VPCCMD_W_RF, 1);
> > >
> > > +=09/* The same for Touchpad */
> > > +=09if (!priv->has_touchpad_switch)
> > > +=09=09write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, 1);
> > > +
> >
> > Shouldn't it be the other way around: `if (priv->has_touchpad_switch)`?
>
> It is to prevent accidentally disable touchpad on machines that do have E=
C switch,
> so it's intentional.
> [...]

Sorry, but the explanation not fully clear to me. The commit message seems =
to
indicate that some models "do not use EC to switch touchpad", and I take th=
at
means that reading from VPCCMD_R_TOUCHPAD will not reflect the actual state=
 of the
touchpad and writing to VPCCMD_W_TOUCHPAD will not change the state of the =
touchpad.

But then why do you still write to VPCCMD_W_TOUCHPAD on devices where suppo=
sedly
this does not have any effect (at least not the desired one)? And the part =
of the
code I made my comment about only runs on machines on which the touchpad su=
pposedly
cannot be controlled by the EC. What am I missing?

And there is the other problem: on some machines, this patch removes workin=
g
functionality.


Regards,
Barnab=C3=A1s P=C5=91cze
