Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553C2C46467
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Jan 2023 18:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbjAKSEy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Jan 2023 13:04:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjAKSEx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2023 13:04:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6111056E
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 10:04:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3FA12B81BB5
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 18:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F267FC433EF
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673460290;
        bh=e3YU0oRYM0ehqUH+jriwNv4wCjsJgKlhNwK0W9pUbsw=;
        h=From:To:Subject:Date:From;
        b=Wps+p4bmy8anWjvdE0zaL5YQx93ja36GBO/8sgdVot7piyRofgCf062yOb7Zwq9gk
         1EAbQVKWFEnGCZgdiX2o6+tjPlSGrPTOaw46U4hk8GbvAoyrlmFF3BVFSzea2m2Dai
         sOq7QwZQMhU0UNBKdbOOpCetQKmhG+4w610eafChZPDTlm23RCnuG+zcun3b574NuF
         dfhPNQbpFwFxeadVcPdB5CAlVM+bbbvMqvJN84u5leElhCLAzo++arU1wNMB40x/3j
         JiPdDu+23FXFCTpWjGhmDU4op7c7w/7oDbQo/NgPz+O1derctuLxr35KUZfX/0B5De
         h0VbVPA/1byQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E0640C43141; Wed, 11 Jan 2023 18:04:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216917] New: hibernation regression since 6.0.18 (Ryzen-5650U
 incl. Radeon GPU)
Date:   Wed, 11 Jan 2023 18:04:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216917-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

            Bug ID: 216917
           Summary: hibernation regression since 6.0.18 (Ryzen-5650U incl.
                    Radeon GPU)
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.18
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: kolAflash@kolahilft.de
        Regression: No

Since Linux-6.0.18 hibernation isn't working anymore. 6.0.17 was working fi=
ne.

When doing
  systemctl start hibernate.target
the screen turns black, but the system doesn't power down.
Same problem for "platform" and "shutdown" in /etc/systemd/sleep.conf =3D>
HibernateMode.

Force rebooting the system makes GRUB skip the boot menu (like normal when
waking from hibernation), but the system just boots up freshly, not restori=
ng
the old state.


=3D System =3D
Model: HP EliteBook 845 G8 (notebook)
CPU+GPU: Ryzen 5650U incl. Radeon GPU
OS: openSUSE-15.4
Kernel: compiled from kernel.org
The HP EliteBook 845 G8 uses s0ix/s2idle.


Sadly I don't know how to provide helpful logs. After reboot there's nothing
helpful in /var/log/messages
Just this:
2023-01-11T18:45:51.208584+01:00 myhost systemd[1]: Reached target Sleep.
2023-01-11T18:45:51.224615+01:00 myhost systemd[1]: Starting Hibernate...
2023-01-11T18:45:51.253804+01:00 myhost systemd-sleep[1998]: INFO: running
/usr/lib/systemd/system-sleep/grub2.sleep for hibernate
2023-01-11T18:45:51.253875+01:00 myhost systemd-sleep[1998]: INFO: Running
prepare-grub ..
2023-01-11T18:45:51.322933+01:00 myhost systemd-sleep[1998]:   running kern=
el
is grub menu entry openSUSE Leap 15.4 (vmlinuz-6.0.18-v6.0.18-myhost)
2023-01-11T18:45:51.323010+01:00 myhost systemd-sleep[1998]:   preparing
boot-loader: selecting entry openSUSE Leap 15.4, kernel
/boot/6.0.18-v6.0.18-myhost
2023-01-11T18:45:51.331546+01:00 myhost systemd-sleep[1998]:   running
/usr/sbin/grub2-once "openSUSE Leap 15.4"
2023-01-11T18:45:51.585503+01:00 myhost systemd-sleep[1998]:     time needed
for sync: 0.0 seconds, time needed for grub: 0.2 seconds.
2023-01-11T18:45:51.585585+01:00 myhost systemd-sleep[1998]: INFO: Done.
2023-01-11T18:45:51.586273+01:00 myhost systemd-sleep[1996]: Entering sleep
state 'hibernate'...
2023-01-11T18:45:51.588025+01:00 myhost kernel: [   39.640758][ T1996] PM:
hibernation: hibernation entry

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
