Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA76C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 13:59:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234462AbhLEOC3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 09:02:29 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:49090 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234460AbhLEOC3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 09:02:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 70223B80E7B
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 13:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4496CC341D0
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 13:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638712740;
        bh=MGL7rYyPHLwmpcBcWQ4Uam9hBKjPNKF5eTmZEOfpK2E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dIo4lh0MmtKzXFpfF2LL3JrH2jjd7yooxlNE8PS4Cq1d1JWJaARJcFXOKPoX7dXXJ
         72eMjvzzKKqr359dGefMYwNr7ACe6voVkJivi23BuYTPE6Zjqr7WiPurZD+YMpUOHL
         mE0WqnpVHSZkMD70sgi7OlqmZ28hSpqwpb4OuDnomyDmY5JQThQLlv4+4hCjeiXP5Y
         vjIoT54p+89lwZhV7DvsBfFfHA8w6WJ2H53xUt8Rdw5xrbeVmTZKFKJWVecomd1Yx9
         cv0pp7pML9hxRm0h7gx2i32A4+oEgvNljFL+cwz/sqwTnjHnAzXIPa3WnOloKr1phF
         x9o9VDxsuiYBg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 362AA611C1; Sun,  5 Dec 2021 13:59:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 13:58:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vladdrako007@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-jXpZTJJm6A@https.bugzilla.kernel.org/>
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

--- Comment #184 from Vladdrako (vladdrako007@gmail.com) ---
No changes with the latest patch on old ASUS P8Z68-V LX. (sorry for post
spamming, newbie here) Kernel 5.15.2 Manjaro.
Attached DSDT dump and dmesg.

[   11.103782] nct6775: Found NCT6776D/F or compatible chip at 0x2e:0x290
[   11.103790] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\_GPE.HWRE) (20210730/utaddress-204)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
