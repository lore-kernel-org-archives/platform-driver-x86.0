Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2051C32771
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Sep 2022 23:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbiI1XqD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Sep 2022 19:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233785AbiI1XqC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2022 19:46:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D331C100A92
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 16:46:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 958BEB82236
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 23:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59F82C433D7
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 23:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664408758;
        bh=N4KHs80/mGPHCpM0A1B9YU1KFKMmvx7LwYq+1+6m4eA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oKkFgfQHzbBE8waR6jgL/pvJBmYOqhQaC6w/JFyMYJqB7/mYtual19GRjC4V+01F/
         LXDRseHPeysukqJrt4PpAZQC3TbqZFk1jgczWAkpulKMmDcx9YKb/lZhhZ1vv02xJc
         uOrUtaHPg6kDan0zeCMr5u3z5wG9bQvR9EZT6l9kQ5uC1YumNwwWvTSlPAfThAc/rX
         VYrQfz8+4oUixvOqqfO4tgZmSVJG/tkxE9dQsVM3rGb4p0KlmGn9Dsx4XeGrazFQgB
         ZGTE9EczAIHSKXH9y82GwXdI5i1xlboos96mgLKi07xLtjfqGH00l50sSG6UojdreB
         NQe5MmdG1ymXA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 37A88C433E4; Wed, 28 Sep 2022 23:45:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Wed, 28 Sep 2022 23:45:57 +0000
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
Message-ID: <bug-216516-215701-e1JEBVuhaq@https.bugzilla.kernel.org/>
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

--- Comment #24 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 301894
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301894&action=3Dedit
kernel log for s2idle: v6.0-rc7 with bug 216516 comment #14 patches - 23
minutes of s2idle

@Mario
Yes, it's definitely an intermingled mess...
If you have an idea how I can help to untangle this, please give me detailed
instructions which tests I should run.

If you think this will help, we can have a (video) call about this. Just se=
nd
me an email with date + time. (I live in UTC+2)
Just tell me which (video) call tool you like to use. I'm open for pretty m=
uch
everything (Jitsi-Meet, Skype, Mumble, XMPP, Matrix, ...)


Something about the sysfs and procfs settings I'm doing:

This is needed to disable wakeup from USB events in S3 suspend.
  echo XHC1 > /proc/acpi/wakeup
Actually I wouldn't need to set this for s2idle.
In future I'll leave this out for s2idle tests.

This is needed to prevent the system from waking on keyboard events and on
closing the lid.
  echo disabled > /sys/devices/platform/i8042/serio0/power/wakeup
And additionally this is needed to prevent the system from waking on opening
the lid.
  echo disabled > /sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/power/wak=
eup
(both, i8042 and LNXSYBUS:00/PNP0C0D:00, must be disabled to prevent wake on
opening the lid)

Additionally, if i8042 and LNXSYBUS:00/PNP0C0D:00 are not disabled, the sys=
tem
tends to wake after some minutes from s2idle. Maybe something between 10 or=
 60
minutes.
I haven't figured out yet if this is related to just one or both settings.
So beside the lid open/close, keyboard and AC power events, there must be
something else interrupting the suspend. Something which is totally without
user interaction, because these wakes also appear if I leave the lid open a=
nd
don't touch the notebook at all.






I rebooted the system and then put it into s2idle for a little more than 23
minutes (1400 seconds).
See these lines:
  Thu Sep 29 00:09:19 CEST 2022
  Thu Sep 29 00:33:12 CEST 2022

Everything, including all sysfs setting I made, is documented in the log.
And I didn't closed the lid this time. I didn't even touched the notebook
during that 23 minutes.



These lines suggest, that the system didn't stay in "deepest state" of sleep
the whole time.

[   92.340524] PM: suspend-to-idle
[   92.340549] ACPI: EC: ACPI EC GPE status set
[   92.340562] ACPI: PM: Rearming ACPI SCI for wakeup
[   92.364660] Timekeeping suspended for 759.694 seconds
[   92.364660] ACPI: EC: ACPI EC GPE status set
[   92.364680] ACPI: EC: ACPI EC GPE dispatched
[   92.364987] ACPI: EC: ACPI EC work flushed
[   92.364987] ACPI: PM: Rearming ACPI SCI for wakeup
[   92.383963] ACPI: EC: ACPI EC GPE status set
[   92.383981] ACPI: PM: Rearming ACPI SCI for wakeup
[   92.408334] Timekeeping suspended for 331.956 seconds
[   92.408334] ACPI: EC: ACPI EC GPE status set
[   92.408334] ACPI: EC: ACPI EC GPE dispatched
[   92.408340] ACPI: EC: ACPI EC work flushed
[   92.408340] ACPI: PM: Rearming ACPI SCI for wakeup
[   92.429810] Timekeeping suspended for 328.978 seconds
[   92.429810] ACPI: EC: ACPI EC GPE status set
[   92.429810] ACPI: EC: ACPI EC GPE dispatched
[   92.429815] ACPI: EC: ACPI EC work flushed
[   92.429815] ACPI: PM: Rearming ACPI SCI for wakeup
[   92.451340] Timekeeping suspended for 8.978 seconds
[...]
[   92.451340] amd_pmc AMDI0005:00: Last suspend in deepest state for
758373565us

To it looks pretty much like the deepest sleep was only for the first 758
seconds.
The remaining time of the altogether ~ 1400 seconds the system wasn't in the
deepest state.

I guess that the deepest state has been interrupted by the remnant of what
completely wakes the system if i8042 and LNXSYBUS:00/PNP0C0D:00 are not
disabled (see above).



I set the BIOS to limit the battery to max. 80 %. This usually drastically
increases the overall lifetime of lithium-ion batteries. That's what makes =
the
difference between energy-full and energy-full-design in the log.=20

These are the power consumption values:
  energy-full-design:  53.0145 Wh
  22.2222/(53.0145/100) =3D 41.9 %
  20.8824/(53.0145/100) =3D 39.4 %
So about 2.5 % of power (1.3398 Wh) was consumed.
If the system was in perfect s2idle, this should have been less than 1% for=
 23
minutes.
Bug 2.5 % pretty much matches about 700 seconds of "bad" s2idle after the
initial 700 "good" s2idle seconds in deepest state.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
