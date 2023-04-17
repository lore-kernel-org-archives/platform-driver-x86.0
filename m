Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603B7C77B70
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 10:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjDQKS7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 06:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjDQKSs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 06:18:48 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513526596
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:17:58 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id dd8so12200731qvb.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681726603; x=1684318603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nYUg0+2tztcyRYSYW/uc5mLOZV/QwLje5n+NpS6OSo=;
        b=JRzk6JWx/dtru3zUYLVJg+pdtQSwValQLjcna7Hib5Jfn72Zk5RZJj+HzRodKu+KtZ
         IXwRlSw07Fk7LgELjr7nzp/hM7IJ3cB8le3ohJbyU43KfceQDb3A/Es9S/kKdea/anEp
         8ycM6/nbXpJNMI1W61wmpWSmgTbq5Cf9197fargj8IXSmYKoERD3Z7wOc3e8HyBtvcbd
         LV8rCUusKRjrdMUTy0wo9lq2IHRW+5KVYzh4zyWkNdm4rYWEfJd2/rpdO+To3OIzo94K
         wlUEC42hNiagaCBBVEOXRHm4ksxaqlfHDYHm8DfIuc6NwkKgD+QKDWEdWs7nhxvGgNZO
         Xjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681726603; x=1684318603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nYUg0+2tztcyRYSYW/uc5mLOZV/QwLje5n+NpS6OSo=;
        b=KSowjro/7/imR6vgCLY9vWYxnuBXj6Kitm4JbcOW72CeFlUaGW0xfntXF+D+O2HYxo
         +Yewljq14jtD7XXcJ7vGQacI8zU9iGd5IEXqUI/P3kCCXPCsQM3elA5TWbDIC4pMIWOG
         pgEHsJj4Mqf/7nt4/ogPDqlq/YMuH8b3Qe45Sm+CLcpk49DI2xu1oqeFZ0lh4X+CCK8Y
         zpAWB+JB9slgkCKlXzYD6zpPAOIzVqT0Z95fSwiY9Lcp4vjgIOySpAV+rCEHd4eNicz8
         Hqv4FW5hjwDCdhnqAZmPW0j3Kbw5AeMH669pfbXld1DehaWo3+SNR02fU8BiETwaHGlj
         feYw==
X-Gm-Message-State: AAQBX9dvmt7/RWGcVIy+4krRsT79ttd4yEpAtRrbGLGAn+P+WX0oj8Em
        1khDmAKY+l+EiV6m97KxN4OZ5swaoS3NiQuqdK8=
X-Google-Smtp-Source: AKy350Y6k53YeqX08wViOL7MWKggOSHbX4q6FJpgCD4Jjs+M4O2C8n9V7eS4t368J5dZYJm/Hw8kY+LCq+KFOLwYTCY=
X-Received: by 2002:ad4:5505:0:b0:5ef:474f:eb84 with SMTP id
 pz5-20020ad45505000000b005ef474feb84mr1805670qvb.10.1681726603285; Mon, 17
 Apr 2023 03:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230416154932.6579-1-julian.winkler1@web.de> <6a2a97d9-140c-3e4f-aa12-c98f928f7481@redhat.com>
In-Reply-To: <6a2a97d9-140c-3e4f-aa12-c98f928f7481@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 17 Apr 2023 13:16:07 +0300
Message-ID: <CAHp75VfFptZcJn7c_a2GLnSqJDXBwvUqWmu9Wb19a3VvwXJS5A@mail.gmail.com>
Subject: Re: [PATCH] intel_scu_pcidrv: add back PCI id for Medfield
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Julian Winkler <julian.winkler1@web.de>,
        platform-driver-x86@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Apr 17, 2023 at 1:11=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> +Cc Andy, Mika,

Thanks for Cc'ing me.

> On 4/16/23 17:49, Julian Winkler wrote:
> > This id was removed in b47018a778c1a18cbc98b4a11936dec4f8c4bb7b, saying=
 it
> > is only used on Moorestown, but apparently the same id is also used on
> > Medfield.
> >
> > Tested on the Medfield based Motorola RAZR i smartphone.

Wow! This is surprising.
Can you tell more about your test environment? What is the Linux
kernel version in use and what is the userspace (AOSP, Buildroot,
Yocto, custom)? If custom, more details would be nice to hear.

> > Signed-off-by: Julian Winkler <julian.winkler1@web.de>
>
> Hmm, so this is a former SFI platform, from your:
> https://lore.kernel.org/all/20230223060107.23029-1-julian.winkler1@web.de=
/
>
> patch I guess the plan is to use some custom bootloader
> and then use x86 with devicetree support to replace SFI ?

That would also be nice to hear in detail. With other Intel MID
platforms the decision was made to pursue ACPI (and U-Boot, as an
example) supports that for Intel Merrifield platform.

> Do you already have this working ?
>
> Sorry for all the questions for what is just a simple PCI-id
> addition. I guess I'm worried this is just the tip of
> the iceberg for getting medfield support back into
> the kernel and I'm a bit worried about how much maintenance
> work this will cause.
>
> E.g. also see commit e1da811218d2dc ("drm/gma500: Remove Medfield support=
")
> which I guess you will want to see reverted too ?
>
> That is an example of a lot more code to bring back
> then just a single PCI-id addition.
>
> Don't get me wrong I'm all for supporting older hw
> if there are users who are interested in actively
> maintaining support for it. I just want to get a feel
> of the amount of work this is going to involve.
>
> Andy, Mika, any remarks ?

I'm not against a patch if it helps existing users, but we need to
understand first if it will be really helpful for upstream (taking
into account 32-bit Intel MID support removal).

--=20
With Best Regards,
Andy Shevchenko
