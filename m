Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC86DC433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Mar 2021 07:23:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B545464F6D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Mar 2021 07:23:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhCLHWm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 12 Mar 2021 02:22:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:48842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229688AbhCLHWb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Mar 2021 02:22:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1556664F6D
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Mar 2021 07:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615533751;
        bh=mmob1yvevyr64rbvH9FSQKgsj8PGGLXTP6hbPm+t2Sw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=coH280xUlzxKcdE7vm9vlJ3TiojsDerv1DX0FXD/cSkIAntsOWbqzD7mL+J6fC/dz
         gfCudxW3pGD3ONK6CybHt59fRiD937CupPi+/dKpNXATQYjlgXdHprdMfXzpXOLCnq
         Nj/bR2HE0oL+CXgMECxaM2g8pVlYniqvTbF9Jw9Kf7hYWD0hRwsiVHjfLJ/p+UVZfW
         yv0/pYwesTTery/iS95c1m/xm3gQ4L7O8VXvS+daiGUBGkVyCNAhQtmmlRgkq43bcw
         egnWZvTM3wGRw54t23v9kFjC4pL1+KJo6yHn90xjXL6Y8u/ZtpOOpyARpMBIaxoFdK
         +Tfbkk2CYeFAA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211977] System fails to resume the second time with 5.10.17,
 resumes fine with 5.10.13
Date:   Fri, 12 Mar 2021 07:22:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211977-215701-W9vEe1HsB7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211977-215701@https.bugzilla.kernel.org/>
References: <bug-211977-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211977

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
This is seemingly fixed in 5.10.19.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
