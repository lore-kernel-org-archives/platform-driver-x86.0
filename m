Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4179C4321E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Nov 2022 22:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiK3WME (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Nov 2022 17:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiK3WMC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Nov 2022 17:12:02 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A5252896
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 14:12:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A81B7B81D16
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 22:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64719C433D7
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 22:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669846319;
        bh=J9X5mYoT/dBIeo72qAWgCUQnhBVSQNwpp9e5NM/0S5A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J3Flg3UZoL6ChCETEle8RPd3JQ3dTuG6kRwT4oYHaMbVMUtnb6h8q5LivnS78QtxZ
         GUdZUkh+64ZVNlfUgn4vb1QWq10FCeZ1xRwdOWlo95WHcAn4cr9cHZuJHSqSds+5no
         CpPTbZO4ZuFmSUb9/JQq83sRgze6VX71HDR0QEFgnpQSTTboE1SY0X2tdX2FomuhzM
         nb4vkcDf/ea4ZkdAM1DjLQi+zCcGHH+B/qPF1rCbDog36smtFOgniLRN4E8BIQQcao
         6DBHHh2M9wsr2KqqTgS3rjXZLyQVsJfkXlwGwnMWSnngIZ47fAv6HrH3huY7N7Qb+/
         uuf6vpNZAkL6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4AE4DC433E4; Wed, 30 Nov 2022 22:11:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Wed, 30 Nov 2022 22:11:59 +0000
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
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-211741-215701-c37NL1lAXG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |mario.limonciello@amd.com

--- Comment #6 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I'd expect that this is actually fixed now in 5.18 or later by this commit:

520ee4ea1cc6 ("platform/x86: hp-wmi: Fix SW_TABLET_MODE detection method")

Can you please recheck on a kernel containing that?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
