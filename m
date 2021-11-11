Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32C4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 12:56:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9616611C9
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 12:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbhKKM7S (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Nov 2021 07:59:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbhKKM7S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Nov 2021 07:59:18 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A68DC061767
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 04:56:29 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 133so5017194wme.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 04:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immu-ne.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0NFPYayov5rg22DwnA0bRYansBv6+4ol9ZRhST3KEl4=;
        b=SAkW570c9a5GMB7KUcuQa93LUMMk+Ehzy/yGE23yKs6olT5740zClnqhaXTPQ/Tl9p
         txAS0jsBPUdmC9+ke+s8AnDFntMJW75BXN6lb/W4SL+VNnLapPXr191kLRfJ+MqczAMA
         CKrW2q4yzQ1HHo0SxG9UBm7sTHcBpaElFjm2ADQ7DIVuyU5NhZcQTsCKr+WhDKqd7fdQ
         x+sOz9kFKAellCGgdofupl3/HFueU7v46k7PHQcnfAqrwZKDP0CDs70F8S8DSpBdJ0KX
         7ueXYm13tblnOUc9q0VWQ1FWp32e52x5G3wUuUJ1luf4AsoxfUOeahUTL98Ae7NoGGm4
         HMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0NFPYayov5rg22DwnA0bRYansBv6+4ol9ZRhST3KEl4=;
        b=l8CCQcEUUugFXihFje3Wnw0txBhCw6o69nPerXn+ilZQUMokzzd+6OuXT/Dmj5IQKj
         xuIdngBcK/H3ijMVABI9jn/f7E/ISMwqt3VREAd2NDZpR/EW5JY9yVOBbx7aCezS7Ucx
         IZvj8yEIjl6dkYamunw8/3+raXR4sifeO9P3SjN4UpM+jIilpwOwk7kaDyiWcPLyPsEH
         5z8xdRPg0Z0Pzr9gZ4q8hL46CeNY6cWtLaGeRENGxgG42bw2OyYiMPscRuEgvd8sXt/i
         1nWgTFK/g1pU1g6B09nTz0KBiLxCpIUmXHbOMkpnLE0Ca1JaCAf9SMuFCfkCHxbGR5ke
         6VOw==
X-Gm-Message-State: AOAM532nd2IRkbUeOgyEK/avmlvgtC3rFWO1vLk5Zmffj8xI6OAwu1DD
        nJMwkSgRYfuqfD35L4SFgar6++tmp8yJhkOE0NpGRA==
X-Google-Smtp-Source: ABdhPJzmKRK/XbofgEwarSaSPS0e//h4D4pGEs637Yv/p2z3x1pzWBdrfZXeEcKEsDniH6IPMega3mKu1vaoxbMVHBs=
X-Received: by 2002:a1c:158:: with SMTP id 85mr25313485wmb.182.1636635387704;
 Thu, 11 Nov 2021 04:56:27 -0800 (PST)
MIME-Version: 1.0
References: <CAHifhD5V9vwJenRLcPRH5ZMeLa_JnjZKfdcFZw1CjceBtC6=Ew@mail.gmail.com>
 <CAHp75VeyQEaABFOnEUh2pdFx9ROJvRcud-BuEbKWmaEWpL9_Uw@mail.gmail.com>
 <CAHifhD7Qf7+dc7K-MjNguqmiCWUxOJZmQoCTRUZOR-RWMm_JPw@mail.gmail.com>
 <CAHp75Ve9BMNy3gP=-Dajm+Lgu+E4FCqc4phLgV1_cr2qUnTX_w@mail.gmail.com>
 <CAHifhD4n7O5eWFPOjRAmHYL52tW0K=uXXzVj7L5+enTFwFXW2A@mail.gmail.com>
 <CAArk9MP5cKJ+VhAZUseW4LnQNRvux=MZe2eSy3rQkbHKnUsGig@mail.gmail.com>
 <CAHp75VdRwvU5WjFP5E4gg8U+_e34A0Lwze+nz_wVHoB49jLeLg@mail.gmail.com>
 <CAArk9MNGSxR+92n-D2pe_+r+Z0Q9FoTMPqk11sAKA=4Vckj0HQ@mail.gmail.com>
 <YYy7QZGKeEEfI1mH@lahna> <CAHifhD5bXu2nP533RXyWDnyNt=k2rRZq5Z6A6CCik_2e6XNgGA@mail.gmail.com>
 <YYzxWPIWFAV04LRU@lahna> <CAD2FfiGnmFSTPvkJaXj+cf4yDvci-j+2QkpMqNY821fUT5C=CA@mail.gmail.com>
 <CAHp75Vcp=hC1oL5FBQDDFe8EBxWB9Po4FKNS9ZGtD3q-yQPtAw@mail.gmail.com>
In-Reply-To: <CAHp75Vcp=hC1oL5FBQDDFe8EBxWB9Po4FKNS9ZGtD3q-yQPtAw@mail.gmail.com>
From:   Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>
Date:   Thu, 11 Nov 2021 13:56:16 +0100
Message-ID: <CAHifhD6p9qSm5dv1spz+oPRhRkBZeQspHNEphE49fODacm-S6g@mail.gmail.com>
Subject: Re: [PATCH] firmware: export x86_64 platform flash bios region via sysfs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Richard Hughes <hughsient@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Lima <mauro.lima@eclypsium.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Philipp Deppenwiese <philipp.deppenwiese@immu.ne>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am Do., 11. Nov. 2021 um 13:46 Uhr schrieb Andy Shevchenko
<andy.shevchenko@gmail.com>:
>
> On Thu, Nov 11, 2021 at 1:46 PM Richard Hughes <hughsient@gmail.com> wrote:
> > On Thu, 11 Nov 2021 at 10:33, Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
>
> > it's always going to work on x64 -- if the system firmware isn't available at that offset then the platform just isn't going to boot.
>
> Well, it's _usual_ case, but in general the assumption is simply
> incorrect. Btw, have you checked it on Coreboot enabled platforms?
> What about bare metal configurations where the bootloader provides
> services to the OS?

No it is always the case. I suggest you go read your own Intel specs
and datasheets before spreading further FUD. I have experienced u-root
and coreboot developers sitting right next to me in my office and they
were among the ones suggesting my patch. This is just laughable,
please stop it Andy.

>
> > Ideally, fwupd needs the entire IFD partition which contains all the
> > EFI File Volumes.
>
> Well, can't it be part of the EFI subsystem in the kernel then? (+Ard)
>
> > We already parse these when the user is booting
> > without secure boot using the Intel SPI controller and doing *evil*
> > hacks to make the PCI device visible. The reason we want to parse the
> > BIOS can be explained pretty easily; at startup we look at the TPM
> > PCRs and we know very quickly and easily if the system firmware event
> > has changed. If the checksum changed, then the firmware was modified
> > in some way. However, saying to the user that "checksum changed" isn't
> > useful at all. What we want to do is say something like "an EFI binary
> > called RootKitz.efi was added" or "the AmiTcgPlatformPeiAfterMem.efi
> > binary changed" and actually report what was done. At the moment we
> > can do this, but not if /dev/mem cannot be used.
> >
> > > However, we can perhaps expose some of it through intel-spi,
> > > and make that work so that distros can enable it safely.
> >
> > I think, if we're being honest, that Intel has no plans to make
> > intel-spi available as a RO interface of any sort. There's some sort
> > of hardware errata or misdesign that nobody can mention that makes the
> > RO access unsafe. I think it's probably more than missing arbitration.
>
>
>
> --
> With Best Regards,
> Andy Shevchenko

Hans-Gert
