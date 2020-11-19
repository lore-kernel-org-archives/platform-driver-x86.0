Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BA1C64E7B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Nov 2020 15:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C627C2469D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Nov 2020 15:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgKSPjd convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Nov 2020 10:39:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:39272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727874AbgKSPjd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Nov 2020 10:39:33 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210269] New: Tablet mode not correctly reported after wake-up
 from hibernate
Date:   Thu, 19 Nov 2020 15:39:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: j.r@jugendhacker.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-210269-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210269

            Bug ID: 210269
           Summary: Tablet mode not correctly reported after wake-up from
                    hibernate
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.9
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: j.r@jugendhacker.de
        Regression: No

I'm currently using a Lenovo Thinkpad X1 Yoga 2nd Gen which is a convertible.
If I fold it into tablet mode, go to hibernate / suspend, fold it back to
laptop mode (while powered off) and resume the system the tablet mode on/off is
not reported anymore until I fold it into tablet mode and back one time.

I debugged this via evemu-record which does not show 0 for SW_TABLET_MODE when
I resume in laptop mode.

I also tested if normal sleep / suspend to RAM is affected but there
SW_TABLET_MODE was correctly reported after resuming.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
