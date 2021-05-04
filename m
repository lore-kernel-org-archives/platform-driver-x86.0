Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FA4C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 10:51:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8569611EE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 10:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhEDKwL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 06:52:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:46540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229903AbhEDKwL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 06:52:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 06F7160C41
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 May 2021 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620125477;
        bh=vPb39RqPpiLioclrC5B85vIEeQe+6d4afFn3BjRST5k=;
        h=From:To:Subject:Date:From;
        b=CmbOQhpEkqdd99/nMWrFjxYDzxFjfxAU76KzscTXmn85CEQzFkmsVrZv0gOwPthzE
         7GF2rNHBrOKFed46NIf6Eu1kARj3ieDliI0RExLhVXrnOnBiVMbpVrCHT1CNrnDerH
         Q0x3ib6fPIauT/v41fMGu4ZFxY5B07sRtnncWqVoEHMz9BZlI8Wukpq/2258gCZ3te
         N0q7DIiH8w+2fgRV4YB/D6MRt6RuigifArmNlTf1ABZ22ytY91MzZA7FShmGiEdYFc
         Tn3R5KgvPyL5g2N2ED0eqILMBddZa4mTEvwiO4CNilhKWTmDpBjbCVbzSq0uF55Rn/
         K0kYhgUBZhiUw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 212939] New: thinkpad_acpi reports balanced in
 /sys/firmware/acpi/platform_profile when thermal throttling
Date:   Tue, 04 May 2021 10:51:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212939-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212939

            Bug ID: 212939
           Summary: thinkpad_acpi reports balanced in
                    /sys/firmware/acpi/platform_profile when thermal
                    throttling
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: jwrdegoede@fedoraproject.org
        Regression: No

The platform-profile interface implemented by thinkpad_acpi and available
through the /sys/firmware/acpi/platform_profile, should reflect the last us=
er
selected value.

Where the user-selected value is either the last value written to the sysfs
file, or selected through Fn + L / M / H. Key combinations.

When in performance mode and the CPU temperature goes over 97 degrees Celci=
us
the embedded-controller will temporarily drop back to balanced mode to give=
 the
CPU a chance to cool-down a bit. This is fine as an internal implementation
detail, but this should not be visible inside the
/sys/firmware/acpi/platform_profile interface (1).

Having it visible here causes problems for userspace. E.g. the selected pro=
file
visible in the power-panel of gnome-control-center can be seen jumping betw=
een
Performance and Balanced all the time, as if the user is pressing Fn + H, F=
n +
M, Fn + H, ... all the time.

Note this is not so much a kernel bug as that it seems to be a problem with=
 the
firmware interface which thinkpad_acpi is using. As such this
bugzilla.kernel.org entry is purely meant for tracking this issue, IOW a ke=
rnel
fix for this will not be forthcoming, but hopefully we can get Lenovo to fix
this on the firmware side.


1) The information about the thermal limits leading to temporary dropping b=
ack
to balanced mode could be exported elsewhere, like how lapmode is exported
through: /sys/bus/platform/devices/thinkpad_acpi/dytc_lapmode

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
