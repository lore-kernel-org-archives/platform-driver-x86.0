Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73324C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 31 Oct 2021 19:28:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 589C461051
	for <platform-driver-x86@archiver.kernel.org>; Sun, 31 Oct 2021 19:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhJaTah (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 31 Oct 2021 15:30:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:39664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230010AbhJaTah (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 31 Oct 2021 15:30:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 32D0260F0F
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 Oct 2021 19:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635708485;
        bh=HW/imU8UWINDwaGunEkixoImSd5npinle7R4V1Ri1qI=;
        h=From:To:Subject:Date:From;
        b=g1zq5cDjOzg7MDAnM5g6srRMM+NeZCt0k8WhE9NgtRcxmhTd+R/ZPpqVSn7yewXjF
         X8qIJIpAwoyOR1scbdv6Z/inp1dH+Qyodiq9exDUavfWETBAO8VxuI3w7CmgeP9XYx
         1ZbMQ6YP4sYCQz25dpPG8uGS67DpggGvHfCaeWEMXI5aQzp9U2AlYcbZdqpurEbmi7
         /6VNJZn7RxqFb3BRB0n6UAIPzxA2KAvH2c8AJP6CaMZXmofh0tcyh7zDWTE+H+ZinW
         7RdtPeCQiqVYREmqFLG+H7nvfR5fj/ZBYIk84nPf91wmXBatt9a138SFZa1JK7IaLK
         j4+iV8sXW5UeA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] New: ideapad-laptop: platform backlight device not
 working
Date:   Sun, 31 Oct 2021 19:28:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

            Bug ID: 214899
           Summary: ideapad-laptop: platform backlight device not working
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.27-5.14.15
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: johannes.penssel@gmail.com
        Regression: No

Created attachment 299379
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299379&action=3Dedit
DSDT.dsl

Hardware: Lenovo IdeaPad 5 15ITL05, latest BIOS version
Issue: Platform backlight device provided by ideapad-laptop has no effect on
actual brightness.
Pressing brightness keys on my keyboard causes changes in
/sys/class/backlight/ideapad/actual_brightness, but no uevent is generated =
(as
outlined in drivers/video/backlight.c source code comments), and
/sys/class/backlight/ideapad/brightness is unaffected.=20
When manipulating /sys/class/backlight/ideapad/brightness directly, uevents=
 are
being generated, but no change in real screen brightness occurs.=20
The only way that screen brightness can actually be changed is by using i91=
5's
intel_backlight sysfs interface, which does not respond to brightness keybo=
ard
keys.

attached is my decompiled DSDT and dmesg.

ls -la /sys/class/backlight/ideapad/
total 0
drwxr-xr-x 3 root root     0 Oct 31 19:40 .
drwxr-xr-x 3 root root     0 Oct 31 19:40 ..
-r--r--r-- 1 root root  4096 Oct 31 19:40 actual_brightness
-rw-r--r-- 1 root root  4096 Oct 31 19:40 bl_power
-rw-rw-r-- 1 root video 4096 Oct 31 19:43 brightness
lrwxrwxrwx 1 root root     0 Oct 31 19:40 device -> ../../../VPC2004:00
-r--r--r-- 1 root root  4096 Oct 31 19:40 max_brightness
drwxr-xr-x 2 root root     0 Oct 31 19:40 power
-r--r--r-- 1 root root  4096 Oct 31 19:40 scale
lrwxrwxrwx 1 root root     0 Oct 31 19:40 subsystem ->
../../../../../../../class/backlight
-r--r--r-- 1 root root  4096 Oct 31 19:40 type
-rw-r--r-- 1 root root  4096 Oct 31 19:40 uevent

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
