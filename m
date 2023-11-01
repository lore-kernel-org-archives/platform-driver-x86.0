Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F7DC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Nov 2023 17:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344556AbjKARI3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Nov 2023 13:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344616AbjKARI1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Nov 2023 13:08:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5EEA6
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Nov 2023 10:08:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 565B0C433CA
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Nov 2023 17:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698858505;
        bh=wfY8vmdkcZ7qm4dR00MHHv/AZ5ijmhsmGpsFrW3XtyI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hSsQUkp1hJYog6S87jED7HEJWYM+Le1UvgQbTucxzr09VA3YE2Nm3i57D/MKUmVFw
         9fIGwocaXs8M3uyNFjtf7tdZX3rSvHa3lew7O+UE7U1NBMLiAExVYqmZuaDRAQYFoi
         TSAsC9WIR1KUW29u/0n4w9hTZmV/CONZnxieTSHr6SMgvsYPNx/bTWdGgCbVjo2iaH
         A9cT9noX8iiLnH6C12jPhnRniKAOMGrujHgklM2lgmitJkFUfjG+YEFEHu/JamQsIt
         CQFbE4ldOn1o0SqvmM7RgCq3etaAs68UNABW+1P/uvPwTxYTQUNZI/1p3viVpfIvjZ
         ndZ3wR/jFLcwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3E9B6C53BCD; Wed,  1 Nov 2023 17:08:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Wed, 01 Nov 2023 17:08:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-6jom4Twz8L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #16 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I'm not personally familiar with Tuxedo OS.  I can point you at generic ker=
nel
build instructions.  It seems to be built from an Ubuntu base so I think
generic debian kernels should work.=20=20

Here's some generic instructions off the top of my head.  Apologies if I ma=
de
any mistakes.

1) Modify /etc/default/grub to change the grub policy from "hidden" to "men=
u"
2) Modify /etc/default/grub to change the grub timeout from 0 to 5
3) run 'sudo update-grub'
4) Reboot machine
5) Make sure that you see a GRUB menu.

6) Download kernel 6.6 (tarball or git) from https://www.kernel.org/
7) Apply the patch from this bug.
8) Copy your existing kernel config from /boot to the file .config in the
kernel directory.
9) Install build dependencies for building the kernel ("apt build-dep
linux-image" should hopefully help here)
10) Build the kernel using "make -j$(nproc) bindeb-pkg"

If that works you'll get a .deb package at the end that you can install and
pick from the grub menu on the next boot.  See if this package works for the
issue at hand.  If it does we'll carry forward with submitting this patch. =
 If
it doesn't then we have a different issue than we've seen in the past.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
