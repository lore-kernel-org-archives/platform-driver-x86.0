Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7A2C4708F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 19:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9011C61378
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 19:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbhFATYv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Jun 2021 15:24:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:56936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234513AbhFATYu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Jun 2021 15:24:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 39E5F6136E
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Jun 2021 19:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622575389;
        bh=fWx/9ySNJF0Xo14ljkMgoN3AFfBB4TCutzNlJmOCxk0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ea9FxFEszuPdcEuinSs+Oxn5sb48WdHtxpU9viQcgbqow7CWdWYKUllZ+hAJLY0Yp
         S9n15hLz0n1/ygD2JhDkH9HL9046S4uocnLCV8dzvrF9rJpdX7/miOMPHgPw/5bgnx
         43BGTLfJoCmf2yQjJCm2QJtOW2n+ZnpSyrV+NpKsr0EkTSmm7j7ikOgm6hYphduLw9
         WsNXlgoS7M5QshY9wxt9sYprBqF7Q4g7CuPHydhBYgsfM2ducmmiNmIE6P4Al6IiQ2
         JF7WLJdLeK5b2hcVDw9dDmK3VHfEcIioOr7FTmdwuXwdnwz9S15n+5LHxD4I+BS7G4
         WsFi9UTZuHHJQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Tue, 01 Jun 2021 19:23:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pobrn@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213297-215701-NbrV9Hfg8M@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213297-215701@https.bugzilla.kernel.org/>
References: <bug-213297-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213297

--- Comment #5 from Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) ---
The DSDT contains the following:

Method (DYTC, 1, Serialized)
{
    Local0 =3D Arg0
    DYTP =3D Local0
    Local1 =3D Zero
    Switch (ToInteger ((Local0 & 0x01FF)))
    {
        Case (Zero)
        {
            Local1 =3D 0x0100
            Local1 |=3D 0x40000000
            Local1 |=3D Zero
            Local1 |=3D One
        }
...


and you can also see that the DYTC method returns "Local1", which is set to
0x40000101 (I think - but the important part is the 0x40...). And you can a=
lso
determine from the driver that the version is in bits 28-31 of the return v=
alue
of the DYTC method when called with 0 as its first argument. And those bits=
 are
exactly 4.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
