Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF01C43217
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 Oct 2022 13:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbiJSNmU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 Oct 2022 09:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiJSNlo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Oct 2022 09:41:44 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB6AF3D
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Oct 2022 06:29:20 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-35ad0584879so167856417b3.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Oct 2022 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejT7S7i6nmMPOIOYMUFPWenfZRAhrRKVoCwSu+6xjkw=;
        b=RQvgSqtvg/zBS45oz7E7oNR9AwIfUsijyyWrdaU2ARXU+xP6wK+y7mHS1muvFS3aVA
         L73TVmJHXBqGShYoN5fT99UpkCk5aVU772FA430E4mzFPUUBwu5NxR0/lgjMI8ikpNYu
         kAhmv5V9ffB+YtMiFM9mTcf0RfWQXggFwMsXPxNY9BdEw8Dlp/HkHyRqGnse/iFx8g11
         jDUP8d7ORnEkSn90/Ryc6IP5sovIuQmmK2hXjm+fgt99Ib9d07wSCuen09YjvcXU1D4Q
         WGn6zp8d17lJz+dN334Lh5tHUUDAU64I94QBGDUxs6d+puVRtEuk8QfYNdWM8w3jeOc0
         qhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejT7S7i6nmMPOIOYMUFPWenfZRAhrRKVoCwSu+6xjkw=;
        b=LbIaPSrBAWsaZ4NhN2sfFSY7M8WRQ3sPhKeKvQKHjq8w2q+2ine/v+PsSZN1munOED
         Txp6mZuvMFLB2IN4AV8UBtZ+Jx5Oiqz4FfDbwbIDIB6efbLegBLLy9/AY7bzATQJxp5d
         oGABw4O9DsQP68Ym0O0nJmD+TDZBk6SWnfYPwU2SGOo7K1LnPVcqwAuPWT7a1TaflVrF
         5i1qAzL4YoTs3yhib7R4ppu/3o+XbzTLrUQ0BKYlUGJ7LeESCB7kJVTA8JQOHhwXM4Dc
         6qnHM+YqN8aj2+Q5mPbMJVI3zBsdEBBjr3A7ygwb3gQNqgAQXmfoB4kEKZET/GsDEI6+
         Zo2g==
X-Gm-Message-State: ACrzQf3egF5xN4kOGnpEJyMs54Jr+4KJyJrNiaqgacCE48E7Jt51QHqN
        71NQIROGDxM/6L4BBlyCbda//chouZ6bhXotYL1MpCGwJQM=
X-Google-Smtp-Source: AMsMyM66ecrSTyr1UL5BQZ1h05d6BjdrWv5QQJ+V8y3uMd5jI51NmshsCA1ZeVIS12D+vzaIL+Ze4o9R6V988yBdpJA=
X-Received: by 2002:a81:b8c:0:b0:35f:80ce:306a with SMTP id
 134-20020a810b8c000000b0035f80ce306amr6703873ywl.97.1666186134257; Wed, 19
 Oct 2022 06:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221018203531.17130-1-jorge.lopez2@hp.com> <9b086aca-916c-c0b7-f60c-327f16f01c8b@redhat.com>
In-Reply-To: <9b086aca-916c-c0b7-f60c-327f16f01c8b@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Wed, 19 Oct 2022 08:28:43 -0500
Message-ID: <CAOOmCE8N796Ok9kkFfRDeGzeY0P5n5HkKQh3Oe-_3j_JL_mDQw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Introduction of HP-BIOSCFG driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

I will make the necessary changes by the end of the week.  The new v4
will reorganize all patches  as indicated.   My intention was to keep
those fixes as small as possible.  I apologize for the mess.
Regards,

Jorge

On Wed, Oct 19, 2022 at 4:01 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Jorge,
>
> On 10/18/22 22:35, Jorge Lopez wrote:
> > Version 2 -> Version 3
> > ------------------------------------------------------
> >
> > Introduction of HP-BIOSCFG driver (1/6)
> >       - No new changes
> >
> > Update pending_reboot state value (2/6)
> >       - No new changes
> >
> > Set current_value permissions appropriate to read-only attributes (3/6)
> >       - No new changes
> >
> > Improve friendly display name values (4/6)
> >       - No new changes
> >
> > Moving existing HP drivers to a central location (5/6)
> >
> >     The purpose of this patch is to provide a central location where al=
l
> >     HP related drivers are found. HP drivers will recide under hp
> >     directory with exception of hp-bioscfg.  hp-bioscfg is found under
> >     hp/hp-bioscfg/ directory.
> >
> >     Introduced changes to Kconfig file to list all HP driver under "HP =
X86
> >     Platform Specific Device Drivers" menu option.
> >
> >     Changes needed to relocate hp-bioscfg driver
> >
> >     Relocation of the driver requires minor changes such updating the p=
ath
> >     for a local include file.  Additional changes include update MAINTA=
INERS
> >     file to indicated support status, reviewer, and maintainer of hp-bi=
oscfg
> >     driver.  Lastly, removal of 'stddef' include file from the source.
> >
> > Clarify how elements order list impacts priority (6/6)
> >
> >     This patch provides additional clarification and describes how
> >     priority is determined according to the order.  Elements listed fir=
st
> >     are given higher priority to those listed last.
> >
> > Version 1 -> Version 2
> > ------------------------------------------------------
> >
> > Introduction of HP-BIOSCFG driver (1/4)
> >       - No new changes
> >
> > Update pending_reboot state value (2/4)
> >
> >     There is not a reliable mechanism to programmatically determine whi=
ch
> >     BIOS settings require a reboot to be updated.  The latest changes
> >     leverages =E2=80=9CRequiredPhysicalPresence=E2=80=9D reported value=
 to set
