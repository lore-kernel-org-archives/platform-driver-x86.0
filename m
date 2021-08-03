Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAB9C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 13:27:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E647160F0F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 13:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236356AbhHCN1q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 09:27:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:36334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236245AbhHCN1p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 09:27:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6BE6B60F0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Aug 2021 13:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627997254;
        bh=TCMorOfz1wU8KCODWcEgi6dUu4981liskxextnlO4Dg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sg36VoIQ6EST3c+9juBnsnDCpOp2uDLR19FsQBFF2omxIsd3QaRyDRo9XO7l9FCYg
         UvkVSL3JannZQOIbdHJpB5xAu1reEgvx4D+bcytyY9rbCxh7aUaG1aZ/7v+eTWNUjJ
         tnkXuxn8qHujMRbIaMRmoKnVmmU+FXy+Qq5Gqek4Kf4nYWlWZkj4PiO7QRejhCX6jN
         WQv1MUT6iT/IwRDcNF3PYklS4i3tJXV5r4zmb3ekyFhqTJdI2L+NS1UvzpggmMm2yy
         r+lo/IK0hUBEDRUKeEqsPCLSWEL4+A/nWZarsYcC5cyy9ju/ALLC697h72wd5/sF+j
         SXEbS//3YIifg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Tue, 03 Aug 2021 13:27:34 +0000
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
Message-ID: <bug-213579-215701-fRgsMDv95Q@https.bugzilla.kernel.org/>
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

--- Comment #51 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Hans de Goede from comment #50)
> (In reply to Andy Shevchenko from comment #49)
> > (In reply to wse from comment #48)
> > > More testing with same result: Hardcoding the adress to 0x2C works on
> > > widnows, but breaks on other values including 0x8C
> >=20
> > This is interesting, it may mean that Windows driver has a quirk against
> the
> > firmware bug.
>=20
> Or maybe it is adding 0x60 to all GpioInt numbers for some reason, it see=
ms
> we are having a lot of issues with GpioInt lookups on Tiger Lake, so I
> suspect that there is actually something which Linux is doing differently
> then Windows, rather then there being model specific quirks in Windows.

Actually you may be quite right because number of bugs is growing. The
numbering scheme of GPIOs is mystery and subject to last minute changes
(because it's pure artificial layer on top of the hardware). It's quite
possible that the driver was upstreamed with outdated mapping (see 4th
parameter to the groups in the communities in the driver). I'm investigating
this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
