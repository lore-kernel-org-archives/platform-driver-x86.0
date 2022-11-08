Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F117C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Nov 2022 21:39:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiKHVjH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Nov 2022 16:39:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiKHVjG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Nov 2022 16:39:06 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D6361775
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Nov 2022 13:39:05 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id z14so23016761wrn.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Nov 2022 13:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lvl+ErDCbemOug3+iFLCz02vsnNo34qIAHMIqMDamv8=;
        b=BdlCDTDO++VMJ6jup/cxyYQCiFW9SwOcxuzO/O7zO1JN5ZaMfLNizfNlc+uO0RJYXH
         PgujEv++8zd+fZKzs8QW3fuXQrQpCG84DNfSlRGJIlKg53bolkxKqN8PeUP1kL0BuEIZ
         RcTWxZ/03XxzfGsjT9lgL5elvGtBS8rpaqlNxzCulN3Y6HEqFsbEzZw90I1CDVcOqEFD
         7KMeD2r1rjMr7nG064h76lXB9QbYJxYLoAYnyYorLJie1aykVh7tLmOny88ynsqeZcaC
         4LW/zUiTr+ZTdv6IzMtef3W2b3N35E7/Bf5rJQS/Xyf3miJwGSD3PP/esZoYourRgLT3
         xakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lvl+ErDCbemOug3+iFLCz02vsnNo34qIAHMIqMDamv8=;
        b=oUN0VSRLPuKs5t6IQCL7u8Lx7TJ8lForAUaWSqTQhmCMk68MGfsu/7T+sTR3tWX0g4
         A73v8sQPQ17MEMGswl5M3VfdK9YXzU2Wread47Wn2rPRNeR9OBwUfAGJP7Y76NYUE69t
         e50GZWqmDN3+B8TcaRLhzR2GnXvxiUpk7Up0QyYKV2hwCr57WnPNViPob8Ckl76DkggP
         +0o2xKXj6GQCKGwoJC6TX3BuRyhQnAXUKbPGVvn1cm94ABsL9E+klbRnNzMRf+b+22JD
         JM76EbwxleD5PgPwH5wAdg51OP1uNh8jZmPnqXV1D4ZJG+3rYa0QA9kChwpmxoXObHkm
         8Zcw==
X-Gm-Message-State: ACrzQf0xEtrXg1Xh7vk19BKcn980M/AzyCSy4qoZjZvzyUSUBZGI6ajA
        v5dWYVD9GwmWr4YHYvi4soIdxz1Hyd4u+puBDyGgs6v2
X-Google-Smtp-Source: AMsMyM7zEAE8MIeo801v6ShpNah+ZCxkN6GefhhGeCYh51nrJcHem8SqCxhOGz3rrqALncshjNNW/QqXYeLDCyc2vAw=
X-Received: by 2002:adf:f547:0:b0:23a:239b:7e6a with SMTP id
 j7-20020adff547000000b0023a239b7e6amr17110084wrp.667.1667943544474; Tue, 08
 Nov 2022 13:39:04 -0800 (PST)
MIME-Version: 1.0
References: <20221020201033.12790-1-jorge.lopez2@hp.com> <4a7d3347-4eff-1a56-5703-ff8bfe91981e@redhat.com>
In-Reply-To: <4a7d3347-4eff-1a56-5703-ff8bfe91981e@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Tue, 8 Nov 2022 15:38:52 -0600
Message-ID: <CAOOmCE-EcXqBW+skGG2neNpeAoywii1+w6W4qORTf3GZvCmrpw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Introduction of HP-BIOSCFG driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Ok, I will do that.

