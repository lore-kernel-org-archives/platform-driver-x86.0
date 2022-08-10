Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F80C00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Aug 2022 09:08:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbiHJJIb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Aug 2022 05:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbiHJJI3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Aug 2022 05:08:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC81786887
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 02:08:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 67A85B81B50
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 09:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30545C433D6
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660122503;
        bh=Er2UGUxiLDUlxtsUZdXMvZpJR3yH6Zg25xstZ7mQogU=;
        h=From:To:Subject:Date:From;
        b=Y1fnOz4cWdLmyBpsFESt9zoGV7PJ/i749oVrXWT3fB6x4yDHVZb3BebbMwR6TGkn0
         t/4OVBGbOGHMkDmoNyg8rw9PfhERpEIFLKg+xb8qc4wIoT97ZQ5SPr+SSAuqg1G47A
         zyxEfXFqTo9icn9wxx9PEvJUIml3Ucx0mx4z6IFKNaKOPVJOhUjjSi200hvnUXHNoV
         OYbyjNacW9i1TCWQOmm77vHUrFDzsEu8A8VceEeDlHLcCEvQZtdfLKmlTdTL4l1kfC
         H4hXOXir/EL2mqa5J3vAeT3/ovCtY85+smQb0jbSDIvnRTbFms+La1uDQK5z48oxwW
         oHUPbClIIIgfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 14DFDC433E4; Wed, 10 Aug 2022 09:08:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216347] New: ACPI power profile keeps switching to "low-power"
 on ThinkPad T14 Gen1 (AMD)
Date:   Wed, 10 Aug 2022 09:08:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216347-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216347

            Bug ID: 216347
           Summary: ACPI power profile keeps switching to "low-power" on
                    ThinkPad T14 Gen1 (AMD)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: madcatx@atlas.cz
        Regression: No

Hi,

I recently discovered this annoying behavior. I use an udev script to toggle
between "low-power" and "performance" ACPI power profiles based on whether =
the
laptop is plugged into a wall. By cat'ing "/sys/firmware/acpi/platform_prof=
ile"
I observe the power profile always dropping to "low-power" a few seconds af=
ter
I manually change it to something else.

The machine has a 4750U Ryzen chip and the latest 1.41 firmware (DMI: LENOVO
20UDS02D00/20UDS02D00, BIOS R1BET72W(1.41 )). I run the latest 5.19 kernel.

I tried to toggle between S3 and S2idle sleep modes but that doesn't seem to
make any difference.

Is there anything I can do to help track this down?

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
