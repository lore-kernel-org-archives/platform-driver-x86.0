Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C83C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Mar 2021 19:54:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 232F164FC9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Mar 2021 19:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbhCJTyW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Mar 2021 14:54:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:51938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232659AbhCJTyV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Mar 2021 14:54:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0562564FBB
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Mar 2021 19:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615406061;
        bh=3Sk40NHWFikAzcjIDs4FyZ7XWtaNL6MCEHb05ZHXSG0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lajpcE7lVqIxib654zjfq1ZjC4OUNlsY3m0MiCVEHv0eq1t3Bdx4kEAQLgHBbKxbZ
         5tZewz822K7+QYWabSBxNWgfuIkFzak3yBq5GI3z3grYGGMQxQGX2BOalEpwN69oQJ
         rZMPJtPLpcDAc80I5VQBxhgK3wa3fh8TxEv5+jzaX+jk06/qHZPyoodoemjSwvdUeG
         yd2o9D/4a7rezMMDlNRiQGAl/DVvXR4Ha7hJp5T9VBOaDY/7gdyy6hraAlJRW5tIrt
         qHYrYlbWfhbrsvPRCbINKvuOqaewuuQclQ9MVUkyR2Tw0mKwnQEmyUP+d/TKTg1jGO
         kXwBX1fV7qp8Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210457] Fan sporadically maxed on wake-up due to unavailable
 sensor temperature
Date:   Wed, 10 Mar 2021 19:54:20 +0000
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
Message-ID: <bug-210457-215701-Ipi8TUtm1o@https.bugzilla.kernel.org/>
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

--- Comment #4 from cfr (reescf@gmail.com) ---
The bug does NOT manifest if I boot linux-lts 5.10.21-1. Following sleep:

cat /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon6/temp*
0
1000
0
0
0
0
0
38000
cat: /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon6/temp2_input: No such
device or address
0
0
0
0
0
0
0

and the fan is at 0RPM, while acpitz-acpi-0 and thinkpad-isa-0000 temp1 are
both +38.0=C2=B0C.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
