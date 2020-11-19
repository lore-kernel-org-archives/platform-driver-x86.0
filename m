Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F423C63697
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Nov 2020 16:46:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB89F22242
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Nov 2020 16:46:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgKSQqa convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Nov 2020 11:46:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:56142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729266AbgKSQq3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Nov 2020 11:46:29 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210269] Tablet mode not correctly reported after wake-up from
 hibernate
Date:   Thu, 19 Nov 2020 16:46:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: benjamin@sipsolutions.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210269-215701-Fo6eXoLsQh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210269-215701@https.bugzilla.kernel.org/>
References: <bug-210269-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210269

Benjamin Berg (benjamin@sipsolutions.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |benjamin@sipsolutions.net

--- Comment #1 from Benjamin Berg (benjamin@sipsolutions.net) ---
Yeah, the only thing that is missing here should be a call to
dytc_lapmode_refresh at resume time.

i.e. should be as simple as:
 * Adding a resume handler into dytc_driver_data
 * Add a call to dytc_lapmode_refresh there

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
