Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0728C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 16:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbiGKQJ5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 12:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbiGKQJ4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 12:09:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A4672EF9
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 09:09:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30059611CC
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 16:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94D5FC341CB
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657555793;
        bh=jPPDXaTRqbpTWrSjEAMc6+ZiHHMH+2E16u+E7qMXfaw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bJW3At3cvyd7wB1oAOM09fdpZk3UO/K4BPjuPKr5ZRC6tAu9h6PgK/z9Y8kAiNVA9
         akmK9y73KYXN+B5HLwZ53Xrn3yL63hAvp2/Okt9w0DSyZp6murJnPljTMf+ETN0iKj
         msIVyOGRg52PNBenyQaPupNtU0n6ehntoGw3npE99zOzglbmv+wHHvNZ965Dq1F6C8
         CdmxDpbmLNt/Be6oLkFo2REd+t8mvpM6IL3ZGjzX+hFoAMHB/ylstFGLKoMnns+fC0
         iU0on6KaqT/+DxZhrYbzK/rTgp7NuMsdwCKvpY4L9byauFJYBzzEA24SMFC75rwmhK
         HPJ3st/Ro41Wg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7B032CC13B1; Mon, 11 Jul 2022 16:09:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 16:09:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-HHxgUY1WJv@https.bugzilla.kernel.org/>
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

--- Comment #6 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
The tough thing with this bug is that in this design the IRQ is shared both=
 for
the ACPI SCI as well as for the GPIO controller.  There are patches in the
kernel's s2idle handling created specifically for that case.  But it means =
when
you're dealing with a spurious interrupt you don't know which device it was
REALLY destined for.

Looking at your GPIO output it seems that pin 32 switches from output pin in
the good scenario to input pin in the bad scenario.  Can you try to correla=
te
if this happens every single time you see a problem or it's also a red herr=
ing?

Good=20
> pin32     interrupt is disabled| interrupt is masked| disable wakeup in S=
0i3
> state| disable wakeup in S3 state|
 disable wakeup in S4/S5 state|     pull-up is disabled| Pull-down is disab=
led|
output is high| output is enabled| debouncing filter disabled|   0xc50000

Bad
> pin32     interrupt is disabled| interrupt is masked| disable wakeup in S=
0i3
> state| disable wakeup in S3 state|
 disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-=
down
is disabled|   output is disabled| debouncing filter disabled|   0x50000

> My machine is affected by the NVMe slow wakeup bug so I only started to u=
se
> s2idle since kernel 5.18.

Sorry what bug?  Are you talking about
https://github.com/torvalds/linux/commit/455cd867b85b53fd3602345f9b8a8facc5=
51adc9
?

> I'll see if I can downgrade the firmware if you think that'd help you tra=
ck
> this down. FTR I'm on version 1.40 which seems to be the latest one as of
> now.

> I attached the requested logs.

I didn't see the issue listed there, I was hoping to understand the timing =
of
it.

Something I'm wondering is if maybe it's an IRQ destined for the GPIO
controller but the GPIO controller driver isn't yet loaded?  This could be
particularly relevant if it's not in your initramfs but rather loaded after=
 you
entered your encryption key (noticed root=3D/dev/mapper/cryptroot)

Could you please turn on dynamic debugging for pinctrl_amd (pinctrl.dyndbg=
=3D+p
on your kernel command line )and share a log with it reproducing?

> pcie_aspm=3Dforce

FYI - this is generally not a safe thing to do.  If you remove this from yo=
ur
kernel command line can you reproduce the issue?

> As such I don't know if this is a regression. I'll see if I can downgrade=
 the
> firmware if you think that'd help you track this down. FTR I'm on version
> 1.40 which seems to be the latest one as of now.

I think Mark will have to comment whether it's something they're aware of,
tracking, etc regression wise.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
