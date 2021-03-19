Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C773C433E1
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 15:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A5F961929
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 15:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhCSPJr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Mar 2021 11:09:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:45538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230378AbhCSPJe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Mar 2021 11:09:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2331D61926
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Mar 2021 15:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616166574;
        bh=oh5BFPCtVnCWm2ZUx2xgO/UF5uL0HFpBeNBECfJYqi0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Pb8IZIPbYavbQsf5VF9FsC7ROm5zzmUhKudtWNDDPsU8VRbfNq3yhcQBjX9NpSBa5
         KZmLA4jcvBWFvBwO4hWUH15DkDIcNlDzDpGNpLEFJMGU9vJdLw0wZmvFkGNJAqLU4V
         Ye5UWKv/BErm1GcwSWaBy4nBf7deOiFADLaVrTKt2PKWRP0Lg6nUeoNrEshKK+hW8j
         th5SIkdwADTnW0gQduwRDBHdUGk1thusOeMUHaraA1ioU/a4m1m25wkFwWcMywIi99
         8/SUu00P/Vb6VmHYXwtsksxBhe31lVaKP89vS97Zy1et5f77gHUyN0AIUQDUT6lqzu
         ORQkcPFapavIg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 19 Mar 2021 15:09:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-204807-215701-XAN4etClyz@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
                 CC|                            |torvalds@linux-foundation.o
                   |                            |rg
         Resolution|INVALID                     |---

--- Comment #34 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Matthew Garrett from comment #33)
> This isn't a bug - the ACPI tables claim the resource in question, and
> there's no way we can verify there are no conflicts between ACPI methods
> that touch that range and the native driver. If you're confident that this
> is safe on your system then you can boot with acpi_enforce_resources=3Dla=
x,
> but we can't make that the default. This will still produce the warning, =
but
> the driver will be permitted to load.

This bug needs to be fixed because

1) It doesn't affect Windows
2) Average people will never know how to deal with issue
3) I cannot ask my motherboard vendor (ASUS) to fix this issue in BIOS beca=
use
they don't provide support for Linux - they barely provide any support at a=
ll.

OoB experience of Linux users should not be "I don't get any sensors output,
how to fix that?" Most users don't even know what and how to Google. They d=
on't
know about dmesg either.

That's an effing horrible attitude.

I'm CC'ing Linus because I absolutely hate what's going on.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
