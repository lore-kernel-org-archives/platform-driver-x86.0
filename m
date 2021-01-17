Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38804C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 09:08:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0802520C56
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 09:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbhAQJIW convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 04:08:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:34670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728354AbhAQJEN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 04:04:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8C0BE2168B
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 09:02:45 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sun, 17 Jan 2021 09:02:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@richard-neumann.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-Q7NlBVA5KZ@https.bugzilla.kernel.org/>
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

--- Comment #25 from Richard Neumann (mail@richard-neumann.de) ---
@Luya This is due to the fact that you, like me, use a laptop (HP Enxy x360
13-ag00xxx) which ships with an AMD SFH that has no sensor mask written to its
P2C registers. I discussed this on the mailing lists and proposed and provided
a solution by introducing a kernel module parameter [1]. However this was not
adopted in the upstream version for kernel 5.11. So I submitted my refactored
version, which I am using for nearly a year now, which incorporates such a
parameter [2]. I have not yet received any feedback on this one or the first
submission, which I sent two weeks ago and which seemingly directly went into
/dev/null. Anybody interested to review and possibly use my refactored version,
can obtain it from my github repo [3].

[1]
https://patchwork.kernel.org/project/linux-iio/patch/1582779537-25662-3-git-send-email-Sandeep.Singh@amd.com/#23253155
[2]https://patchwork.kernel.org/project/linux-iio/patch/efa4524cd07abe0a7773b24d33b64f09e0bf1f82.camel@richard-neumann.de/
[3] https://github.com/conqp/linux/tree/amd-sfh-hid/drivers/hid/amd-sfh-hid

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
