Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596FDC433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Feb 2021 18:58:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16B4464ED5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Feb 2021 18:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhBZS62 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Feb 2021 13:58:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:37500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229745AbhBZS62 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Feb 2021 13:58:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A107964ED5
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Feb 2021 18:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614365867;
        bh=VTz+tRU0IoavHbadifdDF2D/msQK/bENwGUH8qeIja0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=a8gfRUQ1gUeNQv/9s2I8Q+VycttJj6L6sxbQtNRbsCUPfvXgz6leTkXTeZ4A0SXnN
         kORtOP/7DZlXjsia+SxmeFmjGzC/jkceq96h/oQ0DrU/B/bHj4732Dc4vrGlIad9hq
         OlhIs7WEqRArje3FMU/oThY34QRQv7DixF+xvdZZknNIx/v6Rl9PoD1rMgiHM9tUdZ
         x65YfgbrZ6aB+B70m3d6zRlg4a1ooNt1nl+GqYDk5DZV1nafPc95qakiNwFx8VD467
         rTuNR44JWVzC0c/+gz9i/hNcHQr5O+rUGBuwZ9wJO4+B/jpn/P+w8Lm9YlEXXePWhS
         NuWiUDZbc4dIQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211895] dell_wmi_sysman causes unbootable system
Date:   Fri, 26 Feb 2021 18:57:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario_limonciello@dell.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211895-215701-QQA6hCDS7V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211895-215701@https.bugzilla.kernel.org/>
References: <bug-211895-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211895

Mario Limonciello (mario_limonciello@dell.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario_limonciello@dell.com

--- Comment #3 from Mario Limonciello (mario_limonciello@dell.com) ---
So if it's 5.11.1 as well as linux-next then you have
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/dri=
vers/platform/x86/dell-wmi-sysman?h=3Dlinux-5.11.y&id=3D215164bfb7144c5890d=
d8021ff06e486939862d4
already applied then.

> 5570/5470?=20=20

These are quite old right - like they came out in 2015/2016 time frame.

I would expect they don't support this interface, but they should have bail=
ed
more gracefully too.

Can you please test https://lkml.org/lkml/2021/2/18/748
It needs to be re-spun from maintainer feedback, but I think it will fix the
issue for you.  If it works for you, i'll respin it soon and you can test t=
he
new one as well hopefully.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
