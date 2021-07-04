Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B558C07E95
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Jul 2021 14:35:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66775613D8
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Jul 2021 14:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhGDOiK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 4 Jul 2021 10:38:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:34896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhGDOiK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Jul 2021 10:38:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 96ECB613D8
        for <platform-driver-x86@vger.kernel.org>; Sun,  4 Jul 2021 14:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625409334;
        bh=cuBj2DWb+Jd/TKl66ZWJocfbgxJtzpIOlK6kShSSRBs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sbnwxSfAiB//J6m1i9rGY9Y4u2k2D/JoKAz3Eb5z72eQclSUIP5qQjBGn+3qv9bz1
         3AVTdzZ1/PqLOZK1tHM20IfnH1lzR6kohGof0x7bZSuhB/8ZWfdmZBwHriPrP/VLvB
         /EU0PUhveM2hXU/gylCMtErVNznDcZeeJX3lRXQZ1Eia3ttxeUKgm2GUPXIKC16gYi
         nbUi5QVHzVbDHmfsMdwlt0ysGFMc8Urm7YXLXi+Og1SvXFklfVY+9WH4fDJw20aw9E
         HvJHJNTOhWCFwBy/QW/oh9KOQIm2dMVoccTUT8AsKTkd9h6mUIhL5OgH6f9RmpeqRe
         vkye4eED4wpeA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Sun, 04 Jul 2021 14:35:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: patacca@autistici.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-eY1xf2PhFj@https.bugzilla.kernel.org/>
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

--- Comment #8 from Riccardo Mori (patacca@autistici.org) ---
Thank you Andy for the link.
I don't think it's the same issue though. If you could guide me in diagnosi=
ng
the issue it would be very nice.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
