Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00A3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 21:16:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244728AbhK3VTw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 16:19:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236360AbhK3VTt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 16:19:49 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9545EC061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 13:16:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E0720CE1C63
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 21:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E369C53FCF
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 21:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638306986;
        bh=BFvcUO/e/Lcj8rVY567GsWMix55VTd7DAbh8R9TpSJM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LMhw7j7P88Ta4XruMUsYsPnxn0eQ/lKylb63nJNAX0nqo622q1G4Ir86aYap1wERF
         xXLeq01V0jdkjog5G6gl+Rw5PYDa/WVMUIDIltFAp5qF5YA0f5Vi7x0Dm3EB4GWQ2h
         cCwRjKQZbsTa8K/d/+iFcSveoI/krRV7lhpUY7Ou6fHXTFUYd5CpUgLnkLm2B4MrrU
         /vyYWwJxKxhWuQWtNWRRbMSAPKENsuA0oWNPKhCbuSlSItQdf3jwPvqL2zKQj6Ftyg
         HLqryEqH9V7jHTfKfvSjsNJKGaAu8+0oWpVCD1gH96qpV5jwkKkOJU8hvROiaf1QRd
         DEb5AMAR9MBRg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id F0D8F60F46; Tue, 30 Nov 2021 21:16:25 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215177] Stop exporting platform_profile interface for Lenovo
 T14/P14s Gen2 AMD
Date:   Tue, 30 Nov 2021 21:16:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215177-215701-OgwHqVKb0i@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215177-215701@https.bugzilla.kernel.org/>
References: <bug-215177-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215177

mario.limonciello@amd.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #1 from mario.limonciello@amd.com ---
It's fortunate that it's a noop right now and not causing a performance
degradation.   Presumably these systems DYTC interface *does* work on Windo=
ws
though, and with the modified calls right?

I suppose there are two short term ways to approach this:
1) Quirk thinkpad_acpi to these systems/ broken BIOS versions to disable
platform profiles.  This assumes it will be fixed in a future BIOS version.
2) Quirk thinkpad_acpi to use the corrected argument mapping on these syste=
ms,
mentioned in that linked issue.

IMO between those two options the second sounds better.

In the longer term though I think the discrepancy of expectations needs to =
be
fixed in thinkpad_acpi.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
