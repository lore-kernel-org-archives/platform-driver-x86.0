Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9589C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 21:55:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EB622245C
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 21:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbhAPVz1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 16:55:27 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:39849 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbhAPVzW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 16:55:22 -0500
Date:   Sat, 16 Jan 2021 21:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610834078;
        bh=bNTL5eFQsOQVRz9PRJ1Chz3ju+Xo3wWeYARwwZAK1II=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=rwqSk0WEN3bOQxPaYVg6Gs59PHRFjkpsJeWtLRkB6+C76Vkotikmqvui7iiw+XVlN
         h5ePCg2BbunJebtQMkoWnDwO/81jQZUTse/+iY25uuRfhaHiPdFfTFWmS8dG+LlpOF
         zF7OO4VfkNwkafk38EUZeG/eWar5DnkpsXQdvpyU=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 10/24] platform/x86: ideapad-laptop: misc. device attribute changes
Message-ID: <UPsRV_eoitiLZOqi6Wtl9WOvpm_3CsWGTvBJBNc_McovSMgkzeCS_2ZxCNj4Ymc8wvp6P4ZvPTSUWhvE-BCoAV9LNjUAzwV7enolECurkUo=@protonmail.com>
In-Reply-To: <CAHp75VfQHmFT1Oqup_+XvnNTwuMpo75JNWNmorsAf1v-6b2TnA@mail.gmail.com>
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-11-pobrn@protonmail.com> <CAHp75VfQHmFT1Oqup_+XvnNTwuMpo75JNWNmorsAf1v-6b2TnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. janu=C3=A1r 16., szombat 20:52 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:

> On Wed, Jan 13, 2021 at 8:23 PM Barnab=C3=A1s P=C5=91cze wrote:
> >
> > Do not handle zero length buffer separately. Use kstrtouint() instead
> > of sscanf().
>
> ...
>
> > -       int ret, state;
> > +       int ret;
> >         struct ideapad_private *priv =3D dev_get_drvdata(dev);
> > +       unsigned int state;
>
> Reversed xmas tree order?
>

I'll change the order.


> ...
>
> > -       if (sscanf(buf, "%i", &state) !=3D 1)
> > -               return -EINVAL;
> > +       ret =3D kstrtouint(buf, 0, &state);
> > +       if (ret)
> > +               return ret;
>
> This seems to me a relaxing case, and should be 10 instead of 0. Am I
> right about %i?
> If it's true it's probably minor, but still an ABI breakage.
>

According to the latest C99 draft[1] (7.19.6.2):


  [The 'i' format specifier] Matches an optionally signed integer, whose fo=
rmat
  is the same as expected for the subject sequence of the strtol function w=
ith
  the value 0 for the base argument. The corresponding argument shall be a =
pointer
  to signed integer.

Skimming over `vsscanf()`, I'm fairly sure it implements the same behaviour=
.
So '0' as the base is correct, I believe. But technically it's still an ABI
breakage since negative numbers are no longer accepted. In the case of
`store_ideapad_fan()` it changes nothing since there was bounds checking in=
 place.
In the case of `store_ideapad_cam()` negative numbers are now rejected. I'm=
 not
sure if this change should be of great concern, since the the documentation=
 only
mentions '0' and '1', and I would be surprised if anyone used this interfac=
e
to send negative numbers to the embedded controller.



[1]: https://wg14.link/c99


Regards,
Barnab=C3=A1s P=C5=91cze
