Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B781EC433B4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 May 2021 16:07:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 937776052B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 May 2021 16:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343684AbhEQQIU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 May 2021 12:08:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:58872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346574AbhEQQGS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 May 2021 12:06:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5598660E0B
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 May 2021 16:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621267501;
        bh=1IM75op6ioDF+oKoj3Yv1b/NZ4QIwC/8U/Rv+QYP4p0=;
        h=From:To:Subject:Date:From;
        b=W5K5tUQIwa1UALvodS/aHqdqEIgvNEBzpj55vhFvxICdm9SDA9iPfrpRT4bSfBWeH
         ShS1hnp4aU2WY6gvHsDjkrOKNQFhSLEVi/O/5xLMyYcbNh6zmd0BcOS2n5qDVeSrsN
         gppudMBV7FC0XqcsKLWvgma2lZhAXUYI5Ln7Vc1e3JrVDBqbRfgJY8Jneoaok4GFQ3
         FiPgcYh30WyoH5Agdka6/eUdEg3HjRBf8Vt0VPiJsnEkrH1pLf0Y0/6wbVYP+ckb+f
         lcokzlt8DnJeQsReZZ5YUJofFz1eLWUlBLg2YmxnI78Pn0SZ216V7tt08er3dPijZ4
         ozNoTCeaywLQw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213109] New: ideapad-laptop: Regression in 5.12.x for Battery
 conservation mode
Date:   Mon, 17 May 2021 16:05:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fouad.fakih@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213109-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213109

            Bug ID: 213109
           Summary: ideapad-laptop: Regression in 5.12.x for Battery
                    conservation mode
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.4
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: fouad.fakih@gmail.com
        Regression: Yes

Enabling battery conservation mode no longer works on Linux 5.12.x for Leno=
vo
Legion 5 15ARH05.

It works with kernel versions 5.11 and 5.10 on Arch Linux.

Modifying `/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_m=
ode`
fails with message : `Input/output error`

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
