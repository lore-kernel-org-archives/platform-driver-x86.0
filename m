Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24ABC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 21:22:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C586061053
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 21:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbhKAVZb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Nov 2021 17:25:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:50546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232077AbhKAVZb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Nov 2021 17:25:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A29B60ED3
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Nov 2021 21:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635801777;
        bh=9cE69KTyYX1olANRgUKDB5nykaW8Ijoly5SO4lzOFJg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=c0SkEST0EF6/5naLTzoUI6t1HnMTRa54SHywqGpXM4eu4gd/C1iStSNFP4dpcjCW6
         rv+7RNmDqr8sG+h9X7W8ww/sdcg0NUq4Y3gjBLp85Asl1ACC+ab98BrqXMXa8RCg8r
         ZXPA95vtX8LF014PclTty5T5O18UdOCGlVtYtVuBV9FPJmRvUPL8N2ptsHwRULL29N
         HzYbLIZePnd3KctBaUM4VjATGaHS/d4JJG2fDubG+0gcPYv9X39ONTqCtl66LN+gQI
         cyWLxFwLszYZYFuCt7o74OMgl2cmaCbHTvQrjV4otMvWvpwCRyB7cjcTREOKiYht3A
         mU8dYQ5Hzv71A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Mon, 01 Nov 2021 21:22:57 +0000
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
Message-ID: <bug-214899-215701-ROz5whFquB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #5 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Ah, ok so you indeed have "acpi_backlight=3Dvendor" on the kernel commandli=
ne,
please don't do that, the old Ideapad specific backlight interface enabled =
by
that is only for very old laptop models.

Where as your laptop is very new! If you omit this, then you should only ha=
ve
the intel_backlight under /sys/class/backlight and brightness control to e.=
g.
the slider in the GNOME system (top right) menu should work.

The brightness-keys directly changing the brightness is something from the =
same
era as the Ideapad specific backlight interface. Now a days almost without
exception the brightness keys will simply generate key-press events which a=
re
processed by userspace to actually change the brightness. This allows users=
pace
to apply various policies to the brightness setting, for e.g. interaction w=
ith
auto-brightness control on devices with an ambient-light-sensor (ALS).

Almost all "integrated" desktop environments like GNOME, KDE, XFCE, MATE, e=
tc.
will automatically do the right thing with the brightness-key events. If you
are however using e.g. i3 as window-manager then you will need to script th=
is
yourself, there are plenty of examples how to do this.

###

So as said if you omit "acpi_backlight=3Dvendor" on the kernel commandline,=
 you
should only get the intel_backlight in /sys/class/backlight, which you have
already indicated works as it should.

All that remains then is to check that key-press events are properly genera=
ted
and if they are then this is "not a kernel bug". Please install evemu or ev=
test
and then run (as root) evemu-record or evtest and test for each input-devic=
e if
it perhaps sends brightness key-press events when pressing the brightness
hotkeys.

The following devices are a good starting point to test:
"AT Translated Set 2 keyboard"
"Video Bus"

But if neither of those works then please test them all 1 by 1. Note it is
possible that the "AT Translated Set 2 keyboard" generates only EV_MSC even=
ts
or the wrong EV_KEY codes for the brightness keys (so not
KEY_BRIGHTNESS[DOWN|UP]). In this case we need to add a mapping for your la=
ptop
to fix this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