On Tue, Nov 8, 2022 at 8:59 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Jorge,
>
> On 10/20/22 22:10, Jorge Lopez wrote:
> > Version 4 restructures the patches submitted in previous versions.
> > Earlier hp-bioscfg patches were squashed together before creating
> > the new split.
> >
> > Version 4.0 breaks down the changes as follows:
> >
> > 1. Moving existing HP drivers to a central location
>
> I have merged this patch, so you can drop this for version 5
> of the patchset.
>
> > The driver files were broken down in 5 patches of 3 files each
> > with exception of patch 6/6
> >
> > 2. Introduction of HP-BIOSCFG driver - Set 1
>
> I've done a detailed review of this single patches. This has
> found quite a few things to improve. Note that many of the
> remarks and especially the remarks about enum-attributes.c
> also apply to the other files (to the other *-attributes.c
> files).
>
> Please prepare a version 5 taking all remarks into account
> for all files of the driver and then I will continue the
> review from there.
>
> One thing which I did already notice for the last patch
> in the series, please drop the "depends on DMI" from the
> Kconfig bits and drop "include/dmi.h", you are not using
> any DMI functions so these are not necessary.
>
> And please add a:
>
> L:      platform-driver-x86@vger.kernel.org
>
> line to the MAINTAINERS entry.
>
> Regards,
>
> Hans
>
>
>
>
>
> > 3. HP BIOSCFG driver - set 2
> > 4. HP BIOSCFG driver - set 3
> > 5. HP BIOSCFG driver - set 4
> > 6. HP BIOSCFG driver - remaining components
> >
> > --
> >
> >
> > Jorge Lopez (6):
> >   Moving existing HP drivers to a central location
> >   Introduction of HP-BIOSCFG driver
> >   HP BIOSCFG driver - set 2
> >   HP BIOSCFG driver - set 3
> >   HP BIOSCFG driver - set 4
> >   HP BIOSCFG driver - remaining components
> >
> >  .../testing/sysfs-class-firmware-attributes   |  181 ++-
> >  MAINTAINERS                                   |   15 +-
> >  drivers/platform/x86/Kconfig                  |   80 +-
> >  drivers/platform/x86/Makefile                 |    4 +-
> >  drivers/platform/x86/hp/Kconfig               |   81 ++
> >  drivers/platform/x86/hp/Makefile              |   11 +
> >  drivers/platform/x86/hp/hp-bioscfg/Makefile   |   19 +
> >  .../x86/hp/hp-bioscfg/biosattr-interface.c    |  285 +++++
> >  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 1064 +++++++++++++++++
> >  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  671 +++++++++++
> >  .../x86/hp/hp-bioscfg/enum-attributes.c       |  521 ++++++++
> >  .../x86/hp/hp-bioscfg/int-attributes.c        |  478 ++++++++
> >  .../x86/hp/hp-bioscfg/ordered-attributes.c    |  586 +++++++++
> >  .../x86/hp/hp-bioscfg/passwdattr-interface.c  |   50 +
> >  .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  647 ++++++++++
> >  .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  408 +++++++
> >  .../x86/hp/hp-bioscfg/string-attributes.c     |  457 +++++++
> >  .../x86/hp/hp-bioscfg/sureadmin-attributes.c  | 1014 ++++++++++++++++
> >  .../x86/hp/hp-bioscfg/surestart-attributes.c  |  145 +++
> >  drivers/platform/x86/{ => hp}/hp-wmi.c        |    0
> >  drivers/platform/x86/{ => hp}/hp_accel.c      |    0
> >  drivers/platform/x86/{ => hp}/tc1100-wmi.c    |    0
> >  22 files changed, 6647 insertions(+), 70 deletions(-)
> >  create mode 100644 drivers/platform/x86/hp/Kconfig
> >  create mode 100644 drivers/platform/x86/hp/Makefile
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
> >  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
> >  rename drivers/platform/x86/{ => hp}/hp-wmi.c (100%)
> >  rename drivers/platform/x86/{ => hp}/hp_accel.c (100%)
> >  rename drivers/platform/x86/{ => hp}/tc1100-wmi.c (100%)
> >
> > --
> > 2.34.1
> >
>
