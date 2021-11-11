Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B52C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 15:16:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 194D1603E9
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Nov 2021 15:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbhKKPTR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Nov 2021 10:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbhKKPTR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Nov 2021 10:19:17 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89691C061767
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 07:16:27 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u1so10325008wru.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immu-ne.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fhj0cnQSgQJIzD/Xl/qdsU8IO4Zo9cA5GB5xCgS18Wo=;
        b=g+hkBq+WFhVcG4fSQEvWEk1fXwaX4hUmg445Lgu1BXlnCV3cutTM0D57bvOkFHOh68
         ILtePrPrLtbwUS/E9iScfG6rFdtXtvcJ5IRSyv02D2ETRUL3AbVablafdOKArOARyBOQ
         b/jkm6nxefilrZB+73iX1Aae/49TedZgDktoufu5hH/mwAfP8XUYwKIAQlelCccuxE8M
         895BgNMZN1oKjWO3dBFYSIuw8HrrBugLu3GJVIV42GP7hR8DYgQfGXd5Da9eiE5VxGw/
         DQbdOynLiG8skPeIUiBKd3CfkvcK73jzP2ORvXTK5jRLAoD3RZf7+0r7srV53ITEv/C0
         vHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fhj0cnQSgQJIzD/Xl/qdsU8IO4Zo9cA5GB5xCgS18Wo=;
        b=6cdva4FkUx6fbeJHNpEXh01wvfOL3pmqYOhzNLHeDsSG4CzDxcDs5JSEY4CgyrYkVc
         yRxiY5UOASt3qEBfSFViqU7REVCvJWR8aAwrM4n6/aKfwqjxO5r1pXEUrwrG0KcQNi5d
         HnFlIaGEFEHf89Tn2V1WkBFpwbwbooh520VlADpLMfF/t0FMkAd6/Av4CcIE0JlK8slP
         x3n5CVmuxx/d/YXgsQLhV3TRz08Kr6unhxAfc+aUef77SktL876MqHmhMtyg6MBOnK2I
         dzO0HU3YYrBM7Vk+CKlyMSXdGz2SckFSB/dE6k27oaAamygFWnQrkNA7syozt4JgVn9B
         dkvQ==
X-Gm-Message-State: AOAM530zLxc4UEp7eFsK75UKksanmiN+UUYP+D0TapnVMFz/+WahibPc
        sn6qZpmsDCIjDqI2ksfj9AfHj5Y18RhUFvKxAxNR7A==
X-Google-Smtp-Source: ABdhPJxoxR4YR+eij4k5gbF83r4Woo9CGi0KEHV0yF+7MbJ2I6t/xKAke9fWDBnvUk+aFyijaXLJRQNQRHpTRAoD1/U=
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr9171660wrm.259.1636643786132;
 Thu, 11 Nov 2021 07:16:26 -0800 (PST)
MIME-Version: 1.0
References: <CAHp75VdRwvU5WjFP5E4gg8U+_e34A0Lwze+nz_wVHoB49jLeLg@mail.gmail.com>
 <CAArk9MNGSxR+92n-D2pe_+r+Z0Q9FoTMPqk11sAKA=4Vckj0HQ@mail.gmail.com>
 <YYy7QZGKeEEfI1mH@lahna> <CAHifhD5bXu2nP533RXyWDnyNt=k2rRZq5Z6A6CCik_2e6XNgGA@mail.gmail.com>
 <YYzxWPIWFAV04LRU@lahna> <CAD2FfiGnmFSTPvkJaXj+cf4yDvci-j+2QkpMqNY821fUT5C=CA@mail.gmail.com>
 <YY0UCHtf8SAvGHTY@lahna> <CAD2FfiF=7H7RuAdrSrrr57JF6YG=pb5jw2QMgBDQsAEwgasYLw@mail.gmail.com>
 <YY0b01g+z3lkO4w2@lahna> <CAArk9MOxZaK2WqsuPR4GbgdxSnUBqgO1KZ8OT=+siksYq+2PxQ@mail.gmail.com>
 <YY0xZjjGjNq+kUXi@lahna>
In-Reply-To: <YY0xZjjGjNq+kUXi@lahna>
From:   Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>
Date:   Thu, 11 Nov 2021 16:16:14 +0100
Message-ID: <CAHifhD6+BB+4LHq1CE3ZBVhnG-V0U=3H51mjfh44dx11kMCUfg@mail.gmail.com>
Subject: Re: [PATCH] firmware: export x86_64 platform flash bios region via sysfs
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Mauro Lima <mauro.lima@eclypsium.com>,
        Richard Hughes <hughsient@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
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

Am Do., 11. Nov. 2021 um 16:06 Uhr schrieb Mika Westerberg
<mika.westerberg@linux.intel.com>:
>
> Hi,
>
> On Thu, Nov 11, 2021 at 11:42:52AM -0300, Mauro Lima wrote:
> > > > > Having said that the hardware sequencer used in the recent CPUs should
> > > > > be much safer in that sense.
> > > >
> > > > FWIW, I'd be fine if we had RO access for HWSEQ flash access only. If
> > > > I understood correctly that's what Mauro proposed (with a patch) and
> > > > instead was told that it was being rewritten as a mtd driver
> > > > completion time unknown.
> > >
> > > I think Mauro proposed something different, basically exposing RO parts
> > > of the driver only.
> >
> > My patch was intended to move the read functionality of the spi chip
> > to be able to compile the driver with just that and then remove the
> > dangerous tag. So we can use that functionality to read the flash, I'm
> > missing what is different from the things being discussed here sorry.
>
> I'm hinting that we could make this "non-DANGEROUS" for hardware
> sequencer parts of the driver. Basically moving only the software
> sequencer bits as DANGEROUS or something like that. The hardware
> sequencer is much more safer because it does not allow to run random
> opcodes.
>
> In case someone is unfamiliar with this, the Intel SPI hardware
> exposes two interfaces through the same controller. One that is called
> software sequencer and there is a register of "allowed" opcodes that
> software can use as it wishes. This register can be locked down but is
> not always. The second interface is the hardware sequencer that only
> exposes higher level commands like read, write and so on and internally
> then executes whatever opcode the controller got from the chip
> "supported opcodes table" (SFDP).  The recent Intel hardware, all
> big-cores, only provide hardware sequencer and the software one is not
> even available.
>

I am familiar with this and I do totally agree. I believe HW
sequencing is available since sandy-bridge from 2011, so it will
suffice for modern platforms. Honestly me and my developer friends
never understood why this driver needs to still focus on SW sequencing
altogether, it seems like a (possibly buggy) relic that just slows
down the vital parts. So I'd say it is a good idea to move the HW
sequencing parts, basically splitting it, but still add a RO/RW flag
to the module to be extra safe.

> Regardless of all this the driver needs to be converted from MTD to SPI
> (SPI MEM) before we can add any features. I'm planning to send v4 of
> that series next week.

This is an understandable reason and thank you for working on it.

Hans-Gert
