Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BBDC43334
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 06:52:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbiGLGwX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 02:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbiGLGwU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 02:52:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100DA8E4C4
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 23:52:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 68837B816A7
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 06:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E6EBC3411E
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 06:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657608735;
        bh=rFGmIL1rbkWxNZjxn9KaMKTWQcP+BKCmUb45M3SfMac=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VRy5yKKlAPHXyJxmj53qHS3BtFSRdHqSfygGDEVkbComcKruXBog5t4AqI45znhPA
         Oq7njSmwtBC5Jj7ualBJlvOViSXB71VIqFFxv6+mhKPfIFMVu+i5G0ouFHB7508EA5
         Y/11uCfV15wYYHs0sKoiw5ApkLy2lkwawf3fGLARuyFuJ6SWjEPzf8bUNOsrBYVtDV
         /ID8Yt6nYJLXWzN7uKVEb4RyeH8bfdOXg8dEa9fKvOSLt/I/W3riy9ARMF9aER0Hvg
         ql3NX0Mxs1ORvR8dEGofUKGtCDZaVagKjQytLGQHfbvhBY9hAAFGD47Up9ZQMRtmW8
         UGmX2HpNb/Q+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E59F0C05FD2; Tue, 12 Jul 2022 06:52:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Tue, 12 Jul 2022 06:52:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-9WBqZs9M6j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

--- Comment #15 from madcatx@atlas.cz ---
I made a small discovery today. After adding pinctrl_amd module to my initr=
amfs
I haven't been able to reproduce the problem so far. That may not be indica=
tive
of anything because the problem does not appear every time. A bit more
interesting is my current output of /proc/interrupts. For IRQ9 it currently
shows

 9:          0      11461          0          0          0          0=20=20=
=20=20=20=20=20=20=20
0          0          0          0          0          0          0        =
  0=20
        0          0  IR-IO-APIC    9-fasteoi   acpi, pinctrl_amd

Notice that the number of recorded interrupts is around 11000. Before I add=
ed
pinctrl_amd to initramfs, there were two distinct cases. Either over 100000
interrupts with the kernel complaining about IRQ9 not being serviced or abo=
ut
90 interrupts and no apparent issues. All of these numbers are from
/proc/interrupts dump done right after logging into DE after a reboot.

I was able to reproduce these figures multiple times. This suggests that so=
me
HW starts to blast IRQs and doesn't stop until it gets serviced. Knowing th=
is,
is there anything else you'd like me to try besides your suggestions above?

My CONFIG_PINCTRL_AMD is set to CONFIG_PINCTRL_AMD=3Dm in my kernel config =
and
the respective module is loaded.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
