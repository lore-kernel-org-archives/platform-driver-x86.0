Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC72C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 11:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbhLELeR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 06:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233191AbhLELeQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 06:34:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6EFC061714
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 03:30:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 49D5AB80E25
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 11:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 060A5C341D5
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 11:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638703847;
        bh=lOYUNODb2CDJBkQGdu5NEVkflT7jE4eHfjonkivIQJU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IL33+SjpnH2J4Qa8sAxUDIIEvnr4HHVBhJZ1o0X2zotcQfBXlvaEjLF1QG6qeQSZu
         ToZYpUUlxxkquKQwt4DbbwJNoMJqB5kUMZpqM7AYktUwSlj5amQ9P5X//wTxdpcg3A
         GePxjIiQoTeGR0QH8fmG4PTZvHUQmBiJYqs5MSKPm/aY7GtoW3CKGLPfA1LDd1aPke
         2deMj7FxNpCY5D9sMeLxpARIv8z+lp+8U4+j6+9R3BFXlEn0anP64gNr3v+elbXRc4
         vgSjZA2N13fD6MLm7jTW5VLErThj824CWzN6cK0+IKWwdcrzIkr2H3+qjtrkp4qN4w
         syfymBKRoUOJQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id EAEA8611C1; Sun,  5 Dec 2021 11:30:46 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 11:30:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-JqF6McB7VH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #180 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
> What do you have in dmesg when you load driver?

[11492.230845] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[11492.230925] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20210930/utaddress-204)
[11492.230937] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
