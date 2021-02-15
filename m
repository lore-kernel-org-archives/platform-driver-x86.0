Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EFAC433E9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 11:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E07964E68
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 11:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhBOLXC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Feb 2021 06:23:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:49842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230030AbhBOLW7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 06:22:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4348064E70
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 11:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613388139;
        bh=ddmAY5fZkyWLKc/FYPAx4V0y0fo7R8BvP6A4/Rai/20=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ICWAyZlFuA1C9Y8t4fLCDeCdcNae9NZB/l7B/vuEYJwPfO6Q/TtgFpTJ1mZyP6ldF
         VHeIQmqVhVDL2SllutGPFQNbFdLEKhG6if1rIB7+hzRHPP7nJgncA7QatRobV6Wi2B
         63yekx2cq+gK+WoMMVF3NmZwjgG+qNbrtK+JZVFPjLRjag8H/trgFoM+nGQ6/1zU9q
         rgaahOB6hn8THHUtrQ1+wpk+RvKFtr400xt7R3rs1drl0wwOJIziuXci7KV+ebAVWB
         eMNouRJIq73oDwBlL0lpl17SZFP3RXPvLjR8phasJpx/4xR7u4M5TiP+yPnQv4K/v5
         YQYShUwmJvrXA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 207433] intel-hid: add support for SW_TABLET_MODE
Date:   Mon, 15 Feb 2021 11:22:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc assigned_to
Message-ID: <bug-207433-215701-9VS2EPcMav@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207433-215701@https.bugzilla.kernel.org/>
References: <bug-207433-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207433

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com
           Assignee|platform_x86_64@kernel-bugs |drivers_platform_x86@kernel
                   |.osdl.org                   |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
