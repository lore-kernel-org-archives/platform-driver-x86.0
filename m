Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42CAC43217
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Jan 2021 22:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 967B623104
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Jan 2021 22:40:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391068AbhASOgn convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Jan 2021 09:36:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:51810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389884AbhASNj3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Jan 2021 08:39:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id EB4D92313C
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jan 2021 13:38:48 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Tue, 19 Jan 2021 13:38:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dmaroulidis@dimitrismaroulidis.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-ahC0WyXDdt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=199715

--- Comment #42 from Dimitris (dmaroulidis@dimitrismaroulidis.com) ---
After updating to kernel v5.10.8.arch1-1 (on Archlinux), and building the
latest module from AUR, I got an error during module loading on startup that
the bitmask was out of bounds. So I set the bitmask to 0x8007 instead of
0x80007 as in comment #31.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
