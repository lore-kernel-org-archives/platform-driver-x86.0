Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B974C388F9
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Nov 2020 14:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D90922226
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Nov 2020 14:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgKUORo convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 21 Nov 2020 09:17:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:44906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728034AbgKUORo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 21 Nov 2020 09:17:44 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210269] Tablet mode not correctly reported after wake-up from
 hibernate
Date:   Sat, 21 Nov 2020 14:17:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210269-215701-luk9PCKbpV@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #10 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Benjamin Berg from comment #8)
> I wonder if we should only do this if the switch actually changed. But I
> suspect the input layer will already take care of that case.

There is no need to check if the switch actually changed, as you already
presumed the input layer will filter out the event if there is no change.

(In reply to Julian from comment #9)
> Your patch seems to fix the problem Benjamin, thanks.

Awesome, thank you for testing.

Benjamin, can you submit the fix for this upstream please ? Then I'll pick it
up and merge it for the 5.11 cycle.

Note please add the following tags to the commit msg:

Fixes: dda3ec0aa631 ("platform/x86: thinkpad_acpi: Implement tablet mode using
GMMS method")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210269

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
