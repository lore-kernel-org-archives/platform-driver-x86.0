Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55635C00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Aug 2022 15:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbiHJPGr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Aug 2022 11:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiHJPGr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Aug 2022 11:06:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CF660500
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 08:06:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A664E60EFC
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 15:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 100BDC433D6
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 15:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660144005;
        bh=9sEaFpuRa1HQLWJpMOjmAfXLkRvYb+SnYT1mqAFc9xs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SOV0ahYMEQ+TsYGS/krDnRwZDVff1zNhwqFLmu3Aeh5Fe+g1kjj/og5RnT5glP1Y4
         Vov/MT6PvUuIEmoagp0Yyb8xsuE7vGhoTpNI6ELxGUpLvN2ZuNW2YD4IyAgFbRxpOp
         a/Q2S1A5yknveg8qIrg6E0tuT9BVDCkW1FTwXC8mTUlr3c/v/6j4stwy6wN48RcCr9
         SAKgaKzbqvej8WgJclxjyuGoOvbq5FvGRvh3+NDrjuQzde0v4KrhwiEGcu6mzJDAzR
         kew4zkRoT9r1devhoBV+9X/4EkuhSHy3F7f4DzkRzJAYwIYnO9QHHRIW3ceiHP4B+q
         IiDRChyClS9Kw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E8BB2C433E7; Wed, 10 Aug 2022 15:06:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216347] ACPI power profile keeps switching to "low-power" on
 ThinkPad T14 Gen1 (AMD)
Date:   Wed, 10 Aug 2022 15:06:44 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216347-215701-I9Z3EeeTZ1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216347-215701@https.bugzilla.kernel.org/>
References: <bug-216347-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216347

--- Comment #3 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
If PPD isn't the cause maybe it's the firmware causing it?

If you can modify the kernel driver, can you please add some debugging
statement here to see if a related event is coming through:

https://github.com/torvalds/linux/blob/master/drivers/platform/x86/thinkpad=
_acpi.c#L11023

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
