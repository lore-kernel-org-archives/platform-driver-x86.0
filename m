Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD81BC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Mar 2021 19:25:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B7F564FCC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Mar 2021 19:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbhCJTYs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Mar 2021 14:24:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:47992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231126AbhCJTYZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Mar 2021 14:24:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B089264FC6
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Mar 2021 19:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615404264;
        bh=YDMtGy2Ldtt+NX+K4GhhYxY/0Bi6fQmCwMqTNad6FtY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=a1Q6Ypf3YSLz/NWja+ho7d9VHWhHEmTExDJKPJiaDvM9cyFhIzzAzkdx3N+aAb7Kj
         Ivt50GDz7N6lFdTGH0KabTRbNF5gld/Igapzyt8LhtjiEjbIX16j//6IfKCnQQ6dQi
         ctwoNVM0PpG4J4yNGL7Yzh3NFIOqkOYsetq0V3Iy+LZnuSg/bl2nQv3tucmXWvb28x
         Xrsg18OcmliNFZlHXQ/DFSOE7JqDj6wEq4rHMBP5twDO9MuHT2Jch1WK5j5bvjrh42
         gkapnjKBo6cmoS7JshSYclGCya9fm26NxnBD8RmH96F9lUxGm+sWhjAroEfVViCHj+
         WQXFpzis0x0qQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210457] Fan sporadically maxed on wake-up due to unavailable
 sensor temperature
Date:   Wed, 10 Mar 2021 19:24:24 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210457-215701-SrjOGtUTvx@https.bugzilla.kernel.org/>
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

cfr (reescf@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |reescf@gmail.com

--- Comment #1 from cfr (reescf@gmail.com) ---
Lenovo ThinkPad X720 is also affected by this, but it is not sporadic, as f=
ar
as I can tell. Not once since installing my current kernel have I seen norm=
al
behaviour following sleep.

The problem persists if the machine is rebooted. Only powering off and
restarting restores the expected behaviour.

The bug seems to be a regression. See
https://bugzilla.kernel.org/show_bug.cgi?id=3D196129. My machine was not af=
fected
by the original bug, but the problem looks to be the same.

Following sleep:

cat /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon7/temp*
0
1000
0
0
0
0
0
cat: /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon7/temp1_input: No such
device or address
cat: /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon7/temp2_input: No such
device or address
0
0
0
0
0
0
0

and

cat /proc/acpi/ibm/thermal=20
temperatures:   -128 -128 0 0 0 0 0 0 0 0 1 0 0 0 0 0

Prior to sleep, only the second sensor is missing and acpitz-acpi-0 gives a
sane reading. Following, the first goes AWOL and acpitz-acpi-0 is stuck at =
48.

Removing and reloading thinkpad_acpi makes no difference and, for me,
re-sleeping and rewaking makes no difference either.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
