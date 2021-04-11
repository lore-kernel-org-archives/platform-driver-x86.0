Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40665C43460
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 10:30:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E49FE61210
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 10:30:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233822AbhDKKao (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Apr 2021 06:30:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:49264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229804AbhDKKao (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Apr 2021 06:30:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EE08A61207
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Apr 2021 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618137028;
        bh=NkpBdYRIM2zJBGe56XR+6HgsTELco9kxzece6I6LZbo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Gx9tJLV8djwcsRfKoQ2hrIjUv6SLV+uyA5+76BteuUuB9jAi+l/MM2UIJ9xnLUUb7
         p4oHj4LJRVRya3fPd3PUTu7dKUAlDv/uNqmDT0Qmo/VLZtaZ2oCirDg5ErDPMisbcl
         HZHbXLakvvy0Q4HWN4gVjZzrLY97mhzJ8aNWyp20J6SKhpx9jpsAVFPfLiohaVFuPM
         MFA9GmS/9VJgegl1eZ+FF2CMpg11oPFzsgncIfDUpmLsGX8RZCYP/7fsjLaw4f+92X
         kvkQ5XC7cY1OJJeVyCnmMM0tynhqKE7ZaOGxOfbAeyoBL0WbWWlIUQEL4/mazfdIYe
         5ujFBDRzfSZog==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 11 Apr 2021 10:30:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mat.jonczyk@o2.pl
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-UfbHk5FPdv@https.bugzilla.kernel.org/>
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

--- Comment #59 from Mateusz Jo=C5=84czyk (mat.jonczyk@o2.pl) ---
The Asus X570-Plus TUF Gaming was described in this ticket as not working. =
It
is listed as not supported by this driver on GitHub. So there are some devi=
ces
without a working WMI interface that would benefit from the handling in com=
ment
47.

> I agree that using the WMI interface, which presumably is what Asus' Wind=
ows
> tools use, is better.

It also does not require guessing voltage divider parameters, which makes r=
aw
access to nct6775 not that much useful.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
