Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8D6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Nov 2021 13:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9E1361AF0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Nov 2021 13:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235533AbhKSNlX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Nov 2021 08:41:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:42704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235488AbhKSNlX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Nov 2021 08:41:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id AAC2461A89
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Nov 2021 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637329101;
        bh=anmJcwvgDJTNtzyygHXnitRG9TWNR38wAfYgv+xKnl4=;
        h=From:To:Subject:Date:From;
        b=jjfqa/DrMvr1Nz7/RYJ+Pn6u6kdbKaj7GjhtDGz1ZA+sMhl5j+oMVqK8BT5dUOUSK
         Lu6lmwpWTQGGJe9tpitxNdL48eyQ84jos6F2Rkm5VdL3dcLfuPu6UKnIMmI2IAWrSB
         snIyW3a5wF6XXFKKp62SFFWEjjl7Ex4h0H+YDcy8CvtHBiwEHUljodAkitbROWJ7zQ
         PrwuANu8PFYkJsXlWWvEAUazRy5zRuh/iVnqEFUfXvHAN6zOgzssyLyrfPjgbgUY7o
         rmUpY1Nfq0FXZY0+T2oulbkJhiLrIMOM3Iq7ZT6NeAZrrDo9ximeQ6m1vW+zFUit3+
         fsOltIppsKCXA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215075] New: BUG: scheduling while atomic:
 cpuhp/1/21/0x00000002 when going out of sleep S3 state
Date:   Fri, 19 Nov 2021 13:38:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215075-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215075

            Bug ID: 215075
           Summary: BUG: scheduling while atomic: cpuhp/1/21/0x00000002
                    when going out of sleep S3 state
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.2-arch1-1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: samy@lahfa.xyz
        Regression: No

Created attachment 299641
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299641&action=3Dedit
Dmesg log of the bug when going out of sleep S3 state

This bug has begun to happen recently, I do not remember however what was t=
he
exact kernel that introduced this bug.

My computer is a Thinkpad T495 with a Ryzen Pro 7 3700U with a integrated
graphics card a Vega RX 10.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
