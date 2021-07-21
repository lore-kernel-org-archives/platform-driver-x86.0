Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCF1C636CA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 09:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD3AC611CE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 09:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236692AbhGUIp6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 04:45:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:58214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237190AbhGUIdl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 04:33:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F335E611CE
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 09:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626858851;
        bh=TSsDJq0qd75/TgtlDhSs1DMrwev/jA3UibNn4kfIK+I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R03V0a9rNk1fs6tw2gyxdK8CSPXuKXnf5pt+J70+gcLqFu+yNxwveWlnFRiA5p/5H
         zcZ+sVPzkjLf63QPAgmeSl/1sXybHCA8LkJTBFFb2pXP83ERRbnjxJ0fdLpLx2TAs2
         rboyKlNs5c7qLUmjCahD3LrD3wvvjq5bYkE9DWlk0iy/jZSyPJ84QCVqpl2H+lQrSF
         ddAnjDyx+Fl6CFDjJXCwXBZyaKMp6JTI6sjWL70XswsYcBywPi7920agL3Kam3aGN5
         ftmNNMegE/tu61rEXr9I5A7UM8HWGCQCx05Qz8Abi79Pbu8rbsU8v2gOlUWu0NDyf4
         b3120yL7OFBFw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 09:14:10 +0000
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
Message-ID: <bug-213579-215701-ipMqIIoTO4@https.bugzilla.kernel.org/>
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

--- Comment #15 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Rod Thomas from comment #13)
> Are we doomed if no BIOS update is available or can this be worked around?
If it will be evident that there is no driver bug (see above mentioned bug
#213463 comment #9 for the details), then yes. OS may not affect this in any
way on any of the levels of the access available.

Mark, any comment from Lenovo?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
