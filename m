Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE21BC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 11:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B308A60FDA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 11:39:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbhG1Lju (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 07:39:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:39362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231631AbhG1Ljt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 07:39:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8ED8F60FC2
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627472388;
        bh=Z+AWQswYYZZs5QvNTXrAatimCm7WRrhON0QEL92qtcw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IlHXI5SL0bZq0GSZJQBhtpcjmq4Xki5WBritGIc1ZltIOzP7lV0Ljo8YntS0xyR/q
         d5Dm8LSkncZ2rBo3HLI3MNuLJdp9G2MSND83BiyTtgjZILYSico1Vdb8F5l6Wc/2Be
         tP7eiBvBmXrgCZcDhGGqNLDoL5yLVayRI7m3DVfKHQzt6YWKpieH6wOsIjr5zuB0ru
         jMJoWXP5MyIb7JH92n/l7EKyB/SCuVc1LQhQSTyvsT71vfTf+TcVT9z7fhF1yacBom
         jkpk6VK9siE3jwID8ibkAXempWNODC123SlPHegMGoM3nuG0D5LLfLKek0c55bBiVU
         P0GFxIEvYNktA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 209011] asus-wmi always reports tablet mode on a ZenBook
 UX390UAK
Date:   Wed, 28 Jul 2021 11:39:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209011-215701-AfpBpBNnIk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209011-215701@https.bugzilla.kernel.org/>
References: <bug-209011-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209011

--- Comment #7 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Julius, thank you for your bug report.

5.13.5 does contain the fix for the origin bug reported here. For a while n=
ow
the kernel's asus-wmi code will only report SW_TABLET_MODE on devices on wh=
ich
it is explicitly enabled by a DMI match, on all other models the asus-wmi c=
ode
will not report SW_TABLET_MODE at all.

So I wonder if the SW_TABLET_MODE is perhaps being reported by another driv=
er
such as the intel-hid or intel-vbtn code.

If you look at the libinput output in comment 0:

-event7   DEVICE_ADDED     Asus WMI hotkeys                  seat0 default
group9  cap:kS
 event7   SWITCH_TOGGLE    +0.000s      switch tablet-mode state 1

Then the "event7" on the beginning of the line is the same for both devices=
. I
suspect that if you look-up the DEVICE_ADDED line for the "event#" with whi=
ch
the SWITCH_TOGGLE which you are seeing is prefixed, then it will be another
device then the "Asus WMI hotkeys" device.

If the DEVICE_ADDED with the matching "event#" is the "Asus WMI hotkeys"
device, then something weird is going on with the DMI matching, in that case
please provide the output of: "cat /sys/class/dmi/id/sys_vendor
/sys/class/dmi/id/product_name"

If the DEVICE_ADDED with the matching "event#" is for another device, which=
 I
expect, please provide the following info:

1. Can you please add "wmi.debug_event=3D1 wmi.debug_dump_wdg=3D1" to your =
kernel
commandline (see your distro's documentation) and then reboot and fold the
device into tablet-mode and back to laptop-mode once. After this run "dmesg=
 >
dmesg.txt" and attach the generated dmesg.txt file here.

2. Run "sudo acpidump -o acpidump.txt" and attach the generated acpidump.txt
file here.

3. Run "ls -l /sys/bus/iio/devices > ls-bus-iio.txt" and attach the generat=
ed
ls-bus-iio.txt file here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
