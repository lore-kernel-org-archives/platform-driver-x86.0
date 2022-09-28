Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF380C04A95
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Sep 2022 15:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234341AbiI1P5A (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234473AbiI1P4K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2022 11:56:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8336DF05E
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 08:56:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6C903B82107
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 15:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3984DC433D7
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664380559;
        bh=uHUAFQEP0+fxcIahotq2YA1YMbjUsJ2rJ5cFx61ayUA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RBGflblBEOoBLN8HeAlib4KTuc2EubqhDQ2Jh2DSjJk2WkNEuP+cGPQuE9ixwZnur
         oKw1UDX8aN/nXqLx4CO0Iqi1Ql75cZ02DdsHIVW2J6WpcaxpIVZUmdqjkYdyy81a6L
         4iTVYapr5/mxnZiJwU3H1MEDx8pbSnjygNx5rCT+xnqyzni3CmFzPV5ps0V/cr/65t
         pyvXREDfpcN1BiNMznYA77Z0o0KROChH9S3gU8pumnKiZkansk4UbZbMafH/jTeIEx
         MLb5vXqmLhh3B/TvqSTOu0uqRpWh5arYPkx+kTnUKabEYn4L3eO4sFAHPQ2rc5+AeN
         5vra7V6JBuH8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 20CE1C433E6; Wed, 28 Sep 2022 15:55:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Wed, 28 Sep 2022 15:55:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216516-215701-KvACYtJzYa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #19 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 301886
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301886&action=3Dedit
kernel log for s2idle: v6.0-rc7 with bug 216516 comment #14 patches

Mystery solved:
Guess what I'm always doing after running "systemctl start suspend.target".
Yes, I'm closing the notebook lid.

--> And closing the notebook lid is what's waking the CPU!

I did a few tests, closing the lid after random times. And "deepest state f=
or"
always matched that time.




If I don't close the lid, I also get 2 % battery usage per hour with
openSUSE-15.4 and v6.0-rc7.

I have to do at least
  echo disabled > /sys/devices/platform/i8042/serio0/power/wakeup
Else the notebook completely wakes after a random time. (e.g. 20 minutes)
I guess something like a slight mouse movement then wakes it.

With i8042 wakeup disabled I can close the lid without the notebook waking =
up
completely. I can see this, because the keyboard backlight stays dark when I
slightly look below the lid. And also programs don't start running again and
dmesg also agrees.
But it looks like nevertheless the CPU is waking from the "deepest state".




About my usage behavior:
I don't like my notebook to suspend automatically when closing the lid. So I
always disable the lid close action in my desktop environment.
As a result, I always trigger s2ram manually and close the lid afterwards.




About the Ubuntu-22.10 beta and the "echo disabled" wakeup tests:
--> Forget about these!
I didn't closed the lid when testing Ubuntu-22.10 beta. And I just checked,
that Ubuntu-22.10 beta also completely wakes when closing the lid, unless i=
8042
wakeup is disabled.
And I couldn't reproduce the good consumption values after running
  find /sys/devices/ -type f -name wakeup -exec bash -c 'echo disabled > "{=
}"'
\;
when closing the lid. (see comment 15)
I probably just didn't closed the lid when doing that test for comment 15.




(In reply to Mario Limonciello (AMD) from comment #14)
> [...]
> 1) Collect the output of=20
> # grep -v foo /sys/firmware/acpi/interrupts/*
> 2) Run your suspend
> 3) Capture again the output of=20
> # grep -v foo /sys/firmware/acpi/interrupts/*
> 4) Compare the two to see which incremented
> [...]
> The next debugging step will be applying the following patches to 6.0-rc:
> [...]

I did this and applied the mentioned patches. (4 commits + usleep_range pat=
ch)
Find the result in the attached log.
I closed the lod 22 seconds after s2idle started. Which matches exactly the
dmesg output:

  Last suspend in deepest state for 22133270us




OBJECTIVES:

1. Stay in deepest sleep state when closing the lid. (or immediately return=
 to
deepest sleep)

2. Identify when else the system might unintentionally leaves the deepest s=
leep
state while the screen stays off.
E.g. certain buttons, plug in/out events (USB devices, USB-C docking statio=
n,
AC power, HDMI, ...)
I'll try to think of some tests I can run for this.
You'll find the output of
  find /sys/devices/ -name wakeup -type f -print -exec cat '{}' \;
in the attachment.

3. Bring the s2idle power consumption further down below 2 % per hour.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
