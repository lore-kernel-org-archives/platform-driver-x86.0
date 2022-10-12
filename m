Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCFAC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Oct 2022 17:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiJLRjL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Oct 2022 13:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiJLRjL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2022 13:39:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E8DC821A
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 10:39:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 33467B81A25
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 17:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D57FDC433D6
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 17:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665596347;
        bh=gRKtKuM0d0ou3zJPhqOyHSqmwuAWtzvB+6Lo8QH9+1A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hGUukZBZOzRH5fOq0ppLBE3/XOo/FFET3YIBYO0b0B6x6nivJ+NPOpQQ49AG2NpUt
         LQYM3DxrvtNscx9G4UXrvZGgadxbe2CUUe7XpRaPLJe+kR0VmYAfO5Tw+BAP1NOdwK
         5QKS2DpXE0piqg17EcpBFKvFd2pB20iEWPwhbzxnkSBxwEwSQZxrQSbxekcZ+mXbMA
         OOxP7YmmAmUbhekACeufRSPcy3RK+xmowAdXwJuAoHKnfWLCOQXEogoLCqO8qiFt47
         flEaph12HBrAEnl+rqh2ap8gi9qc4BKn1/7d3ej85LY6x3sK2dnhfovIAq0eTcNiG3
         DgCbvCBcCXZqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B3E7EC433E6; Wed, 12 Oct 2022 17:39:07 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Wed, 12 Oct 2022 17:39:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216516-215701-g3LduyaAHL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #34 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 302983
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D302983&action=3Dedit
kernel log for s2both with s2idle (hybrid sleep): v6.0

@Mario

I've got another related problem.
(just tell me if I should open another bug for that)

The system doesn't correctly enter s2both with s2idle. (a.k.a. "hybrid slee=
p")
Instead the system seems to do simply a s2disk.
So the system simply shuts down completely. And resumes from swapfile at po=
wer
on.

Correct behavior would be to write the memory to swapfile (like s2disk), but
then enter s2idle.
(the idea behind s2both is to prevent data loss if the battery is getting
drained while being in some suspend to memory)



What I do:
echo suspend > /sys/power/disk
echo disk > /sys/power/state

$ cat /sys/power/mem_sleep=20
[s2idle]

Behavior is independent of the settings in these files:
/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/power/wakeup
/sys/devices/platform/i8042/serio0/power/wakeup
/sys/devices/LNXSYSTM:00/LNXSYBUS:00/ACPI0003:00/power_supply/AC/power/wake=
up
/sys/module/acpi/parameters/ec_no_wakeup

Please see the attached kernel log.



I use s2both on a lot of systems, especially with AMD CPU+GPU. And it usual=
ly
works flawlessly. But these systems all use S3 instead of s2idle. And I
couldn't find if there's something extra to consider when using s2both with
s2idle.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
