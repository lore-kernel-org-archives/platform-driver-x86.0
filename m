Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FAAC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 06:53:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjKBGxY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 02:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjKBGxX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 02:53:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67214123
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Nov 2023 23:53:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CEFAC433C7
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 06:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698908001;
        bh=Qfy6mw7UcOZKVhe5WIko8F45Dn7cl4S41h0YRUXm7e8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R/s9+h9TGrwh3vcSb/WEebCpjD88i1hN0fR2/y0cu+AHXGPNEA4Q/ONYICEE39z/F
         2AnL74m8T2ivTY8bJCE+BFb8ih+NIqjB1Mw0yjVzIp2Nut8SbMqIQIaVMxDctisRbI
         JEmAkmtr+YqM4u7z4wENI9l7iG1u6I45RLhZtaOwhCYa3c5Z0UWV6+qrxvrjxyG1pF
         CMAanhlx2b905G1oHBYD6N+AMaRC8J4fjE86boiX7NM99aj03DeSgvkiMjFO+X8KmG
         nrndfXUIRmu4updafr+tzXmhBVAyTXpqa9LgLx0PofMDdMxy3hnVEAuQPZp/uEQ6gO
         QuS2/RMpbefgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EFB51C4332E; Thu,  2 Nov 2023 06:53:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 06:53:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-X5ayN20Swv@https.bugzilla.kernel.org/>
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

--- Comment #21 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Ertugrul Uyar from comment #20)
> (In reply to Mario Limonciello (AMD) from comment #16)
> > I'm not personally familiar with Tuxedo OS.  I can point you at generic
> > kernel build instructions.  It seems to be built from an Ubuntu base so=
 I
> > think generic debian kernels should work.=20=20
> >=20
> > Here's some generic instructions off the top of my head.  Apologies if I
> > made any mistakes.
> >=20
> > 1) Modify /etc/default/grub to change the grub policy from "hidden" to
> "menu"
> > 2) Modify /etc/default/grub to change the grub timeout from 0 to 5
> > 3) run 'sudo update-grub'
> > 4) Reboot machine
> > 5) Make sure that you see a GRUB menu.
> >=20
> > 6) Download kernel 6.6 (tarball or git) from https://www.kernel.org/
> > 7) Apply the patch from this bug.
> > 8) Copy your existing kernel config from /boot to the file .config in t=
he
> > kernel directory.
> > 9) Install build dependencies for building the kernel ("apt build-dep
> > linux-image" should hopefully help here)
> > 10) Build the kernel using "make -j$(nproc) bindeb-pkg"
> >=20
> > If that works you'll get a .deb package at the end that you can install=
 and
> > pick from the grub menu on the next boot.  See if this package works for
> the
> > issue at hand.  If it does we'll carry forward with submitting this pat=
ch.=20
> > If it doesn't then we have a different issue than we've seen in the pas=
t.
>=20
> I am gonna also remove amd_iommu=3Doff from grub conf.=20
> GRUB_CMDLINE_LINUX_DEFAULT=3D"quiet splash amd_iommu=3Doff" -->
> GRUB_CMDLINE_LINUX_DEFAULT=3D"quiet splash"

Also, I did this:
GRUB_TIMEOUT_STYLE=3Dmenu
GRUB_TIMEOUT=3D5

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
