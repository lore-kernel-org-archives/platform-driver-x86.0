Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA34C77B73
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 May 2023 13:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbjEAN7Z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 May 2023 09:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbjEAN7Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 May 2023 09:59:24 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457F910C3
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 May 2023 06:59:15 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f173af665fso14179045e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 May 2023 06:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682949553; x=1685541553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT/4/s8s/MXZrVQKz5nsFO6s4oGGm/JF9yEnisYWo6s=;
        b=Dd3FYtdCPlmqoK99A9wkD+73Po3Q/BmKkg1CRmS3RIxymSMxRS8b7hfy9KaKHgVse+
         pAKpzOwz45aKczgFNMTs0GHx9y+XZctApYByPeWOae6EUuGdgt4t9VMFZqjV0fyc22BT
         XsCUlcBmZTzVIZmbYJNk0/dsHk/BeKj+Vp32Br2O6doiGJlnXulFFlHTjkupearlmbvx
         ePvNaCOasUvN71KAxcWqAVAoJn7Ey764b4UKX19rzfgZHRLbdJVkVZiWIs+kMG7QjovT
         mCDmYl4Dt4IzBuDli92BLGtGF0BhT0idbAYod4Y9f6a65pxigaWx7Kpb8N7i+nEYuNcR
         daAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682949553; x=1685541553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GT/4/s8s/MXZrVQKz5nsFO6s4oGGm/JF9yEnisYWo6s=;
        b=Mnr/booGqGlC2npHtvLIUETS7/N3huQsyXFdkqQaLb+VpySKBa8/MYhh6B8XTSqL7c
         4rpjpqbswGCeAlTUR+DSsg3Tbg8fn4S80I6HFWE0tYa2klqZNS5rak7LgBrqwLhMZAKH
         5fUj2pqpFQDT7SX19oomQ2WIxo7Rd5QxS1lSH3bxDvGvsBQiAaMjtu8nbHahmuEzB5CH
         WdrBx4pwxeVRnRA36my0nPkBPkU+Wdb3PvP32CJPOT10YCotKMIwR0EzSu1WCZ5Fz4m1
         Jf2jNABl6M9SxdAH3gEChoKa4eFeybGHTvswFF7EExJHAVDIO5ZNeZv5z/o9ZkXfUVN6
         xGbA==
X-Gm-Message-State: AC+VfDzsRIKCMtA7QeZSUy14l9mHo2XeK3PGW2LKYieo3ENIVQwuSqlT
        15rCbmIMjadGVFbJyzpVKR2SH28Jmdzt25q4Wb4=
X-Google-Smtp-Source: ACHHUZ7w5kTncG2t3T7HM5FjdQW07gepiykr+O/xW0I6K5dhW4rkewtZZtWQEljyrICogFlmhXPseZtzVpY9H+2ai10=
X-Received: by 2002:adf:e649:0:b0:306:2830:224f with SMTP id
 b9-20020adfe649000000b003062830224fmr3651672wrn.23.1682949553517; Mon, 01 May
 2023 06:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <Y+JbBiMJw+VLo2Nr@mail.gmail.com> <CAD2FfiGLH87H6CVbHimXUfz7ESUKwO8k1ABCgKU9L2SnfGanTA@mail.gmail.com>
 <PH0PR84MB1953825BC90B268904C6C7E5A8D89@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
 <CAD2FfiFUEMupUBoWj2hq9ep=R0Sk-xgBscXqMPefAipvoCg8eg@mail.gmail.com>
 <Y+QXXXX1u33Eyf4E@mail.gmail.com> <CAD2FfiEj87WiByKMXrLP7zrj-_gNrNKTh6v6naCxapbVBDcEGw@mail.gmail.com>
 <PH0PR84MB195313DBC8EF15354C260D5DA8679@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
 <PH0PR84MB1953774AE5A9A238928E1CEAA8649@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
 <CAKErNvo7x+ONMuAnbmiCfydbOkyx6JEcVKw05sjAXs4U=i13dQ@mail.gmail.com> <PH0PR84MB195361F00A2ADD103FECAF57A86A9@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB195361F00A2ADD103FECAF57A86A9@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
Date:   Mon, 1 May 2023 16:58:47 +0300
Message-ID: <CAKErNvorEaf8DUy0MBYpahZe5ppBz7DW+t8wgdy9y=Hjc8pJ6w@mail.gmail.com>
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

