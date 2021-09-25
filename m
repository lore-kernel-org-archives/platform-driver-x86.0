Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40217C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Sep 2021 14:47:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 185D161356
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Sep 2021 14:47:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237280AbhIYOtH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 25 Sep 2021 10:49:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:38606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236173AbhIYOtG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Sep 2021 10:49:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EBFA461354
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Sep 2021 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632581252;
        bh=HzdN9XHe1A4fXcm6M6FS2dYRk8BdvBK8yNCQ/SBmw2k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BivaRCICm/WWV37FBeQXYs2x/cx5QOajX9DP2U0gaDBo+UvskIcLnqPsAREnx5y4e
         9Ovqb/QURL/ZsUoCPWbAVxEZH9P/fJ44izH3Z0gzcb7g9GavQj6jROXU1DfKizTmMf
         YXkm/igb6dWYkeyw/DCJoeJ5oUyrVdXzYlUyUnbg1lat7aVnWFwiWdi14rPgWGJd4z
         oY1ZtxHa9yIaGxEMFyt2LyxVYG1DcRNScoI4AoGFsfWPX7BEGog+gI8sIEcP/KXIjZ
         Wij+fFSJArRolX+98cjDijMaEqx4sGlvAb2FFmlRr6g5Wo6HGZEeRI9vieZxeYk33I
         BAfLHKk1b8FXA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 25 Sep 2021 14:47:30 +0000
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
Message-ID: <bug-204807-215701-NCg8eCTy07@https.bugzilla.kernel.org/>
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

--- Comment #129 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Denis Pauk from comment #128)

> @Eugene Shalygin Could you please check that combined version is still
> worked?

Thank you for your efforts to mainline these drivers! I have a couple of
changes and questions to the EC part. Is a review going on somewhere where I
can participate? Otherwise here are the main points:

1. I'm pretty sure the B550-E GAMING board has no EC sensors. Other B550 bo=
ards
I've seen DSDT from provide a dummy BREC() function.
2. The "Water" fan sensor should have been named "Water_pump" or alike.
3. There is probably an AIO fan sensor at (2, 0x00, 0xB8) EC, but I did not=
 yet
find time to check. Maybe someone has this header connected and can do a te=
st
for us?

I'll try to test with hardware later today. Thank you for your work, Denis!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
