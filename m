Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A479C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Dec 2021 23:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377188AbhLFXbR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Dec 2021 18:31:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377455AbhLFXbP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Dec 2021 18:31:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0204BC0611F7
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Dec 2021 15:27:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AA07DB8160C
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Dec 2021 23:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78928C341D3
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Dec 2021 23:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638833259;
        bh=Z6v8lyo/sbcin2mMv6YhslQWkwELHoPqiFBsjN2bpdY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mZDWC7aqHe/Hhkv52xrC9b0JM6bOgP+JrbA2gsBjhP7iDGd3y14HIl+kF98WhaJNF
         QSu3q2tr38s8UIqzOisGU+Xh5ji3hBua30fpvXxApk88o0NZ25N/2/2SeSskBV0sAX
         Og2842AH2TNTwXpGGUs8O/LGxgmqRhge9xKWjpqrFfw8ukbipQi0rYdPvfGz3/CbrY
         nfEDEktvU8ShSumheRHg/RZ7P7BgA2hSBcSSlO/43rwwfVvwvVW+oiWALx54Y7Mnl0
         E7SwK6k4+q3ns9+kybkF50UyGchm5E4CzdFDvmRFLn7PXpBJJdTzQRR44Rly4470w3
         UQLp27bU+YaSg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 67252611C1; Mon,  6 Dec 2021 23:27:39 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 06 Dec 2021 23:27:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugene.shalygin@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-Z5ERRkdGy0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #191 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Mikhail from comment #190)

> For unknown reason  RPM of PCH FAN and RPM of HS FAN which displayed in B=
IOS
> didn't reading by driver. It's normal?

That's because those sensors are read from another chip, the ACPI EC. You n=
eed
to add your board to either asus_emi_ec_sensors driver in kernel 5.16 or to=
 not
yet mainlined new iteration of that driver which is still at Github [1]. Th=
at
should be pretty straightforward now for your board.

[1] https://github.com/zeule/asus-ec-sensors

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
