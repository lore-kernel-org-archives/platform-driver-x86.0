Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD81C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Nov 2022 11:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiKIL0b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Nov 2022 06:26:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiKIL0a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Nov 2022 06:26:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8167C29820
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 03:26:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 19ACB619FE
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 11:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D291C433D7
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 11:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667993187;
        bh=w+N+y4taySlhajqArzMoFfiU0av0iPHcP40MviZxq4U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gjYZlfTPhtz0ApwH29O1EbuuYAe+MHJILrOBFsotAZVq1p9SAvnJUlZ9z36pV6Jr/
         rsPPNDrkLbTRfp+w71HnWWNeq0KhoNRaW9ZvhhTj6irQppDRZx+EW65B4UeQXkh5qI
         Vv7UZZpH/41uysMdHdKDK3DZcvD4xW0mzutyW+t3HhVDGlMZFpsnhU2sjNwO99cNBe
         jVO+riEq415i/mrig5ttLdotX6ygJoGPIfkFCP+akJu3O671YhCwdwQspAmjrFjP1y
         NK33TyckIRQqhzNxEWdJ0cJFhloHCr22fZuSLClW9mDk0iR0nyDv8MGpPpagHr/jqr
         ndM5MTjrpL8ew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5E0CEC433E4; Wed,  9 Nov 2022 11:26:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 111681] hp_accel.c malfunctions on HP Pavilion 13 x360 s128nr
Date:   Wed, 09 Nov 2022 11:26:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-111681-215701-Deo3MD0f0r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-111681-215701@https.bugzilla.kernel.org/>
References: <bug-111681-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D111681

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #9 from Artem S. Tashkinov (aros@gmx.com) ---
Looks like this is fixed?

input: Wireless hotkeys as /devices/virtual/input/input16
hp_accel: laptop model unknown, using default axes configuration
lis3lv02d: unknown sensor type 0x0
Consider using thermal netlink events interface
acpi INT33D6:00: intel-vbtn: created platform device
input: Intel Virtual Buttons as
/devices/pci0000:00/0000:00:1f.0/PNP0C09:01/INT33D6:01/input/input17
input: Intel Virtual Switches as
/devices/pci0000:00/0000:00:1f.0/PNP0C09:01/INT33D6:01/input/input18
input: Intel Virtual Buttons as /devices/platform/INT33D6:00/input/input19
input: Intel Virtual Switches as /devices/platform/INT33D6:00/input/input20
idma64 idma64.0: Found Intel integrated DMA 64-bit
mei_me 0000:00:16.0: enabling device (0000 -> 0002)
idma64 idma64.1: Found Intel integrated DMA 64-bit
i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
intel_rapl_common: Found RAPL domain package
intel_rapl_common: Found RAPL domain dram
i2c i2c-2: 2/2 memory slots populated (from DMI)
i2c i2c-2: Successfully instantiated SPD at 0x50

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
