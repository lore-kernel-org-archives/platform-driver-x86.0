Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28030C56201
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Nov 2020 18:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5FE82225B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Nov 2020 18:14:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgKSSOi convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Nov 2020 13:14:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:48922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728692AbgKSSOi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Nov 2020 13:14:38 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210269] Tablet mode not correctly reported after wake-up from
 hibernate
Date:   Thu, 19 Nov 2020 18:14:37 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210269-215701-NdnZK0vDoY@https.bugzilla.kernel.org/>
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

Barnabás Pőcze (pobrn@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pobrn@protonmail.com

--- Comment #4 from Barnabás Pőcze (pobrn@protonmail.com) ---
If I see it correctly

  cat /sys/devices/platform/thinkpad_acpi/hotkey_tablet_mode

should be the value you're looking for.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
