Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1B6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Sep 2022 11:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbiI3LCG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbiI3LBr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Sep 2022 07:01:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEB315C582
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 03:39:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E81ADB82698
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 10:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C46DC433C1
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664534310;
        bh=WsAabF7QFlHCKux432YA4IDoSJhl+YvQ3aFKXeIrRGY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Jyyk++mD66z3h9U87msqx/LQ3WvzDLtgfnlVBpkVSvGW8l924vdlNmsfrYW0gIwaa
         0bBzojxcutXW3l70XktHrKl8isSTlibdyQzMLwAVeW+4gNSebrfxELxOS/ROM4/Vm2
         8/TJcvndxh15BLYFCSk/6QP+jyz8BzZt4DjqlkNhPhQS/wQuqvK5KFyYfwbPU8B6RX
         ittIcT1oa8/QLt56MJH2edgTYVoZlivUsyZhh0DU5HJQxAXi2uo1YaYZhgpgwC4Mz9
         AmIp/r8uxU+OtCkW0nugflvifkkDH8P2SzzBcezsJKKhjZSbGGpLexkm+r5PBdh3HA
         J93Trw+xerT9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 81925C433E4; Fri, 30 Sep 2022 10:38:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Fri, 30 Sep 2022 10:38:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216516-215701-K2qtsnAolW@https.bugzilla.kernel.org/>
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

--- Comment #30 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 301904
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301904&action=3Dedit
kernel log for s2idle with ec_no_wakeup: v6.0-rc7 with bug 216516 comment #=
25
patches

@Mario
Thanks for answering all my questions!




Here's a new log. ec_no_wakeup=3DY and nearly 8 hours of s2idle.
That's 27663 seconds of which 27659 where in the deepest state.

Battery went from 96 % to 80 %. (battery limited to 80 % total power)
That's pretty good compared to without ec_no_wakeup, when the firmware bug
wakes the Linux Kernel. But it's still about 4 times worse than what S3
consumes.

I stumbled upon this commit for the "ThinkPad X1 Carbon 6th" notebook.
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D8195a655e5ce09550aff81b2573d9b015d520cb9
It's Intel based. But it seems to have a similar problem. So the commit add=
s a
quirk which sets ec_no_wakeup=3Dtrue on that notebook.
https://www.thinkwiki.org/wiki/Category:X1_Carbon_(6th_Gen)




(In reply to Mario Limonciello (AMD) from comment #27)
> [...]
> This is a laptop certified with Ubuntu (see
> https://ubuntu.com/certified/202206-30367).  You should contact HP support
> and ask them for a BIOS fix.

(In reply to Mario Limonciello (AMD) from comment #29)
> [...]
> >   SMU Firmware, version 64.61.0
>=20
> This is the BIOS component with the bug.  The fix is in 64.66.0.

I also called the HP business support. But they couldn't help me much. They
said "soon" there will be a new BIOS update. But they couldn't tell if it w=
ill
contain a new SMU Firmware version.

@Mario
QUESTION:
If there will be a new BIOS version. Should I immediately update? Or should=
 I
keep the current BIOS version for the moment, so we can run a few more test=
s?
(I'm not sure if a BIOS downgrade would be possible)




> [...]
> (In reply to kolAflash from comment #28)
> > A little more than 1 % of battery was consumed. And I'm wondering if th=
is
> > might contradicts your theory, about the EC trying to notify about a new
> > battery level.
>=20
> That amount of time in deep sleep matches how it should be behaving.  If
> that *wasn't* with acpi.ec_no_wakeup=3D1 then the usleep_range() change is
> helping and I should clean up and send a patch for it too.

ec_no_wakeup was not set when I ran that test. But I think I saw the system
staying in deep sleep before. Even for hours if I didn't opened/closed the =
lid,
(un)plugged the power, ...
I just feel very uncertain about when this EC GPE background event fires. So
let me run some further checks before committing that usleep_range() patch.




So I see mostly two things remaining now:

1.
Can the power consumption in s2idle be lowered further?
You (Mario) said "For most mobile designs the power consumption is better f=
or
s2idle than S3." So is there something the kernel can do do to bring the po=
wer
consumption further down?
S3 is at around 0,5 % battery per hour, because of which I initially tried =
to
use S3 instead of s2idle. And with ec_no_wakeup=3DY I'm getting between 2 %=
 and 3
% battery per hour in s2idle.
(without ec_no_wakeup=3DY it was > 10 % per hour if the system left the dee=
pest
state of sleep)

2.
What to do if there's no BIOS update containing the new SMU Firmware?
At least for other Linux users with the EliteBook 845 G8, who don't know
anything about this and don't update their BIOS.
(unfortunately the notebook doesn't support fwupd, so no automatic BIOS upd=
ates
when running Linux)
Is ec_no_wakeup=3DY the best solution? If yes, maybe add a quirk to the ker=
nel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
