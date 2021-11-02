Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5E9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 14:20:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8563961053
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 14:20:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhKBOX3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Nov 2021 10:23:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:52058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229530AbhKBOX2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 10:23:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C447B61076
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Nov 2021 14:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635862853;
        bh=pmM9+wMEB71VaXmHgxtj2HSQB5l3DV79Je+s5hnzhlM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=F1bSNTzi0hAXGdDzJoYt7VUjuWq92KwibQSECy9lFbu9ZCg3tjz9xzGqieYq94ZGK
         fITBvTYO4ONKZk8iqxwhzPBdWrZcfbe3sb9C+7JgoEBx37Ha2mKwInIlx4Rv2Ap3J7
         y2tH0YhMhLfKRMMrueM1LN3Wh1L26Mb3o9jUiXedmgBbaDDIvOg9GaXDzme66UqzM4
         4f2u228053c/z9r9AG507+WKsCXYqQ7dLc2dDDuWCUzyiyiu4pWd1WmlAJQbiZ5Ri4
         5Ld9BZUjBuS2liU16AU6oO7ts0md9c721qe45wG8Dxen7Blmdh1y984jhotxzpc5XB
         zqMaAUAu5ndyA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Tue, 02 Nov 2021 14:20:53 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214899-215701-AiULPjIRaA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com

--- Comment #12 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Johannes P from comment #11)
> Still nothing but grave silence from the brightness keys though.

Which might be a sign that the key presses are handled by some microcontrol=
ler
(EC?) with a custom firmware and being delivered to the OS in different way.
It's also possible that the WMI can be used but these events have to be ena=
bled
somehow (obviously with ACPI methods or so).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
