Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC559C43334
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Jun 2022 21:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355430AbiFUVZ2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Jun 2022 17:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356369AbiFUVZH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Jun 2022 17:25:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29BBC2FE70
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jun 2022 14:20:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D893AB81A8C
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jun 2022 21:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97CE8C3411C
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jun 2022 21:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655846397;
        bh=F5t6X77yXAWXyns4w9nxQAWr2xK9X53XCTYHsz1tno4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=i3KRXbu6NL/4053kw4v0YSPKJUTQfNmwsqspzlfFxDNm4LNs1HHc5SRerI0o2+bnM
         B54t0mOFEq/BRs6v1SuvVyU/SxMIDJoJKNVkTkWYQFGc91VEDL7sCh+AyYcZ8Xhb9C
         WX19SHSeixAe5tc/qh6TJAWUO3zsqWN4VOcb6H96YA2P3Z80Yk/UzqBbhgLaXq514E
         3MCOUNMrzeVE2qAC21S8lbRYTBzUWLS2hqzLac17aIYvETR1hLHqmtPayRSsnY7EDq
         fTnxrzUUMk1exq/J/rT1XYrFor/h0+ki5bA8NPDbzeugXa97UQ3edeKR/C7qhazF8R
         WUP4QRTaWuw5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 78E9BC05FD2; Tue, 21 Jun 2022 21:19:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Tue, 21 Jun 2022 21:19:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lortegap@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213297-215701-HLxxutTbyl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213297-215701@https.bugzilla.kernel.org/>
References: <bug-213297-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213297

Luis O (lortegap@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lortegap@protonmail.com

--- Comment #7 from Luis O (lortegap@protonmail.com) ---
I came across this issue, and I checked the ideapad-acpi source code and for
some reason it now allows DYTC version 4, but only for 1 laptop model.=20
https://github.com/torvalds/linux/blob/ca1fdab7fd27eb069df1384b2850dcd0c2be=
be8d/drivers/platform/x86/ideapad-laptop.c#L871

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
