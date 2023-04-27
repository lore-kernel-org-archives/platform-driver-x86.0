Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F93C77B61
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Apr 2023 16:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243788AbjD0QhV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Apr 2023 12:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243284AbjD0QhU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Apr 2023 12:37:20 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F402120
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Apr 2023 09:37:19 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f1950f5676so75933725e9.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Apr 2023 09:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682613437; x=1685205437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1cDdkrDr/ckaXGEA+XhuQdaO4KiFVU70vZoExJ7H9o=;
        b=dmjSQlK8IXVWCe6nDLEm/ws6XRVP15I56Cvy/ryqsGWrxobOYeuN8h1v0HxKr10jEq
         IbQsmq/l0aE3m4mY5JwjURv50/Spn9JC0GQhi08mrc01L1oUHJ2bQvFWDulmpiSmcNXY
         kLiBSrolkEonVrMTRg286ZqqKDrnB8kHN9ADDyNg/b3TpzBLI0X+y2CaxuoaRU3eLdHF
         NTGL3ylpRM0f2Uh9Vb1VvP5+GgoASanfYVBBiA/yY6ci02PG47tY0zV7R/ILCTrtPRc4
         nvQwA3rIJvyszfuoOxka9o9J/8TBdt5z4uOQG9gpcUQzXGYIdXw/gyFVmwp3H3iy6yHh
         kx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682613437; x=1685205437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1cDdkrDr/ckaXGEA+XhuQdaO4KiFVU70vZoExJ7H9o=;
        b=lp0TgsDcvMZUb3nQUbi4CTPZOghw5APjV9QGeho9k7llioBdhcLp7D+vsKF3JnXODo
         JQ0HjihT9KJMol5XZTGuuaOMntN6FNLXIwEGKts+GiE0MkXI9oX2L4CYXGxuvwORxg86
         UO/Yg3AqEkb9cFQxOTPqfZZrTXsCALa1XM355GfmBimWSf+I+Yq6Q3Vb/H+13KPH24q3
         jhWuHNl+mMKWGGqyxu3qwc4rZihWE0yzYdutXXBfyRmrwwdqCfYhLDIaJM7T/4hoTiit
         3YamPdV1pg8PSVmaqmW0YiG2V13slRej28tMLhE4CHVSKrZUGxAc5eoY+N2T99lKKERw
         F5UQ==
X-Gm-Message-State: AC+VfDyCedpvdufCeJI6doZnxz6/f+PAL1bq6Enl2m5H0dYh2BRNiLzs
        PEte16RyTlT89E72l22ZseQmi3LP4fRwIjhRBCM=
X-Google-Smtp-Source: ACHHUZ7YvHMGDRq67pwCJHq9TVpEr4nTvuDYwk2flUjRgwUtmSlbJk4qOJXWWaReUDleisv8tZl4GxJrUalw/R8w+v0=
X-Received: by 2002:adf:ecc6:0:b0:304:760c:6470 with SMTP id
 s6-20020adfecc6000000b00304760c6470mr1636322wro.36.1682613437506; Thu, 27 Apr
 2023 09:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <Y+JbBiMJw+VLo2Nr@mail.gmail.com> <CAD2FfiGLH87H6CVbHimXUfz7ESUKwO8k1ABCgKU9L2SnfGanTA@mail.gmail.com>
 <PH0PR84MB1953825BC90B268904C6C7E5A8D89@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
 <CAD2FfiFUEMupUBoWj2hq9ep=R0Sk-xgBscXqMPefAipvoCg8eg@mail.gmail.com>
 <Y+QXXXX1u33Eyf4E@mail.gmail.com> <CAD2FfiEj87WiByKMXrLP7zrj-_gNrNKTh6v6naCxapbVBDcEGw@mail.gmail.com>
 <PH0PR84MB195313DBC8EF15354C260D5DA8679@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
 <PH0PR84MB1953774AE5A9A238928E1CEAA8649@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB1953774AE5A9A238928E1CEAA8649@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
Date:   Thu, 27 Apr 2023 19:36:51 +0300
Message-ID: <CAKErNvo7x+ONMuAnbmiCfydbOkyx6JEcVKw05sjAXs4U=i13dQ@mail.gmail.com>
Subject: Re: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
To:     "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
Cc:     Richard Hughes <hughsient@gmail.com>,
        Alex Hung <alexhung@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Enver Balalic <balalic.enver@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 25 Apr 2023 at 18:05, Lopez, Jorge A (Security)
