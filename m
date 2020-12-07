Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBF8C4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 15:53:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F79623358
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 15:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgLGPxw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 10:53:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:46670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726920AbgLGPxv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 10:53:51 -0500
Date:   Mon, 7 Dec 2020 16:53:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607356391;
        bh=noShnSv1v7gr2opTKTK2wimVs4+6xqO0hr9+Euwoe28=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=DRk1r4HVNufN4wYTYgC28bhII4ixN07S5JfoZBYHfb0dmqXUKDZNkmprxII96/s37
         fj4B+dIM4NlRyzBwVPbC8KZqYBQ4Q2Bgl3h23U9lbCdwELk40VoOlG8JKgAF408X9q
         QVW8DDJnE6QRDzJavSCUu7OxfU7E+VtSbvDIRXXZaUIEbo2gtnhtyZU/US9jDijpFy
         SHKe3kyt6MbyjzpjGZxQDdQGPHbtHwVtYbCK1GwExWunOvqBLeY680EkMQDnH5J4Rq
         GHgeqv4AAeG3YN0omGUKxqzqmRZYztMXrATkgb1OoIZgurYRsMKVjbslBNcd9e93Yb
         GkH3UL5cg7C6w==
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Matthew Garrett <mjg59@srcf.ucam.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: dell-driver: Backlight access slow
Message-ID: <20201207155309.3eyjjyyl6xq4u622@pali>
References: <d2d1074d-a342-35ce-1e0d-5300b4803f33@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2d1074d-a342-35ce-1e0d-5300b4803f33@molgen.mpg.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Monday 07 December 2020 16:37:04 Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On a Dell Precision 3540/0M14W7 with Debian sid/unstable restoring the
> keyboard backlight takes over 100 ms according to `systemd-analyze
> critical-chain` [1].
> 
> ```
> $ systemd-analyze critical-chain
> […]
>             └─sysinit.target @887ms
>               └─systemd-backlight@leds:dell::kbd_backlight.service @1.295s
> +114ms
>                 └─system-systemd\x2dbacklight.slice @1.294s
>                   └─system.slice @291ms
>                     └─-.slice @291ms
> ```
> 
> I have to run the program [2] under strace to know for sure, that the delay
> is caused by accessing the backlight device.

Hello!

If it is really truth that the 100 ms delay is in the kernel then you
can use e.g. perf tool to trace where in the kernel happens that delay.

Kernel driver for keyboard backlight just calls Dell's SMBIOS API which
issues SMM call. After that processor enters into privileged x86 SMM
mode into Dell's SMM hook installed by the Dell firmware during machine
boot and do appropriate keyboard backlight change call. During this
procedure is normal execution of x86 processor stopped and even kernel
does not have control over it.

I already saw that people reported similar issues to Dell's SMM API for
temperature and fan control and measured that processor stays in Dell's
SMM code for a long time. So I can imagine that there could be a similar
issue also with keyboard. But I can be completely wrong.

I'm not sure if that keyboard backlight is related to SMM or not (this
needs to be debugged) but basically kernel cannot do anything with
Dell's SMM code. If problem is really in Dell SMM you can just report
issue to Dell. If problem is somewhere else in kernel we need to know
more details (e.g. in which function kernel spends lot of time) and then
we can look how to optimize it.

> Unfortunately, the device is
> already in use by somebody else, so debugging is not easy. Maybe you have
> some hint, how to approach analysis from the Linux kernel side.

I understand that in this case it is harder to debug this issue. I know
only perf tool for doing these analysis but maybe somebody else can help
how it can be debugged in other way?

> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: https://github.com/systemd/systemd/issues/17885
> [2]: https://github.com/systemd/systemd/blob/5acd143259068c8959d7823b178ffbca3269db30/src/backlight/backlight.c