On Thu, 27 Apr 2023 at 22:26, Lopez, Jorge A (Security)
<jorge.lopez2@hp.com> wrote:
>
> Hi Maxim,
>
>
> From: Maxim Mikityanskiy <maxtram95@gmail.com>
> Sent: Thursday, April 27, 2023 11:37 AM
> To: Lopez, Jorge A (Security) <jorge.lopez2@hp.com>
> Cc: Richard Hughes <hughsient@gmail.com>; Alex Hung <alexhung@gmail.com>;=
 Hans de Goede <hdegoede@redhat.com>; Mark Gross <markgross@kernel.org>; pl=
atform-driver-x86@vger.kernel.org; Kai-Heng Feng <kai.heng.feng@canonical.c=
om>; Mario Limonciello <mario.limonciello@amd.com>; Barnab=C3=A1s P=C5=91cz=
e <pobrn@protonmail.com>; Rishit Bansal <rishitbansal0@gmail.com>; Enver Ba=
lalic <balalic.enver@gmail.com>
> Subject: Re: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
>
> CAUTION: External Email
> On Tue, 25 Apr 2023 at 18:05, Lopez, Jorge A (Security)
> <mailto:jorge.lopez2@hp.com> wrote:
> > >
> > > Hi Richard,
> > >
> > > I reached out to BIOS team and here is their response. Let me know if=
 additional information is needed.
>
> > > Hi Jorge!
>
> > Thanks a lot for getting a response from the BIOS team.
>
> You are welcome.  Sorry it took so long to get a response.
>
> > > >> HP Elite Dragonfly Max/Dragonfly G2 Notebook PC T90 System Update =
is in 'Embargo State', so it is not officially released.
> > > >> Customer should wait until the version below is finalized and move=
d to Stable state.
>
> > This clearly doesn't match what I see on LVFS:
>
> > https://fwupd.org/lvfs/devices/com.hp.laptop.system.T90.firmware
>
> > 01.11.00 and 01.12.00 are both marked as stable here, and fwupd
> > suggests these versions for an upgrade. What do they mean when they
> > say it's not officially released and not in the stable state?
>
> The firmware which state is stable is under a generic name 'HP Commercial=
 Laptop T90 Family System Update'.   This BIOS is not specific to your syst=
em.   This is the reason why the name convention is changing and eliminate =
confusion.
>
> The BIOS specific to your notebook is found under ' HP Elite Dragonfly Ma=
x/Dragonfly G2 Notebook PC T90 System Update' which status is 'embargo-hp-w=
s'.  BIOS in 'embargo' state are not declared as stable or released.   The =
LVFS documentation describes the firmware state flow as Private -> Embargo =
-> Testing -> Stable

Thanks for the explanation of the renaming process!

There seems to be a miscommunication between me and the firmware team,
though. Sure, if they are planning a rename, and if the next version
will be released under a new name, I'll test it. In the meanwhile,
they are releasing updates under the old name, the last two have a
regression, and the versions on LVFS under the old name match the
firmware upgrade packages for Windows (which makes me think there is
only one firmware branch, and renaming is not a complete replacement
with a whole different firmware =E2=80=94 please correct me if I'm wrong):

https://support.hp.com/ph-en/drivers/selfservice/hp-elite-dragonfly-g2-note=
book-pc/34514046

I'm running the firmware which is officially released (under the old
name), marked as stable, and even had an upgrade to 01.12.00 after I
reported the bug on 01.11.00. Why do they say I need to wait for the
rename to happen first? Or do they mean that the next version fixes my
bug, and it will be released under the new name?

I'm just concerned that due to some miscommunication the firmware team
doesn't treat me seriously, because they think I'm running some
unofficial firmware, while I'm running the only available at the
moment official and stable firmware, whose versions also match Windows
upgrade packages. I'm afraid to waste time, which might make fixing
the bug harder, and also might make testing impossible, if a new
firmware version won't allow downgrade to 01.09.01.

Could you communicate that for me please? If they fixed the bug, and I
only need to wait for a new release, which will be under a new name,
I'll wait patiently. If they didn't even treat my request seriously
because they thought I'm on some beta or unofficial firmware, I'd like
to make things clear.

Thanks,
Max

>
>
> > > >> HP Elite Dragonfly Max/Dragonfly G2 Notebook PC T90 System Update
> > >
> > > >> BTW, the name on LVFS will be changed per customer request in CQ2 =
refresh. Customers want to have product names included in the name. The las=
t columns in tables are the name to be displayed on LVFS from CQ2 refresh. =
See attached JPEG for upcoming LVFS name changes in CQ2 refresh.
>
> > That's a great change, having the laptop name explicitly will be much c=
learer.
>
