Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EA8C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 Oct 2022 01:14:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiJMBOd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Oct 2022 21:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbiJMBNO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2022 21:13:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A429CCAE7A
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 18:12:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 196D3B81B25
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 01:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CED24C433C1
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 01:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665623510;
        bh=geYCcoYDlAve/QhOKbfo+6aoXY2smJ10pf2EzTq8qDY=;
        h=From:To:Subject:Date:From;
        b=aJC0aI1O1E4vNdqg9MRpIUumuXGqU9EjXrVptfSPYIQaVt51wif/QFBEvm4Zvpu8y
         k9ZB5RrvKBsR15/ri9bMW5wSRoUv+n6pAT+ce9n0fgGfLIV0FLEpko9C8Cb7qw8m2D
         LSjGdC4gc093BCH4ojAHYNqXx3TSYRyh4rgqdzmtBP2TcikCEpRKazvbrKWoMFjYeZ
         84kWcZ6n6kZV1TljBxv4vvx6gjFj95r54t1EJxIGqpTB2Xz9ew0e7N8ZFTRKsIVs6x
         FSp/xZ6nwC0v9PBk1Hbl/TjGmgwVBU3+Ke9i4xCnr+YCKBcXTCTTsPUWghrYm7S+rK
         tc1UzvwK72F8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B58DAC433E6; Thu, 13 Oct 2022 01:11:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216574] New: Hybrid System Suspend broken HP EliteBook 845 G8
 (a.k.a. Hybrid Sleep / s2both) (s2idle Notebook)
Date:   Thu, 13 Oct 2022 01:11:50 +0000
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
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216574-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216574

            Bug ID: 216574
           Summary: Hybrid System Suspend broken HP EliteBook 845 G8
                    (a.k.a. Hybrid Sleep / s2both) (s2idle Notebook)
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0
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

Created attachment 302984
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D302984&action=3Dedit
kernel log for hybrid sleep with s2idle: v6.0

Hybrid Sleep isn't working on the HP EliteBook 845 G8 Notebook.
Hybrid Sleep is documented here as "Hybrid System Suspend":
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Docum=
entation/admin-guide/pm/sleep-states.rst?h=3Dv6.0.1#n220

uswsusp called this s2both.
(uswsusp is deprecated, but "Hybrid System Suspend" is currently supported =
by
the kernel if I don't get the documentation wrong)

This bug is forked off from:
https://bugzilla.kernel.org/show_bug.cgi?id=3D216516#c34



I initiate Hybrid Sleep this way:
echo suspend > /sys/power/disk
echo disk > /sys/power/state

But the system doesn't correctly enter Hybrid Sleep by activating s2idle.
Instead the system seems to do just a hibernation to disk.
So the system simply shuts down completely. At power on it resumes from
swapfile.

Correct behaviour would be to write the memory to swapfile (like hibernatio=
n to
disk), but then enter s2idle.
(the idea behind hybrid sleep is to prevent data loss if the battery is get=
ting
drained while being in some suspend to memory)



The EliteBook 845 G8 (usually) only supports "s2idle" and no "deep" S3
mem_sleep mode.
See: https://bugzilla.kernel.org/show_bug.cgi?id=3D216516#c5

Using "systemctl start hybrid-sleep.target" yields the same result.
Please see attached dmesg output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