<jorge.lopez2@hp.com> wrote:
>
> Hi Richard,
>
> I reached out to BIOS team and here is their response.  Let me know if ad=
ditional information is needed.

Hi Jorge!

Thanks a lot for getting a response from the BIOS team.

> >> HP Elite Dragonfly Max/Dragonfly G2 Notebook PC T90 System Update is i=
n 'Embargo State', so it is not officially released.
> >> Customer should wait until the version below is finalized and moved to=
 Stable state.

This clearly doesn't match what I see on LVFS:

https://fwupd.org/lvfs/devices/com.hp.laptop.system.T90.firmware

01.11.00 and 01.12.00 are both marked as stable here, and fwupd
suggests these versions for an upgrade. What do they mean when they
say it's not officially released and not in the stable state?

> >> HP Elite Dragonfly Max/Dragonfly G2 Notebook PC T90 System Update
>
> >> BTW, the name on LVFS will be changed per customer request in CQ2 refr=
esh.  Customers want to have product names included in the name.  The last =
columns in tables are the name to be displayed on LVFS from CQ2 refresh.  S=
ee attached JPEG for upcoming LVFS name changes in CQ2 refresh.

That's a great change, having the laptop name explicitly will be much clear=
er.

>
>
> Regards,
>
> Jorge Lopez
> HP Inc
>
> =E2=80=9COnce you stop learning, you start dying=E2=80=9D
> Albert Einstein
>
> > -----Original Message-----
> > From: Lopez, Jorge A (Security)
> > Sent: Monday, April 24, 2023 9:18 AM
> > To: Richard Hughes <hughsient@gmail.com>; Maxim Mikityanskiy
> > <maxtram95@gmail.com>
> > Cc: Alex Hung <alexhung@gmail.com>; Hans de Goede
> > <hdegoede@redhat.com>; Mark Gross <markgross@kernel.org>; platform-
> > driver-x86@vger.kernel.org; Kai-Heng Feng <kai.heng.feng@canonical.com>=
;
> > Mario Limonciello <mario.limonciello@amd.com>; Barnab=C3=A1s P=C5=91cze
> > <pobrn@protonmail.com>; Rishit Bansal <rishitbansal0@gmail.com>; Enver
> > Balalic <balalic.enver@gmail.com>
> > Subject: RE: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
> >
> > Hi Richard,
> >
> > I am sorry no response has been given to Maxim's enquiry.   Let me
> > approach the BIOS team and see what I can do from my end.
> >
> >
> > Regards,
> >
> > Jorge Lopez
> > HP Inc
> >
> > =E2=80=9COnce you stop learning, you start dying=E2=80=9D
> > Albert Einstein
> >
> > > -----Original Message-----
> > > From: Richard Hughes <hughsient@gmail.com>
> > > Sent: Monday, April 24, 2023 5:37 AM
> > > To: Maxim Mikityanskiy <maxtram95@gmail.com>
> > > Cc: Lopez, Jorge A (Security) <jorge.lopez2@hp.com>; Alex Hung
> > > <alexhung@gmail.com>; Hans de Goede <hdegoede@redhat.com>; Mark
> > Gross
> > > <markgross@kernel.org>; platform-driver-x86@vger.kernel.org; Kai- Hen=
g
> > > Feng <kai.heng.feng@canonical.com>; Mario Limonciello
> > > <mario.limonciello@amd.com>; Barnab=C3=A1s P=C5=91cze
> > <pobrn@protonmail.com>;
> > > Rishit Bansal <rishitbansal0@gmail.com>; Enver Balalic
> > > <balalic.enver@gmail.com>
> > > Subject: Re: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly
> > G2
> > >
> > > CAUTION: External Email
> > >
> > > On Wed, 8 Feb 2023 at 21:43, Maxim Mikityanskiy
> > <maxtram95@gmail.com>
> > > wrote:
> > > > > Okay, now I'm double confused; the only HP Elite Dragonfly G2
> > > > > firmware on the LVFS has never been in any stable branch.
> > >
> > > Ahh, I didn't expect T90 as the firmware name; found it.
> > >
> > > I emailed the BIOS team some time ago and asked them for a response
> > > but got nothing back. Sorry this happened to you -- vendors are under
> > > strict instructions never to break things like this for a security up=
date.
> > >
> > > Jorge, can you communicate this more clearly internally please and le=
t
> > > me know what to do about the LVFS updates please.
> > >
> > > Richard
>
