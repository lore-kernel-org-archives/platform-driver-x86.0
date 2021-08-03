Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D068C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 12:55:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7D0C60EE7
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 12:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236120AbhHCMzq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 08:55:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:56192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236119AbhHCMzp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 08:55:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C401360525
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Aug 2021 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627995334;
        bh=lkGQe3O2Qyaqsrkz/GPbrRR8nNiplOqloCKLnwK8Qnw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sCgYAXtxjd2lw54gXA/DDv5Efq2BVm4zcT9xMTKxmzWTtyqFBWwlzJQGBTHG1gFzB
         CulxAXra3mb1yW/7UOrmLlYQy4i/VEovXEguB7zm6eeb+VjqIurcF8FG02NMe3F0OJ
         Ca2YV702FjXmB2QGeZfDMxjlAGGCDwm88P3CBQAD52ur3I0C1SFO9gtsgU2boaoo3G
         pttfysXhz16EuFNrCqXoR5dEhVX0WKGzyHHQWAWKTF98d35qBqCN54vPyzxfVDy7Ut
         JuVUcmm0km9mhT+IHwrCVdL4bsIzsbwgv5vc8igV4hFYAbizJnDStBdv3MSayrWpyI
         Lf5Fye0RBOheA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Tue, 03 Aug 2021 12:55:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-bVVEgB4BGj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #49 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to wse from comment #48)
> More testing with same result: Hardcoding the adress to 0x2C works on
> widnows, but breaks on other values including 0x8C

This is interesting, it may mean that Windows driver has a quirk against the
firmware bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
