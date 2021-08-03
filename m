Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9024BC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 13:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79C7560F38
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 13:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236065AbhHCNDk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 09:03:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:59716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235635AbhHCNDk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 09:03:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4CAF360F38
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Aug 2021 13:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627995809;
        bh=ORbyOu0TXXgkct4ds+Sgfg0eJBFL8jlGnQad1VneayI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=k0YArzcOlC/NWuG6tBfDrtDunGktibHNwPJPuXUUL1mP0r27ab7SqyZwZTylVa1np
         HQSN7E0E0eCes6P4jQ5b+bYfo1yyZGuD1vQfgLt0iU8/96dX+cE5JisKjL9a+gjPCn
         XYF2JCq04nZJVk2DxSaChTkLMKgF/rJnKBPIYPhMnb+tHnB8uG81E+6ZsExHlQ3vrE
         z3ZDe4vCyDQ3Qq/qkVClv5vO2PaJDu2wPGLZ2G5uBvy0Y5m5EBCZ+mMIKDd03x/G/G
         BxjXkq24QADMjj/XsLbcXiQvWfJlmAreBL1z9T9pW2JuubMbcaFmoib9vKfO3lWT3O
         KPnoUBrBfVdkA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Tue, 03 Aug 2021 13:03:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213579-215701-SuORhFcxd5@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #50 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Andy Shevchenko from comment #49)
> (In reply to wse from comment #48)
> > More testing with same result: Hardcoding the adress to 0x2C works on
> > widnows, but breaks on other values including 0x8C
>=20
> This is interesting, it may mean that Windows driver has a quirk against =
the
> firmware bug.

Or maybe it is adding 0x60 to all GpioInt numbers for some reason, it seems=
 we
are having a lot of issues with GpioInt lookups on Tiger Lake, so I suspect
that there is actually something which Linux is doing differently then Wind=
ows,
rather then there being model specific quirks in Windows.

Also see bug 213857 which appears to be yet another instance of this proble=
m,
that is with a high-end Asus laptop, granted Asus ACPI table quality is all
over the place but their higher end models tend to be pretty decent.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
