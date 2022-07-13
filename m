Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39CFC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jul 2022 09:25:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234186AbiGMJZ0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jul 2022 05:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbiGMJZT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jul 2022 05:25:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F97F1E3F
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 02:25:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 26B6DB81D5C
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 09:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB8ABC34114
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 09:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657704315;
        bh=ByqA9mMvxLIRetWPmMt6CLvm2/hB5a1P3mjc9+O95Ms=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oCE6M1ZnJuJyAdluBmZueGd9T7iLUz3Xq9xoEysMYjtFYLFwMeLLW+/TI4nN/O3Ah
         M4Jx3Qe3hpUwUAI/leWz7/alSm1xx8mLR2HH3Ask4dgwQwEaAUUKSdatJypmqqeVBG
         muGkU3SJTrpdTTkfTCOPvhreKtkvWssk3+dVvqJVqcW9+JYzTdsfiu225CGKfJoNiy
         iaHeHocuj7K94w+0WRaeQzwvIp2C00op9lrZAz7+WFqJajFVpRBvimDvYVfm6pO0Wn
         TcX/kB9UAzLwJXeYcNjU4F+/3dKaTp3DI7HfadGv0isdteuckB3N7ViA0N7S6JiZvi
         o3x370askXMTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8E9B5C05FD6; Wed, 13 Jul 2022 09:25:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215075] BUG: scheduling while atomic: cpuhp/1/21/0x00000002
 when going out of sleep S3 state
Date:   Wed, 13 Jul 2022 09:25:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Process Management
X-Bugzilla-Component: Scheduler
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: g794911663@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215075-215701-stGQU1D2VM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215075-215701@https.bugzilla.kernel.org/>
References: <bug-215075-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215075

Ricardo T.Liu (g794911663@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |g794911663@gmail.com

--- Comment #2 from Ricardo T.Liu (g794911663@gmail.com) ---
Hi, I've looked at the log you gave, and I think there was an error checking
the atomic state of the cpu.
/*
 * The former STARTING/DYING states, ran with IRQs disabled and must not fa=
il.
 */
static bool cpuhp_is_atomic_state(enum cpuhp_state state)
{
        return CPUHP_AP_IDLE_DEAD <=3D state && state < CPUHP_AP_ONLINE;
}
And I found a computer similar to yours and did not reproduce the problem, I
guess you may need to overhaul your hardware.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
