Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225CAC433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 04:33:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D218A64F24
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 04:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhCREcy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Mar 2021 00:32:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:45842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229456AbhCREcZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Mar 2021 00:32:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5EF1964F41
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Mar 2021 04:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616041945;
        bh=Ha3OpjjkPe2b0FYG6+K3UqnT+G2W23XvTmSvb8lDUcI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=e3HWUj3+vByD+pv0a6e0v6R/i4wHCiLxdjD0rHx7AU4oCKqxZfxiRHAHXk7TVJXEy
         a5LuoernhBXMQNE+u4SeKVPHgaEGqviixuxuOFlmIl1FqBX/oke0pcsfD+bUTzZBMG
         vYF7tc2MhY0t8o+x969rECtCgwn1ofMQWtIXZtWzprjbBd8eXGJ4gYiyuRiYMWdrKf
         0wVX+NfCKYNUDKvuYC5dn8wAhA7iSGxmTLi4OPlQM6Y+bg+DoH4T2xyY8HN2N9qcKh
         JpQ2AUSWMaTuRmukwKWexL6oimRJW9hrwGVG+kDYYpJLokfme2fTbI4BiersDGASUB
         MXRW0vXn8VXqw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 18 Mar 2021 04:32:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mjg59-kernel@srcf.ucam.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-204807-215701-XXs5wnkjdv@https.bugzilla.kernel.org/>
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

Matthew Garrett (mjg59-kernel@srcf.ucam.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
                 CC|                            |mjg59-kernel@srcf.ucam.org
         Resolution|---                         |INVALID

--- Comment #33 from Matthew Garrett (mjg59-kernel@srcf.ucam.org) ---
This isn't a bug - the ACPI tables claim the resource in question, and ther=
e's
no way we can verify there are no conflicts between ACPI methods that touch
that range and the native driver. If you're confident that this is safe on =
your
system then you can boot with acpi_enforce_resources=3Dlax, but we can't ma=
ke
that the default. This will still produce the warning, but the driver will =
be
permitted to load.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
