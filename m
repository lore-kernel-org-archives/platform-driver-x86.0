Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E795C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Nov 2023 12:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346265AbjKCMBr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Nov 2023 08:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346272AbjKCMBp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 08:01:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61C1D43
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 05:01:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40991C433B8
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 12:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699012903;
        bh=PQo7F5OMsnymG9BC/7shiVOsYgCQt/qUQXCq4y35d4M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=vMy8q9kgje/IJILA+kHNk/MxR4Zzv8RCvuZAbRmzqhvmTZkjfC6tmCW7kMH/0ItIJ
         LF0iH0wrAlh5dvrHKWD5c/RUl7Otp5BDqrht2+m/YA+QLxbNpwSRIHEndcwW84Bk9u
         4FIuB1S6Mn9+38suwJPl05kvDm6Dp3WsF5GMGeBBGdR/Q8zN6KoHmP/XkhlMCSGoPt
         97oCt5OGPJqAqFF0xpOsf6nTjjD3unFLd+JcmtaFCdbr+Ud+qh4znm8IoTv5kE8fDa
         RqvvD89XbbVBZ5ET7c0vKkbOXk9VsAgTXLD0DE+A2mgajg/P/xFqBO8TxTgjYZGSCV
         AeSivml9QC31g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1A5D6C4332E; Fri,  3 Nov 2023 12:01:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Fri, 03 Nov 2023 12:01:42 +0000
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
Message-ID: <bug-218092-215701-kl4xqvuIkl@https.bugzilla.kernel.org/>
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

--- Comment #48 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
Before trying to sleep, I want to share some conf:

ertugruluyar@ertugruluyar-pc:~$ uname -a
Linux ertugruluyar-pc 6.6.0 #6 SMP PREEMPT_DYNAMIC Fri Nov  3 09:49:44 +03 =
2023
x86_64 x86_64 x86_64 GNU/Linux
ertugruluyar@ertugruluyar-pc:~$ sudo cat /sys/power/mem_sleep
[sudo] password for ertugruluyar:=20
s2idle [deep]
ertugruluyar@ertugruluyar-pc:~$ cat /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=3D0
GRUB_TIMEOUT_STYLE=3Dmenu
GRUB_TIMEOUT=3D5
GRUB_DISTRIBUTOR=3D`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT=3D"quiet splash"
GRUB_CMDLINE_LINUX=3D""

# Uncomment to enable BadRAM filtering, modify to suit your needs
# This works with Linux (no patch required) and with any kernel that obtains
# the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
#GRUB_BADRAM=3D"0x01234567,0xfefefefe,0x89abcdef,0xefefefef"

# Uncomment to disable graphical terminal (grub-pc only)
#GRUB_TERMINAL=3Dconsole

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command `vbeinfo'
#GRUB_GFXMODE=3D640x480

# Uncomment if you don't want GRUB to pass "root=3DUUID=3Dxxx" parameter to=
 Linux
#GRUB_DISABLE_LINUX_UUID=3Dtrue

# Uncomment to disable generation of recovery mode menu entries
#GRUB_DISABLE_RECOVERY=3D"true"

# Uncomment to get a beep at grub start
#GRUB_INIT_TUNE=3D"480 440 1"


Suspend result:
I tried both sleep button that KDE's app menu and closed my laptop lid (whi=
ch
is set to suspend). The result is issue happening like before. My laptop to=
ke a
bit more time to open, but not too much.

Should I try hibernate etc. options?
Is the issue related with this?:
ertugruluyar@ertugruluyar-pc:~$ sudo cat /sys/power/mem_sleep
[sudo] password for ertugruluyar:=20
s2idle [deep]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
