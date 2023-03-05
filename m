Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9A5C678DB
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Mar 2023 22:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjCEW7f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Mar 2023 17:59:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjCEW7e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Mar 2023 17:59:34 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE4FEB42
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Mar 2023 14:59:33 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id f19-20020a9d5f13000000b00693ce5a2f3eso4408967oti.8
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Mar 2023 14:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678057173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SeN3hGEWS1OlHvyCqqFBrHd0gicPRE4yzDNRTgYOuk=;
        b=lf3Wc8fkWyGFIiDEwRLcoM4LB76WXP+AlT55NEEju7v0fDvVGkWBIvEbsAjIGi2jyI
         TseGysZBch20e+zHmk0PkjxLLjDPLkN96976RqQ9EYUzRRX82zRCXmv5Sj1tXhwCw/9U
         oqcd3A0qbM9Mp2o79DtAfKSGAHxk6vWXgOV1+wLX/ugoKFVH1VbONrKw1UnZWLMDlj6K
         dK2wHAVRnUYFFqIRVhgYWPxFhlypqiVwIP8Q1/9tcfYwB55rYW8dnajPq35b4SpuCIEt
         87WvKg+jmp2uvcbQzkXQUFLpJXduHulxH+nbTQr1YajFzFP0snhmsVakw5529qVJAewD
         7JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678057173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SeN3hGEWS1OlHvyCqqFBrHd0gicPRE4yzDNRTgYOuk=;
        b=rQCJHhf7av51/7dMVaTfaOrNR7kTO0mnugUT3kZgQe3ZBUC443CqeEVO+cL3hh5M+w
         2FC0ymTBmv3AF+ExueUs78SdEwWXo2+/4LhEQPSiMba0EPXV4OeKyr97dFmaLbNaaWlc
         /wRA5/9OBgtDzkYalhCPpCpkbqhp56TAfLDmQ2E1yZH29+xoZ2RlJpC8UHOf77mG2sR5
         ppELKljb7I9tFKhtHl/lHNKNg3zLkTXKBG3ZKRmBk2ntS47FbT8XfCyvEUF13ubkj0Pa
         N+RYuXjhiOvNGKlDWW9W5aD57LJSHMFQJCEvXquGEvDB865/UKyky/SbFY/1hktT6kpI
         8ZUg==
X-Gm-Message-State: AO0yUKWb+Srj4aysgmTQoIp9dtjoT5XGwvt9lezApLqUHw3nFrD2m5W9
        VsKL7lahX/HaRc7yHF0WdIyiaN2ATlPLQLYN78ks8Vn09whlJA==
X-Google-Smtp-Source: AK7set/7qbVmCA8lRadcDLjAY0gF598DHxG+tioD2p/PsvIahXTvgvAUkYaX9gLl0LC7chYUv8f8dIUeYGgbeIvogiM=
X-Received: by 2002:a05:6830:39df:b0:690:daac:e823 with SMTP id
 bt31-20020a05683039df00b00690daace823mr2617148otb.2.1678057172811; Sun, 05
 Mar 2023 14:59:32 -0800 (PST)
MIME-Version: 1.0
References: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
 <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
 <044d2716-2490-6600-33e2-ecf50f65a6e9@gmail.com> <2267dadd-f1a9-e064-6f3f-e3aea459cf5a@gmx.de>
 <CAG4kvq84Lso0x62AuZgRttcQFdKXAHpWWKB4n0ZMTgb9CZ=NCw@mail.gmail.com> <e95a38c0-15e0-92e2-97c0-4d09219158f5@gmx.de>
In-Reply-To: <e95a38c0-15e0-92e2-97c0-4d09219158f5@gmx.de>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Sun, 5 Mar 2023 14:59:21 -0800
Message-ID: <CAG4kvq9QzoXcwTxTFzoQeQDnMEHfWCG4JmLgQ-sMn_WjX-mVJw@mail.gmail.com>
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Mar 5, 2023 at 1:40=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Hi,
>
> could it be that bit 5 is set to disable the touchpad when the device swi=
tches
> to tablet mode? I suspect that the query handler does the following:
> 1. Notify VPC0 to disable the touchpad.
> 2. Notify ACPI WMI, which does submit the necessary scancode for switchin=
g to tablet mode.

I think you're right about this notification being for the touchpad,
although at least on my machine
there is no other touchpad switch. So this is identical for my machine
specifically. In this function
from the decompiled ACPI dump you can see VCP0 and WM00 notified:

Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0xFF
{
   P80B =3D 0x44
   Notify (VPC0, 0x80) // Status Change
   WEID =3D 0xF4
   Notify (WM00, 0x80) // Status Change
}

This WM00 device sounds like the WMI you're talking about, however I'm
getting those errors
about this device not existing in journalctl still. I was asking
before about how to create this
missing device but it's not clear to me if that is possible.

kernel: ACPI BIOS Error (bug): Could not resolve symbol
[\_SB.PC00.LPCB.EC0._Q44.WM00], AE_NOT_FOUND

I searched in my .dsl files from the acpidump and wasn't able to find
any of the 3 ideapad_wmi_ids
listed in the driver. Maybe you have an idea of how to interface with
this missing WM00 object though.

>
> Could you provide the output of "acpidump"? Because i suspect that the vi=
rtual key handling
> is done using ACPI WMI, as many modern devices are using this approach. I=
n this case, you
> could experiment with ideapad_wmi_notify(), and maybe take a look at idea=
pad_wmi_ids[].
>
> Armin Wolf

Here is the raw acpidump output: https://la.ask.systems/temp/acpidump.out

- Andrew
