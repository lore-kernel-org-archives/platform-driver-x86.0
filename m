Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74175C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 16:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbiGKQgN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 12:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiGKQgM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 12:36:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31632CCA3
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 09:36:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4CDACB810AA
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 16:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8447C341CA
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657557368;
        bh=+BeXH3uonpS9O/GAfIGPphRND+Tl47NwRcQTcjaVN4w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DnyVulC/8VDsLUcoUKHCu5AJf/IOLHvl2Lmw+QNktM8n+jhA9WrHm1t2isCBl8n6b
         vuRA/PZhXirq1Q8fnw5prR+qKss9mFEKzHQxU8ItRv/F1gTyMEswJX9yv/yL/4xXtX
         qTqq6owKdqLbQ5HkqZB72sWC8v533uS/3U6076pjH0mTJi0JszzXMU4YkoGDerSenz
         7Llidv5SuDgFGUV7oarRrq2lvfXEcqj1VtuOdzeOGjHaG1j0ELKb1v5rHSuQ9eBLQb
         CMWv6eKlhpdhxW/4IOD22yWhf1Uof37A7qle7YlB1r8M2XCevczJmnApY3AaFsAo/2
         jMKm8FsQ4W/tw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CF3AFCC13B1; Mon, 11 Jul 2022 16:36:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 16:36:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-rkiIwCWA3a@https.bugzilla.kernel.org/>
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

--- Comment #8 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Although I'm afraid it won't be very interesting.

It might not be, but once we know the timing relative to pinctrl-amd loadin=
g we
can know if it's that.  If it's not, then our next step will be to crank up
ACPI debugging output to see if it correlates with an ACPI event.

> Okay. Would adding pinctrl_amd to initramfs be enough to rule out this
> possibility?

Yeah that or compiling it as built-in.

> I'm aware but I've been using this machine with forced ASPM for about 2 y=
ears
> with no apparent issues related to that. I'll give it a go.

I guess  the reason you do it is for improved power consumption.  I think y=
ou
should contrast how much you save with a watt meter and what devices forcing
ASPM actually changes.  If If you find that you have improved power consump=
tion
from something it's better to ask Lenovo to change the defaults in their BI=
OS.=20
They're more well equipped to do stress testing and analysis that PCIe is s=
till
performing properly using the proper equipment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