> >     pending_reboot.
> >
> > Set current_value permissions appropriate to read-only attributes (3/4)
> >
> >     This patch updates =E2=80=98current_value=E2=80=99 permissions to m=
atch the value
> >     reported by =E2=80=98is_readonly=E2=80=99 value associated with the=
 attribute.
> >     =E2=80=98current_value=E2=80=99 permissions are set to read-only if=
 =E2=80=98is_readonly=E2=80=99
> >     value is 1.  =E2=80=98current_value=E2=80=99 permissions are set to=
 read-write if
> >     =E2=80=98is_readonly=E2=80=99 value is zero.   Other read-only and =
write-only
> >     permissions will remain unchanged.
> >
> > Improve friendly display name values (4/4)
> >
> >     The purpose of this patch is to improve the friendly display name f=
or
> >     few numbers of attributes associated with =E2=80=98Schedule Power-O=
N.=E2=80=99  BIOS
> >     assign names such =E2=80=98Tuesday=E2=80=99 to an attribute. The na=
me is correct, but
> >     it is not descriptive enough for the user.  It is under those
> >     conditions a portion of the path data value is append to the attrib=
ute
> >     name to create a user-friendly name.
> >
> >     For instance, the attribute name is =E2=80=98Tuesday,=E2=80=99 and =
the display name
> >     value is =E2=80=98Schedule Power-ON =E2=80=93 Tuesday=E2=80=99
> >
> >
> > ------------------------------------------------------
> > Version: 1
> >
> >   Introduction of HP-BIOSCFG driver (1/4)
> >
> >     The purpose for this patch is submit HP BIOSCFG driver to be list o=
f
> >     HP Linux kernel drivers.  HP BIOS Configuration driver purpose is t=
o
> >     provide a driver supporting the latest sysfs class firmware attribu=
tes
> >     framework allowing the user to change BIOS settings and security
> >     solutions on HP Inc.=E2=80=99s commercial notebooks.
> >
> >     Many features of HP Commercial PC=E2=80=99s can be managed using Wi=
ndows
> >     Management Instrumentation (WMI). WMI is an implementation of Web-B=
ased
> >     Enterprise Management (WBEM) that provides a standards-based interf=
ace
> >     for changing and monitoring system settings.  HP BISOCFG driver pro=
vides
> >     a native Linux solution and the exposed features facilitates the
> >     migration to Linux environments.
> >
> >     The Linux security features to be provided in hp-bioscfg driver ena=
bles
> >     managing the BIOS settings and security solutions via sysfs, a virt=
ual
> >     filesystem that can be used by user-mode applications.   The new
> >     documentation cover features such Secure Platform Management, Sure
> >     Admin, and Sure Start.  Each section provides security feature
> >     description and identifies sysfs directories and files exposed by
> >     the driver.
> >
> >     Many HP Commercial PC=E2=80=99s include a feature called Secure Pla=
tform
> >     Management (SPM), which replaces older password-based BIOS settings
> >     management with public key cryptography. PC secure product manageme=
nt
> >     begins when a target system is provisioned with cryptographic keys
> >     that are used to ensure the integrity of communications between sys=
tem
> >     management utilities and the BIOS.
> >
> >     HP Commercial PC=E2=80=99s have several BIOS settings that control =
its behaviour
> >     and capabilities, many of which are related to security. To prevent
> >     unauthorized changes to these settings, the system can be configure=
d
> >     to use a Sure Admin cryptographic signature-based authorization str=
ing
> >     that the BIOS will use to verify authorization to modify the settin=
g.
> >
> >
> > Jorge Lopez (6):
> >   Introduction of HP-BIOSCFG driver
> >   Update pending_reboot state value
> >   Set current_value permissions appropriate to read-only attributes
> >   Improve friendly display name values
> >   Moving existing HP drivers to a central location
> >   Clarify how elements order list impacts priority
>
> Jorge, thank you for your continued work on this.
>
> I will try to get a detailed review of this done next week (no time this
> week, sorry).
>
> But before then can you please restructure the patch series to make
> it easier to review ?  ATM the series seems to be the original v1
> patch + patches on top addressing review comments. That is a somewhat
> unusual way to address review comments. Usually new versions include
> improvements from review directly in the patch introducing the change
> which got commented on.
>
> What I would like to see for v4 of the series is a patch series like
> this (with all the hp-bioscfg patches squashed together before doing
> this new split):
>
> [PATCH 1/x] Move the existing HP drivers to the new hp subdir (instead of=
 doing this in 5/6)
> [PATCH 2/x] Introduce the main bioscfg.h file + *-attributes.c files, yes=
 this won't
>             compile, but without a Makefile pointing to it that is fine
> [PATCH 3/x] Add the main bioscfg.c + Makefile + Kconfig changes
>
> Note feel free to split patch 2/x in maybe 2 or 3 patches adding a few
> *-attributes.c files at a time.
>
> The idea here is to make the individual .patch files smaller because
> I personally find that reviewing big patch files does not work well
> (I tend to loose track of everything which is going on if the patch
> is too big / I loose my way because of too much scrolling).
>
> Regards,
>
> Hans
>
>
