Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402E7C43334
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 15:52:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiGJPwm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 11:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGJPwm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 11:52:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798FF12A84
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 08:52:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 18C0261239
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 15:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73D5FC341C8
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657468360;
        bh=UUcbiRgPl7NAMIDXR4pzx81VpNNHoKtOdkMWGAWUkZE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TDiWxij7XeCgRavJij4RXQzu/OPuobKIorOV9GYf0q2KQ+98PYPC6tK0FQdGXFmNg
         styajXPHOFTPg3cxPGiGfdotahgGGphqwwd7AYX+7cJgkj09iXQYiPwQEhqvO0JImu
         IGfxFKHM5Drl9VcWjn5OqEPYl9CCQF+GXRFuU6UtcP5zFezCqVI2jtExqfoQkknkgh
         wHlcldgGImTmwpdhRreAJHRmDdDGtmBHC2k6F2U1yPMXA8Z5sTzOJKfhVffjY3Ts1K
         agV7Xqu2eD4ugthDGxHa6XvD2Ierywi/Fecx8IGzZw3Ipj1tLSFOaERcxx4nOpTAKP
         1jsHrY4k3TQ6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 57A6FCC13B7; Sun, 10 Jul 2022 15:52:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Sun, 10 Jul 2022 15:52:40 +0000
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
X-Bugzilla-Changed-Fields: bug_status cc rep_platform
Message-ID: <bug-216230-215701-GiqF3KL6CD@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |markpearson@lenovo.com
           Hardware|All                         |AMD

--- Comment #1 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I've got a handful of questions that should help clarify what's going on.

1) Is this a regression from a kernel upgrade?  What kernel introduced it?
2) Is it a regression from a BIOS upgrade?  What BIOS didn't have it?  Can =
you
downgrade to that and it goes away?
3) Does s2idle still work?  What indicates it did or didn't is whether this
message appears on resume:
https://github.com/torvalds/linux/blob/master/drivers/platform/x86/amd-pmc.=
c#L361

In addition to those questions the logs I would like to see:
* A full dmesg log including a suspend cycle.
* /sys/kernel/debug/gpio from a cold boot (that the problem reproduces)
* /sys/kernel/debug/gpio from a warm boot (that the problem doesn't reprodu=
ce)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
