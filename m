Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8258AC433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:46:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E4886108D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:46:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240496AbhESNr5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:47:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:46734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240231AbhESNrz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:47:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3858B6108D
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 13:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621431996;
        bh=C3x4GJAsmM7St+SsfGyZ2yjgVI4kNXcCEu13Vpq9tIU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=scbczewDWgswBY7QfJcHLgN9NWWRL//KAr0G+fc72h9SPFDKuqThDO+2I4jEYaVoA
         Bb+H8H34HhWPrPBtwSViM3r7ozKE3CuGw11uGgXh9pkjNJF03zszChVltoFJzfiLyZ
         VayooT0TPXWN0ofgwPvFY1bPEMPSryvOU6CXcEkHxbQwiKFIiz3GMxX1K1SKzJYlMj
         AolqHagJRh37KX8GTNI0nflZVkmLReWrACiTB2zFtNwBMu5XIY3uLFa8g2BL1+OuAb
         IL0Gp5RnZby565JPuLdFqwvJX6D0RSL+Y1xhXwtIfy8wJzCK2HCLgK62APBppwyMwV
         sLMMgx+TYM69w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213109] ideapad-laptop: Regression in 5.12.x for Battery
 conservation mode
Date:   Wed, 19 May 2021 13:46:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-213109-215701-M3R5lIb5qG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213109-215701@https.bugzilla.kernel.org/>
References: <bug-213109-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213109

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g
         Resolution|---                         |CODE_FIX

--- Comment #2 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
I've added the patch fixing this to the fixes branch of the pdx86 kernel tr=
ee:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/log/?h=3Dfixes

The contents of this branch will be in the next pdx86-fixes pull-req which I
send to Linus for 5.13. Since the patch has a fixes tag it will get added
automatically to the 5.12 kernels once Linus has merged it, so this bug can=
 be
closed now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
