Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337E2C433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:39:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12523613B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 09:39:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhDOJkN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Apr 2021 05:40:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:34140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhDOJkM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Apr 2021 05:40:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F9E1613C0
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Apr 2021 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618479589;
        bh=+NTFE1pXKNp5aabex0ds3wctt1D9tL21NxgI+Sub3Ko=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XHTIo/NUcitE0Lcp7y3u77r0ZowYDX9koqYb57RaX/VAdyVXbyzMC1tOkSBWh9LzP
         +s0Aj29ml35YiNXq1jTv6mcdpVgjiem14PNbRKJ3dir3LOXDpo7OTlI0/eXmWxxlRs
         WVLbpQ1yGyv3Fy4nSMwOQMDCGjTeOKykM3AoLdd5UxzFZp+9OjoWTRFcDDIJK2STE4
         D5K78bqLaaW/UnqCzXXnFEKyqFF+ixj3PZL/FX973Jg8jhal4GS3a8eH+d33MSRdBb
         IFNOVmT31cZBx5uzhgYaCQV0QlolUNaTUlg8tmZZ6wbNF9zHHhlNJDMDzxOgFkysqK
         uo1nsoAHBxAbg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 15 Apr 2021 09:39:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-w7gUiqJv7P@https.bugzilla.kernel.org/>
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

--- Comment #69 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Artem S. Tashkinov from comment #67)
> Multiple users use acpi_enforce_resources=3Dlax and I haven't seen a sing=
le
> report that it's ever broken anything.

<sigh> Yet I have been on the receiving end of a bug-report where I had to
explain to a user that the lm_sensors sensors-detect script had overvolted =
his
RAM ruining both his expensive high-end RAM as well as his expensive top of=
 the
line CPU. The user was surprisingly relaxed about all this, which I really
appreciated.

And that was while the script was not doing anything which we (the develope=
rs)
considered dangerous. But the motherboard had a funky setup causing a SMbus
*read* transaction to change the voltage.

Mucking with this stuff can be dangerous and as Matthew has explained in his
thorough analysis of the DSDT the DSDT is actually accessing the superio an=
d if
that races with a Linux kernel access a wrong register may be read from, or
worse written to.

Using acpi_enforce_resources=3Dlax simply is dangerous and we are not going=
 to
change the default, period, full-stop.

I welcome further discussions here about how we can *safely* solve hwmon ac=
cess
on various motherboards.

Please stop discussing acpi_enforce_resources=3Dlax, that is not a safe opt=
ion to
use and more discussion about it is not productive.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
