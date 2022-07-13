Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E788BC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jul 2022 17:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbiGMRS2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jul 2022 13:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiGMRS0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jul 2022 13:18:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A442F67F
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 10:18:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F0C3761CEB
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 17:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51116C341C0
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 17:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657732704;
        bh=rwAoJKBJOt+3dwRnawQZANrAa+WMJsTjQ3WjuPsleJ0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=e1lTnnok8vt2fL/y5YSrgL6R01Vy+zaNLRq+gi5QAtSSOkEHUqhP0Ir2iyym4qySQ
         CboXjM1lp5YmZ40taV8j0vT9bC0HpwDx4tepQhopnAYbjzrJdtOWwV/2prdaT6N9Kq
         VTLACLlX8P7ZfmMPQDJvqVSqIYUPj5xJUtofIw/JnzKqzekTJ55DQYvKFz6zLqPoW7
         8ub2Qdu42bkpybwqYIN0shgbq19Ltcbo1iyqB8/kYXtWae1qw9So/iySTPsdS6jlfT
         tG5L8IzqXi8Uk8IRoTAaeRc1wDajIFOrmXlp7q8A2lnPl+vH9awTNovqDdUo9ESBvc
         +yhUbovAKL8TA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 39C63CC13B0; Wed, 13 Jul 2022 17:18:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Wed, 13 Jul 2022 17:18:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-2cecFyib4z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

--- Comment #18 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> IIRC this means that those debugging statements are enabled. The only
> relevant line from dmesg is this though:

Yeah the other two messages you won't be seeing generally.  They're relevan=
t to
certain circumstances.

> [    0.668575] amd_gpio AMDI0030:00: amd gpio driver loaded

The really important thing here is the kernel timestamp.  If you compare it=
 to
the failing log you have above, you can see that the failure happens a lot
later in the boot.

[    4.295441] kernel: irq 9: nobody cared (try booting with the "irqpoll"
option)

> I just noticed another case where the number of interrupts reached about
> 12000. With a bit of careful optimism I think that loading pinctrl_amd ea=
rly
> during boot puts an early stop to the IRQ storm before the kernel interve=
nes
> and disables the interrupt channel.

> As for reproducibility, I think that the machine needs to run for some ti=
me
> before the problem can be "re-reproduced". This is why it looked like it =
was
> happening only on cold boots. Assuming there an EC connected to these GPI=
Os I
> guess it's some kind of timer overflow...?

Careful optimism sounds appropriate, but fingers crossed!

As a general statement it seems that by using an encrypted partition you
exacerbated this problem because you will by definition have a longer boot =
that
you don't have access to pinctrl-amd's kernel object while getting your
passphrase entered.

I'd say if you don't hit this in the next few days with this change we shou=
ld
close it as "DOCUMENTED".  Mayyybe we should add something to the Kconfig t=
ext
to warn about this?  Not sure what else can really be done from the kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
