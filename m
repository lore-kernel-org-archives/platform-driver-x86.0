Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A890BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Jun 2022 23:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbiFSXh1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Jun 2022 19:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbiFSXh0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Jun 2022 19:37:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF09B1C3
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jun 2022 16:37:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B74C5B80BA9
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jun 2022 23:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61906C34114
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jun 2022 23:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655681842;
        bh=/nz94wF0suXXQC8wxAuHBxIfoA4dDNxBmB9lyyJPkoM=;
        h=From:To:Subject:Date:From;
        b=cTRpuejxfGMhG7bGWMCc/NhNQjYsKJf6zv4WMEFedRJ2fXtI6svRir1E/ldZtvLbE
         bllt3qQd+4/wkPVA81/TijkgjXCyBPYSB9BNDBLsvkIDe0oQN0wRSqynqukrQnQnM6
         8nEUg6TCbMRxRz8rIHAe/72Vt+VNkohudP9ePuWFSYlQ9iF4AnInL4AppTmoV7VvaF
         d8noxT+UbOUlKdVqXXWoCawLElqSs75NaJi2p5VI+IxXK7pTj+d1Q7Owln0SRdKgNK
         MLKHZK7gGcHDuEZ5Xm1aTdaRTFwOXRw1dx0WTnivHbOd2o14GoWnqPxBOEp9GYt7EK
         mZAPZ67D5HAZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 43386C05FD2; Sun, 19 Jun 2022 23:37:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216150] New: ideapad-laptop exposes only two keyboard backlight
 levels, instead of three
Date:   Sun, 19 Jun 2022 23:37:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tinozzo123@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216150-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216150

            Bug ID: 216150
           Summary: ideapad-laptop exposes only two keyboard backlight
                    levels, instead of three
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: tinozzo123@tutanota.com
        Regression: No

I own a Lenovo IdeaPad 5 14ARE05, which has three keyboard brightness level=
s:
off, low and high, which are cycled through with the Fn+space key combo.
However, ideapad-laptop.c sets max_brightness to 1, which means that the
brightness is either off (0) or on (1). This means that I'm unable to select
the high intensity brightness from ACPI like I could on a ThinkPad (I don't=
 own
one, but thinkpad_acpi.c sets max_brightness to 2, so I guess that it doesn=
't
have that problem).


Still, I don't know if this feature is present on all IdeaPad laptops. I
couldn't find any documentation on this (there is an article on Lenovo's
support, but it only refers to ThinkPads*). Even the user manual of my lapt=
op
doesn't mention this (it only says that it has keyboard backlight, not that=
 it
has three levels). Finally, I never tested Windows, so I don't know if Leno=
vo
Vantage provides any more settings.

Also, small note: right now, if the keyboard brightness is at high intensity
(with Fn+space, since there is no other way to do it), then is set to 0 usi=
ng
ACPI (and *not* with Fn+space), then set to 1 again with ACPI (still *not* =
with
Fn+space), the result is that the keyboard backlight will turn on with high
intensity (and the next Fn+space will turn it off) instead of low.

*https://support.lenovo.com/us/en/solutions/ht104451-how-to-turn-onoff-the-=
keyboard-light-backlit-on-your-laptop-thinkpad

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
