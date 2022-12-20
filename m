Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6CAC4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Dec 2022 22:32:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234169AbiLTWcd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Dec 2022 17:32:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234140AbiLTWc3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Dec 2022 17:32:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7331DA4A
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 14:32:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 131ADB81A21
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 22:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C429AC433EF
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 22:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671575542;
        bh=/1ohOBsZ/IWBi6k3opmprdG93vUe1N8P2HFxO4nFcFs=;
        h=From:To:Subject:Date:From;
        b=laYjzvMKbE8E4zxcjS4Y8Ew/VicYpokxJAa+aZmfp+51DfxAU0VLnp/KMchqOcXgQ
         VsdCtRS8Rv59U3oKLpWuP0jguh7k4ftBChZlWm0WQ23Z00Mxrr9YkmKojXGoWZanWY
         IfYNEAfJGkjD9WqXfwQChBeybs3daanKAR062Qq0t5YhPUTvyu/FtsIgTPSKooel9Q
         cgXO9K/O6B30EmOsabSnzx/JtUHPPutKIWx6DGEqKVr7e4ofyFRftC0fJwNXTey31X
         f2p6kojHOJXom+6FvXGkKNsufhgaSlTW5mCW/8SRXf1FLwy2IUTEUDhKoT6/nGSswh
         q6fKvdM8ZV5kw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A7217C43142; Tue, 20 Dec 2022 22:32:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] New: Some laptop hotkeys don't work
Date:   Tue, 20 Dec 2022 22:32:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216824-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216824

            Bug ID: 216824
           Summary: Some laptop hotkeys don't work
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: andretiagob@protonmail.com
        Regression: No

Created attachment 303436
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303436&action=3Dedit
Laptop hotkeys

This bug was filed at the request of Hans de Goede, he as been super helpfu=
l:=20
https://gitlab.freedesktop.org/libinput/libinput/-/issues/822


I have a couple of hotkeys on my MSI Summit E16 Flip laptop that don't work=
. I
attached a picture with the keys in question.

Keys number in the picture:

1. This button doesn't work: mute/unmute the microfone;

2. This button works: enable/disable webcam. There's also a physical switch=
 on
the side of the laptop that enables/disables the webcam and it also works;

3. This button doesn't work: changes between power modes on Windows using t=
he
provided MSI app MSIControl Center Pro;

4. This button doesn't work: rotate the screen 45=C2=BA/90=C2=AA/180=C2=AA.



I also booted with wmi.debug_dump_wdg=3D1 and wmi.debug_event=3D1 on the ke=
rnel
commandline to check if there was any events.
I did the sudo evtest test and the hotkeys in question registered. I select=
ed
number 3 in the list (see evtest.txt).

These are the events of the hotkeys in question:

Hotkey number 1 Microphone:

Event: time 1671569327.276408, type 4 (EV_MSC), code 4 (MSC_SCAN), value f1
Event: time 1671569327.276408, -------------- SYN_REPORT ------------
Event: time 1671569327.349220, type 4 (EV_MSC), code 4 (MSC_SCAN), value f1

Hotkey number 2 Camera:

Event: time 1671569327.656812, type 4 (EV_MSC), code 4 (MSC_SCAN), value ee
Event: time 1671569327.656812, type 1 (EV_KEY), code 212 (KEY_CAMERA), valu=
e 1
Event: time 1671569327.656812, -------------- SYN_REPORT ------------
Event: time 1671569327.729626, type 4 (EV_MSC), code 4 (MSC_SCAN), value ee
Event: time 1671569327.729626, type 1 (EV_KEY), code 212 (KEY_CAMERA), valu=
e 0

(Note, ignore this one since the key actually works)

Hotkey number 3 Power Mode:

Event: time 1671569328.108543, type 4 (EV_MSC), code 4 (MSC_SCAN), value 91
Event: time 1671569328.108543, -------------- SYN_REPORT ------------
Event: time 1671569328.110873, type 4 (EV_MSC), code 4 (MSC_SCAN), value 91

Hotkey number 4 Screen Rotation:

Event: time 1671569329.374406, type 4 (EV_MSC), code 4 (MSC_SCAN), value f2
Event: time 1671569329.374406, -------------- SYN_REPORT ------------
Event: time 1671569329.446527, type 4 (EV_MSC), code 4 (MSC_SCAN), value f2=
=20



MSI Summit E16 Flip (A12UCT model) Alder Lake generation
OS Fedora 37
KDE Plasma Version: 5.26.4
KDE Frameworks Version: 5.101.0
Qt Version: 5.15.7
Kernel: 6.0.13
Wayland

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
