Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49D9C433E9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Mar 2021 19:49:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A42A264FD2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Mar 2021 19:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbhCJTsz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Mar 2021 14:48:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:51250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232907AbhCJTsX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Mar 2021 14:48:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7FF4864FB5
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Mar 2021 19:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615405703;
        bh=AtVTm9v2ynhxjQyrxepBOAv7/QkMwVWeFC61MhU3Q4c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Q93AXeo7ZlUhb7rXqD/zUUJLvDQXR3nHEWPDZx2sq0iDze1az7Qsn3IddoHs1MYU9
         h0hOHkK2owOU1s1qe4jNKUSLs1B3S9x/3g4SAPsRZme72vgU1rc90CHeEZ0kd9/fQP
         07c0danoDhVMtP01izWIhoZKyG2KAXhKCPa9s5kGDgS3qzLrkhLSLrVtEerE8+lF4A
         3YcT/x9FgDVL2lm1QqwO9MzxevyThwWHI4kw1+FgDSsiaaBMu+cli6dRcEA0LAgHfW
         4IWJgwWF7PNKGZjAbXmdXgoSCq9+gNMswkDU3nk82iwIPgeI6NGEFUHa3LcowNCoVW
         Ld2HCTc62bOqw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210457] Fan sporadically maxed on wake-up due to unavailable
 sensor temperature
Date:   Wed, 10 Mar 2021 19:48:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reescf@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210457-215701-ClhsbM5dL1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210457-215701@https.bugzilla.kernel.org/>
References: <bug-210457-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210457

--- Comment #3 from cfr (reescf@gmail.com) ---
I tried adding=20

acpi.ec_freeze_events=3DY acpi.ec_suspend_yield=3DY

to my kernel command line and rebooting, but I never got past the screen
displaying the command. The machine froze and I had to poweroff.=20

Is there a newer invocation I could try here?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
