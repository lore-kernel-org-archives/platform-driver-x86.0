Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7132C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 27 Feb 2021 13:11:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D79364EB3
	for <platform-driver-x86@archiver.kernel.org>; Sat, 27 Feb 2021 13:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhB0NLS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 27 Feb 2021 08:11:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:53380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229946AbhB0NLR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 Feb 2021 08:11:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 750B964EB3
        for <platform-driver-x86@vger.kernel.org>; Sat, 27 Feb 2021 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614431436;
        bh=kAU5msXrWdP5FjbNm5hiAQn5+ahFKOYrh8Ms2Cr5h1c=;
        h=From:To:Subject:Date:From;
        b=rWbHuXiK9BWDPBU1ei+k3VdEMXXCWpT8XtcpSB+/1A0Vn9bWixJVeg0WI0or/KxYL
         2PYUMDftlE6evKO9GUubDFfNeG1aaFmyrnrBeBQejMg2cMCO8J+82ZwNV+7tw9nuPM
         LGBE2hiuRXZ2oo9VxNV5A6AIESouwqFEUQzbz/T4mfG0lCX5aTYv98pUQpyflMarvl
         GH8dNgfd2IRM6d/0C/S3VxFW/5ZZrfvxhW0BL8vElDMXn8fvLf6Vf8QVv+S/CnU4DQ
         7f65KyKuziND/J7ASxsTK9UnQyUEIsrzU0stwL4rFDrQZeaRrrDm+VWhWNSbkz/BMv
         kPY6LjP3gxAdg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211977] New: System fails to resume the second time with
 5.10.17, resumes fine with 5.10.13
Date:   Sat, 27 Feb 2021 13:10:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-211977-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211977

            Bug ID: 211977
           Summary: System fails to resume the second time with 5.10.17,
                    resumes fine with 5.10.13
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.17
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: aros@gmx.com
        Regression: No

Steps to reproduce the issue: suspend and resume.

How often does the steps listed above trigger the issue? 5.10.13 - resumes =
OK
as many times as you want, 5.10.17 - randomly fails to resume on the second
time, sometimes it's the third or the fourth time - anyways it some point it
fails to resume.

When it fails to resume, the system is completely dead: CAPS lock doesn't w=
ork,
the power button which normally shuts down my laptop also doesn't work.

System info:
Linux localhost 5.10.13-200.fc33.x86_64 #1 SMP Thu Feb 4 14:54:51 UTC 2021
x86_64 x86_64 x86_64 GNU/Linux
Fedora 33 x64
HP Pavilion x360 Convertible (P1F10UA#ABA)
CPU/GPU: Intel Core i5 6200U/HD Graphics 520, rev 07
Display connector: eDP

I _really_ wouldn't want to bisect the issue because it will involve buildi=
ng
Fedora's kernel on my quite feeble laptop.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
