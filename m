Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1B9C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 14:59:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20C0260F56
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 14:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbhHCO7u (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 10:59:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235773AbhHCO7u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 10:59:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 049E860F56
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Aug 2021 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628002779;
        bh=j4Jk3DVff0/Qu0QTwx1pj5nXo9lRhZMav+RDiUEqhOA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=b0XYsxsavCnDCDwEtCZJ2HcbRR0g8VXGMhbRFknubxFdNaaf2YPNYQoltigBEsvGs
         UtGh16h+QVDiwYB5OsGC/chC8cbtkPDSif1hxZbJOYv1+xv6E1FoJ479W52NOiIbNH
         psTW5gbhT4eFSy07qfED3iWuCiVmbk3+XTVsG7LbnTdfMlwfx7BrSzRw40DMr6Ag/3
         bJKfKZT8MEuSKYuAR1saTxGcRPSLOnxRe7A0D0NXwTnhcED+Xn9rFN4sJjV5ZiV7fV
         43P71c+GEMmE4s1RJAZiNuIR0sRXBQEwWVZ5YRqA20rRXaWhK+GGeisRa1t/+mSy4Y
         k+UVusnvbZaVw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Tue, 03 Aug 2021 14:59:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-VSILDLyw1S@https.bugzilla.kernel.org/>
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

--- Comment #53 from wse@tuxedocomputers.com ---
I know it's a linux bugtracker, but does anyone actually know where pins co=
uld
be checked on windows? Aka if I can check that the touchpad is really using
0x8C and what it is trying to use with a manipulated DSDT (to see if it's an
offset or a mapping issue).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
