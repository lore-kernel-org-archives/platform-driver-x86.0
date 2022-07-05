Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8F8C43334
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Jul 2022 03:01:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbiGEDBH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jul 2022 23:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbiGEDBG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jul 2022 23:01:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1346AB08
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 20:01:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B4926B80EF7
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 03:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C6EAC3411E
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 03:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656990063;
        bh=kjzuP7/7FaQjAfMMRL2wG3eG5cIxYcZ/UdS97WJ6QIU=;
        h=From:To:Subject:Date:From;
        b=sohawdEZ18oFockrPXaOVu/Dmv1FRXjKX5XOUQCWTnHzItz4QSpgdBRVQouA7MKl6
         QYbqqf0ahXUPHMwo0JE9MrZ1QVg9Qjruu+RcuJw5+xjUx0RiauPW3/v5mR5SN79LOU
         LRgTMWvCk6TtetalREYsKp1SGbC5H8t2mmiA5LCykwuqFQb5QYvGlVqCnqAJo20wOI
         WVpVTIQxOBCT7i021ofSQKo6bOupInDo5TB2g7fmHHnQj03Dz0lAf3VOLwt4vcD78e
         HH0D5G9xVaTCHrOFwMupbc0P/v2tmU3gfuFky82ixEDltHzF8fsRx6j5XJQbrUE2cN
         /46I0EhcLTs1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3B453C05FD2; Tue,  5 Jul 2022 03:01:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216204] New: ideapad-laptop: Testing for DYTC platform-profile
 support
Date:   Tue, 05 Jul 2022 03:01:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: git@tenseventyseven.cf
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216204-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216204

            Bug ID: 216204
           Summary: ideapad-laptop: Testing for DYTC platform-profile
                    support
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.9
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: git@tenseventyseven.cf
        Regression: No

Created attachment 301332
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301332&action=3Dedit
Decompiled DSDT of Lenovo IdeaPad 3 (14ITL05) - BIOS ver GCCN26WW

Hello! I'm just curious on how do I test DYTC platform profiles compatibili=
ty
with ideapad-laptop and my Lenovo laptop? I've merged the newest changes to=
 the
driver that adds (experimental) support to DYTC v4, but I couldn't find any
concrete way to test it.

Even without the change applied (and boot option enabled),
power-profiles-daemon is still present on GNOME and throttles the CPU speed=
. Is
there any other way I can test for it? I currently am running the kernel on
Fedora 36, if it helps.

I've attached the decompiled DSDT, and it seems to be very similar to
https://bugzilla.kernel.org/show_bug.cgi?id=3D213297.

Hoping for your reply.
Thank you very much!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
