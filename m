Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA2AC678DB
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Mar 2023 01:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjCFBlT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Mar 2023 20:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCFBlT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Mar 2023 20:41:19 -0500
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470C011170
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Mar 2023 17:41:18 -0800 (PST)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-176b48a9a05so2403845fac.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Mar 2023 17:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678066877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfUbRU+AyWGg7QLVhFvKsuhCG4vFQT37Tu3JSELwWB8=;
        b=S2Ln0XSzFpEdKCAad/unp/pDAFPHSfXozoQ8MoJtos+Rb+gd+OsWCpaqEfeOvSuVBi
         H/wJAWnwltW6t+NBVPRGC5uOEObB7IHW6hMDchid5I1Mcotjpof6/h4YoijUNgZkBd/+
         NPTTrPBaOanJiHI1MbX0HdzisXOUl7TWc9E+JrWjk/CWKE6QNMJnu46QmeJPMCCL2amt
         c7mlferYB4IchqZbydMTFdvDEj0CnazHeqVoi6Og21yymqqI3a4jVpk9znG2NjFCY4F+
         rwJwPwmb7Yr/DIJrV5g2JNPTVeTMOIQkre36jc52gdA1/PUD6GRkYj8TQz2BMT1gwhFO
         rT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678066877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfUbRU+AyWGg7QLVhFvKsuhCG4vFQT37Tu3JSELwWB8=;
        b=F/sHgZkFQkBYuULUjUpZG3ssURyyvyLEimvsGS59/hkuh7L1WA901zKt2ve9kx6QK5
         ROZakxxKrMhNJRQD6tXK8mgHZqZZfQLx/R90DJBS6jLbkL/JwHuJtzAEjAULyc5mdFcV
         D3pvXg2dgHT3EHSLY+fXiMmDwP5Gnm027zNjqOuHVqp44pMxA4FomXp1sivgJyBV/H2f
         MNEzeKN1ln39jtEOmKoc3hgsz3N4SaLu4wU/GEZoOHh/dyvDCWt4LCuDI5cy58TYJyzX
         UP9cEPRX9hvNE8zboTnKEOXHIvI1d6PUzS44LQnAsIK7oiwtgMUYFyj/LiLxckc8tedU
         uyug==
X-Gm-Message-State: AO0yUKXYiivN7/XnvlI24oIHFCiOJRtvhD3EfRaSx9zjJCfB8r7E4Nby
        cdk4pLO534Cf+PyhAjYn7JS3eGUN5epW/0D9ikI=
X-Google-Smtp-Source: AK7set9zuh0Uhgp2b3oQEG6r48bNEvT0jpbscqEwhW1qmqjfijHLUpD6r37485brzgMgYSvFINZOXIkVBMxZJuIF4FY=
X-Received: by 2002:a05:6870:4612:b0:176:27af:1c23 with SMTP id
 z18-20020a056870461200b0017627af1c23mr3173135oao.7.1678066877518; Sun, 05 Mar
 2023 17:41:17 -0800 (PST)
MIME-Version: 1.0
References: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
 <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
 <044d2716-2490-6600-33e2-ecf50f65a6e9@gmail.com> <2267dadd-f1a9-e064-6f3f-e3aea459cf5a@gmx.de>
 <CAG4kvq84Lso0x62AuZgRttcQFdKXAHpWWKB4n0ZMTgb9CZ=NCw@mail.gmail.com>
 <e95a38c0-15e0-92e2-97c0-4d09219158f5@gmx.de> <CAG4kvq9QzoXcwTxTFzoQeQDnMEHfWCG4JmLgQ-sMn_WjX-mVJw@mail.gmail.com>
 <2181c5de-44d6-aebd-52ba-63d9fabd620c@gmx.de>
In-Reply-To: <2181c5de-44d6-aebd-52ba-63d9fabd620c@gmx.de>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Sun, 5 Mar 2023 17:41:04 -0800
Message-ID: <CAG4kvq_scrvvmZ3trVhkFTeT5NruAA7qYCohT90ih0sNirrWCw@mail.gmail.com>
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Mar 5, 2023 at 5:26=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> I was combing through the ACPI DSDT table inside the acpidump you provide=
d,
> and i found serveral PNP0C14 devices, which hold WMI methods, events and =
data.

Thanks so much for the help! This is my first time looking at an ACPI
dump so I never would have found this.

> Maybe you can write a wmi driver which handles both WMI objects, so that =
you can find out what the values
> returned by GetUsageMode mean. With a bit of luck, you can use this to im=
plement tablet mode toggle detection.

I will look into this, this does look more like the proper way to do
it so it can be put in the driver for everyone. I suppose that missing
Notify device is just unrelated then? Does setting the memory mapped
variable just automatically update these WMI devices? I was worried
that the failed notification would make the WMI devices not work, just
guessing based on the WM00 name.

If you have any pointers on where to look to see the kernel functions
involved in WMI that would be appreciated.

> BTW, what is the name of your notebook model?

It is advertised as Lenovo Yoga 7i and the model number is Yoga 7 14IAL7
