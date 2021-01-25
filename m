Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F76C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 19:16:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56BA620724
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Jan 2021 19:16:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbhAZFx1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:53:27 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:47400 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbhAYO0N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 09:26:13 -0500
Date:   Mon, 25 Jan 2021 14:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1611584717;
        bh=hhml5AdjbIo/g+2Kesx1pwLji3prB2AMMCsH1sVdEmk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=MqzKimTVnQE27IbxDQhWwceQ7xh+sXjJ+/byvuRB28kI8dXJfu+esveTs0a0EdX0l
         LAxUHx3cRlb3BQgfbHWxcieFpyjqneFH/MEJxysucIUShLG851x4nSFBpvu1U71wye
         q/oPXbk3bcsTBIbZ51LcSXiVCq9XcPUp4a5pAJFM=
To:     Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 19/24] platform/x86: ideapad-laptop: fix checkpatch warnings, more consistent style
Message-ID: <TXigp22dYRHpj9NGdW-AiIOXJ3Dw0nQekdM2-qPzg1-sWptIoclYx_7uLW1EXlmosD36C7Ozg7gtFs5qhcgpCbN1fpUPeJgCmUyRh5-173g=@protonmail.com>
In-Reply-To: <0ef8c308-a995-52c2-0762-f6aae1efb86c@canonical.com>
References: <20210113182016.166049-20-pobrn@protonmail.com> <0ef8c308-a995-52c2-0762-f6aae1efb86c@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. janu=C3=A1r 25., h=C3=A9tf=C5=91 9:55 keltez=C3=A9ssel, Ike Panhc =
=C3=ADrta:

> On 1/14/21 2:22 AM, Barnab=C3=A1s P=C5=91cze wrote:
> > Fix (almost all) checkpatch warnings. Reorder variable definitions from
> > longest to shortest. Add more whitespaces for better readability. Renam=
e
> > variables named `ret` to `err` where appropriate.
> >
> > Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >
> > @@ -265,30 +280,40 @@ static int debugfs_status_show(struct seq_file *s=
, void *data)
> >
> >  =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &value))
> >  =09=09seq_printf(s, "Backlight max:\t%lu\n", value);
> > +
> >  =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL, &value))
> >  =09=09seq_printf(s, "Backlight now:\t%lu\n", value);
> > +
> >  =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &value))
> >  =09=09seq_printf(s, "BL power value:\t%s (%lu)\n", value ? "on" : "off=
", value);
> > +
> >  =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
> >
> >  =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_RF, &value))
> >  =09=09seq_printf(s, "Radio status:\t%s (%lu)\n", value ? "on" : "off",=
 value);
> > +
> >  =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_WIFI, &value))
> >  =09=09seq_printf(s, "Wifi status:\t%s (%lu)\n", value ? "on" : "off", =
value);
> > +
> >  =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BT, &value))
> >  =09=09seq_printf(s, "BT status:\t%s (%lu)\n", value ? "on" : "off", va=
lue);
> > +
> >  =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_3G, &value))
> >  =09=09seq_printf(s, "3G status:\t%s (%lu)\n", value ? "on" : "off", va=
lue);
> > +
> >  =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
> >
> >  =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value))
> >  =09=09seq_printf(s, "Touchpad status:\t%s (%lu)\n", value ? "on" : "of=
f", value);
> > +
> >  =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
> >  =09=09seq_printf(s, "Camera status:\t%s (%lu)\n", value ? "on" : "off"=
, value);
> > +
> >  =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
> >
> >  =09if (!eval_gbmd(priv->adev->handle, &value))
> >  =09=09seq_printf(s, "GBMD: %#010lx\n", value);
> > +
> >  =09if (!eval_hals(priv->adev->handle, &value))
> >  =09=09seq_printf(s, "HALS: %#010lx\n", value);
> >
>
> checkpatch.pl suggests empty lines? I think they are doing the same thing=
. It's better
> to put them tightly.
>
> --
> Ike

I added them at my own discretion, and I don't recall checkpatch suggesting
it, so if you want to, I can remove them, but I'd like to keep one empty
line before and after

  seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D\n");

.

What do you think?


Regards,
Barnab=C3=A1s P=C5=91cze
