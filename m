Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C36C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Nov 2023 14:55:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbjKCOzp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Nov 2023 10:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjKCOzo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 10:55:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF50AD48
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 07:55:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A71CC433C7
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699023338;
        bh=gKJ59Z8+CrCTqgrExPUPJcHzao4z5qEdZ7EB8S2MtKE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bHnDwOPoP7fOYUbHzR0dsvuXoYZYgV6s5iw1gSrNDch43mAMwN1ZsTka1lfR/BXHe
         zMgQ4dyf4OFoyfqYnf9W6zQeUcO/co1fXgf6nMiYwT2yVA17vPGz1AWimUrVGwEH9e
         eCzyVeJ0b2VnTh8Ksz5MGms1XRqMVoU2lSTDo42uVhD0H9wjfMMbQItU/nFBEpk2hm
         xRQB2/FV4cB7YtapTtqHn4JLRqemNaIJtxwJBG178IBhYe/gyy5da9iwHa5MO/4NNt
         O6Qq24555Ggm9pnpIBj5MkITUo2tgD3ZlDsSHr+MzJB/HYpF5GPGxJRCEDJx8s6sOY
         WE7+GwVzAHXTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2878FC4332E; Fri,  3 Nov 2023 14:55:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Fri, 03 Nov 2023 14:55:37 +0000
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
Message-ID: <bug-218092-215701-rFFko1IALK@https.bugzilla.kernel.org/>
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

--- Comment #54 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #53)
> It's in the BIOS if it's offered for your system. Lenovo calls it sleep m=
ode.
> If you have it set it to Windows.

My BIOS is restricted, I can't access all options. There is a custom UI. An=
d I
looked, but there is no option that sleep mode.
Should I try this:
https://www.reddit.com/r/pop_os/comments/fwfehh/comment/fmoih9d/ --> sudo
kernelstub -a "mem_sleep_default=3Ddeep"
OR
https://bbs.archlinux.org/viewtopic.php?pid=3D1917280#p1917280 -->
GRUB_CMDLINE_LINUX_DEFAULT=3D"quiet splash mem_sleep_default=3Ds2idle" and =
"sudo
apt update-grub" and "reboot".

Also should I try this with tuxedo's kernel? -->
GRUB_CMDLINE_LINUX_DEFAULT=3D"quiet splash mem_sleep_default=3Ds2idle"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
