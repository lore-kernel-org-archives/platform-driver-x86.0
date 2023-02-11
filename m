Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34653C636CC
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Feb 2023 03:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjBKDvd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 22:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjBKDvc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 22:51:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D137370714
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 19:51:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 824ACB826CD
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Feb 2023 03:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 423A3C433D2
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Feb 2023 03:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676087489;
        bh=HUxjkNdu3CZ1UmkFNEkhHxeIIXcRdc5ngbNFHlgHL24=;
        h=From:To:Subject:Date:From;
        b=FZrJbWtqiLVypfCziIuWKikIE7r1zN/ZpAfyLiZn381j7+IGa1WSXYkV3qPqV4Cwt
         PPzutlab28bxDxnbBsGB+pVhekJKcIdgcQsXoxLHj0wexkfSzuoF13e6DjK6UewDjo
         ErUs4hYeItPLb5Z+UQtU2Vrn5+ivPM0iocU4kXSXoTjFPKEOtiZF9bPfMgj39WhoO9
         +JQPnFaMtilLsM08xywJRwSk+hr4zSlY73xU91GcBQPMPYGzvn0Znu8W69ZtfEaxuZ
         CygG6lIHC8keSattYU2jJcNh2SROy7FFEjMcpisCpFJmsnwGdMsrWz4TUhoxugM6Kz
         piVaqR93MkJcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1A4A6C43142; Sat, 11 Feb 2023 03:51:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217020] New: hp-wmi: Unable to change platform profile:
 Operation not supported
Date:   Sat, 11 Feb 2023 03:51:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luisbocanegra17b@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-217020-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217020

            Bug ID: 217020
           Summary: hp-wmi: Unable to change platform profile: Operation
                    not supported
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.2.0-rc7
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: luisbocanegra17b@gmail.com
        Regression: No

Created attachment 303711
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303711&action=3Dedit
ACPI table

Hi,

I have a hp omen 15-dc1004la (board 8575, latest BIOS installed) and curren=
tly
can't change the thermal profile, I get this error:

# echo cool > /sys/firmware/acpi/platform_profile
bash: echo: write error: Operation not supported

# cat /sys/firmware/acpi/platform_profile_choices=20
cool balanced performance

# cat /sys/firmware/acpi/platform_profile
balanced

I see no errors in dmesg

I remember being able to change it before (could hear fans spin up/down) so=
 I
rebuilt older versions of the module (on top of mainline) and these are my
findings:

From 4c51ba9af42dff0ef6a2ca3edcefa76f3466959e to
be9d73e64957bbd31ee9a0d11adc0f720974c558 can change power profiles with the
above command, but the value in /sys/firmware/acpi/platform_profile stays t=
he
same.

After 4b4967cbd2685f313411e6facf915fb2ae01d796
/sys/firmware/acpi/platform_profile_choices disappears, it comes back on
dc6a6ab58379f25bf991d8e4a13b001ed806e881 but I get the Operation not suppor=
ted
error, same until HEAD(ce95010ef62d4bf470928969bafc9070ae98cbb1).

Attached a ACPI dump in case that's useful.

I'm not a developer so that's all the information I can give at the moment,=
 but
I'm open to provide more information if needed, also testing patches to
debug/test this bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
