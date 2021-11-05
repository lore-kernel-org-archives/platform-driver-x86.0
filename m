Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445D2C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 14:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 291656120A
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 14:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbhKEO0D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Nov 2021 10:26:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:46900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233207AbhKEO0C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 10:26:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 701AB61288
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636122202;
        bh=hBkXGaDDbwdawOHMeJtsZyVO5fbRnBack51jN076w/E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=M0SsxwWTPbRUfNicHW37xy1gpiXW66PoTZbRbXwgTlRrIWn/BQ1lX0KOWHdEdQoMd
         znWP6okTmuffa4DOoYtCadfKMjxsFYS3qyD6rtISszjSV6+6gzKCJVzeKDTBwdA4YM
         4CvECrDi1vmSuTy7Zft2tJU6+VohmJ+K3WIrcrtQ2zQO3jf8QvcmYkcS6BWrBVwi09
         TQWZXFr2Z98dlYeecahkC3hVfbSN8UG25ycILG9rC9feSM83VA3Df5KdR2YONUAgVo
         uT1m1VEMerZrJe8pm+yGRj+XXaquECzLDOLg/lEXqLhnC3zESM9zO02aTTEIZm3Sy6
         mAMRQfzDoLjRQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 05 Nov 2021 14:23:20 +0000
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
Message-ID: <bug-204807-215701-1PMNkmzsXn@https.bugzilla.kernel.org/>
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

--- Comment #154 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Olli Asikainen from comment #153)
> Yeah, it's old and suffers from the same bug, but I reckon supporting this
> would be a completely different story. Thanks for your answer Eugene and
> sorry for the noise.

This firmware seem to be using ACPI mutex named \_SB_.PCI0.LPCB.SIO1.MUT0 to
guard access to the nct chip registers.

I wonder, can we rely on these mutexes, whose names seem to be quite stable=
, as
well, instead of the WMI functions? Then accessing nct registers would beco=
me
simpler: lock ACPI mutex if needed, access registers always in the regular =
way,
unlock the mutex.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
